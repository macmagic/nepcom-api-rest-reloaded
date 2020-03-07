<?php


namespace Shared\Api;


use App\Shared\Domain\Bus\Command\CommandBus;
use App\Shared\Domain\Bus\Query\Query;
use App\Shared\Domain\Bus\Query\QueryBus;
use App\Shared\Domain\Bus\Query\Response;

class ApiController
{
    /** @var QueryBus */
    private $queryBus;

    /** @var CommandBus */
    private $commandBus;

    public function __construct(QueryBus $queryBus, CommandBus $commandBus)
    {
        $this->queryBus = $queryBus;
        $this->commandBus = $commandBus;
    }

    public function ask(Query $query): Response
    {
        return $this->queryBus->ask($query);
    }


}