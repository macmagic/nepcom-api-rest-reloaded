<?php

declare(strict_types=1);

namespace App\Shared\Infrastructure\Api;

use App\Shared\Domain\Bus\Command\Command;
use App\Shared\Domain\Bus\Command\CommandBus;
use App\Shared\Domain\Bus\Query\Query;
use App\Shared\Domain\Bus\Query\QueryBus;
use App\Shared\Domain\Bus\Query\Response;
use Symfony\Component\Config\Definition\Exception\Exception;
use Symfony\Component\Serializer\Exception\ExceptionInterface;
use Symfony\Component\Serializer\Normalizer\NormalizerInterface;
use Symfony\Component\Serializer\SerializerInterface;

class ApiController
{
    /** @var QueryBus */
    private $queryBus;

    /** @var CommandBus */
    private $commandBus;

    /** @var SerializerInterface */
    private $serializer;

    /** @var NormalizerInterface */
    private $normalizer;

    public function __construct(QueryBus $queryBus, CommandBus $commandBus, SerializerInterface $serializer, NormalizerInterface $normalizer)
    {
        $this->queryBus = $queryBus;
        $this->commandBus = $commandBus;
        $this->serializer = $serializer;
        $this->normalizer = $normalizer;
    }

    protected function ask(Query $query): Response
    {
        return $this->queryBus->ask($query);
    }

    protected function dispatch(Command $command): void
    {
        $this->commandBus->dispatch($command);
    }

    protected function serialize($data, $format, array $context = [])
    {
        return $this->serializer->serialize($data, $format, $context);
    }

    protected function deserialize($data, $type, $format, array $context = [])
    {
        return $this->serializer->deserialize($data, $type, $format, $context);
    }

    protected function normalize($data, $format, $context = [])
    {
        try {
            return $this->normalizer->normalize($data, $format, $context);
        } catch (ExceptionInterface $ex) {
            throw new Exception($ex->getMessage());
        }
    }
}
