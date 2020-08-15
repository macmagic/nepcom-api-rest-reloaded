<?php

declare(strict_types=1);

namespace AppInfo\Application\GetVersion;

use AppInfo\Domain\Service\GetLastVersionService;
use Shared\Domain\Bus\Query\QueryHandler;
use function Lambdish\Phunctional\apply;
use function Lambdish\Phunctional\pipe;

final class GetVersionQueryHandler implements QueryHandler
{
    /** @var mixed */
    private $service;

    public function __construct(GetLastVersionService $service)
    {
        $this->service = pipe($service, new AppVersionResponseConverter());
    }

    public function __invoke(GetVersionQuery $query): AppVersionResponse
    {
        return apply($this->service, []);
    }
}
