<?php

declare(strict_types=1);

namespace App\AppInfo\Application\GetVersion;

use App\AppInfo\Domain\Service\GetLastVersionService;
use App\Shared\Domain\Bus\Query\QueryHandler;
use App\AppInfo\Domain\Response\Response;
use function Lambdish\Phunctional\apply;

final class GetVersionQueryHandler implements QueryHandler
{
    /** @var mixed */
    private $service;

    public function __construct(GetLastVersionService $service)
    {
        $this->service = $service;
    }

    public function __invoke(GetVersionQuery $query): Response
    {
        return apply($this->service, [$query->id()]);
    }
}
