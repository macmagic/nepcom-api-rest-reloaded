<?php

namespace App\Shared\Infraestructure\Bus\Query;


use App\Shared\Domain\Bus\Query\Query;
use App\Shared\Domain\Bus\Query\QueryBus;
use App\Shared\Domain\Bus\Query\Response;
use Symfony\Component\Messenger\Handler\HandlersLocator;
use Symfony\Component\Messenger\MessageBus;
use Symfony\Component\Messenger\Middleware\HandleMessageMiddleware;

class SymfonySyncQueryBus implements QueryBus
{
    /** @var MessageBus */
    private $messageBus;

    public function __construct(iterable $queryHandlers)
    {
        $this->messageBus = new MessageBus(
            [
                new HandleMessageMiddleware(
                   // new HandlersLocator(CallableFir)
                )
            ]
        );
    }

    public function ask(Query $query): ?Response
    {
        // TODO: Implement ask() method.
    }
}
