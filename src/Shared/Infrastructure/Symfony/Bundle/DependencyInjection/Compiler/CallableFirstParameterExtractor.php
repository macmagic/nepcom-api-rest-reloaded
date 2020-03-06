<?php

declare(strict_types=1);

namespace App\Shared\Infrastructure\Symfony\Bundle\DependencyInjection\Compiler;

use App\Shared\Domain\Bus\Event\DomainEventSubscriber;
use function Lambdish\Phunctional\map;
use function Lambdish\Phunctional\reduce;
use function Lambdish\Phunctional\reindex;

final class CallableFirstParameterExtractor
{
    public function extract(callable $class): ?string
    {
        $reflector = new \ReflectionClass($class);
        $method = $reflector->getMethod('__invoke');

        if ($this->hasOnlyOneParameter($method)) {
            return $this->firstParameterClassFrom($method);
        }

        return null;
    }

    public static function forCallables(iterable $callables): array
    {
        return map(self::unflatten(), reindex(self::classExtractor(new self()), $callables));
    }

    public static function forPipedCallables(iterable $callables): array
    {
        return reduce(self::pipedCallablesReducer(), $callables);
    }

    private function firstParameterClassFrom(ReflectionMethod $method): string
    {
        /** @var ReflectionClass $reflectionClass */
        $reflectionClass = $method->getParameters()[0]->getClass();

        return $reflectionClass->getName();
    }

    private function hasOnlyOneParameter(ReflectionMethod $method): bool
    {
        return 1 === $method->getNumberOfParameters();
    }

    private static function classExtractor(self $parameterExtractor): callable
    {
        return function (callable $handler) use ($parameterExtractor): ?string {
            return $parameterExtractor->extract($handler);
        };
    }

    private static function unflatten(): callable
    {
        return function ($value) {
            return [$value];
        };
    }

    private static function pipedCallablesReducer(): callable
    {
        return function ($subscribers, DomainEventSubscriber $subscriber): array {
            $subscribedEvents = $subscriber::subscribedTo();

            foreach ($subscribedEvents as $subscribedEvent) {
                $subscribers[$subscribedEvent][] = $subscriber;
            }

            return $subscribers;
        };
    }
}
