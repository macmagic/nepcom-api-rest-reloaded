<?php


namespace App\Shared\Infrastructure\Bus\Command;

use App\Shared\Domain\Bus\Command\Command;
use App\Shared\Domain\Bus\Command\CommandBus;
use App\Shared\Infrastructure\Symfony\Bundle\DependencyInjection\Compiler\CallableFirstParameterExtractor;
use Symfony\Component\Messenger\Handler\HandlersLocator;
use Symfony\Component\Messenger\MessageBus;
use Symfony\Component\Messenger\Middleware\HandleMessageMiddleware;

class SymfonySyncCommandBus implements CommandBus
{
    /** @var MessageBus */
    private $bus;

    public function __construct(iterable $commandHandlers)
    {
        $this->bus = new MessageBus(
            [
                new HandleMessageMiddleware(
                    new HandlersLocator(CallableFirstParameterExtractor::forCallables($commandHandlers))
                )
            ]
        );
    }

    public function dispatch(Command $command): void
    {
        $this->bus->dispatch($command);
    }
}