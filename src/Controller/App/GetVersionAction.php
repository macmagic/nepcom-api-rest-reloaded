<?php

declare(strict_types=1);

namespace App\Controller\App;

use App\Application\GetVersion\GetVersionQuery;
use App\Shared\Domain\Bus\Query\QueryBus;
use Symfony\Component\HttpFoundation\Response;

class GetVersionAction
{
    /** @var QueryBus */
    private $queryBus;

    public function __construct(QueryBus $queryBus)
    {
        $this->queryBus = $queryBus;
    }

    public function __invoke()
    {
        $result = $this->queryBus->ask(new GetVersionQuery('1234'));

        return new Response($result, Response::HTTP_OK);
    }
}
