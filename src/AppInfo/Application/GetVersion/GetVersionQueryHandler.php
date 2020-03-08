<?php

declare(strict_types=1);

namespace App\AppInfo\Application\GetVersion;

use App\AppInfo\Domain\Service\GetLastVersionService;
use App\Shared\Domain\Bus\Query\QueryHandler;
use AppInfo\Application\GetVersion\AppVersionResponse;
use AppInfo\Application\GetVersion\AppVersionResponseConverter;
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
