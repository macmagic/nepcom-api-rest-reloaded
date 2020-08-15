<?php

declare(strict_types=1);

namespace AppInfo\Domain\Service;

use AppInfo\Domain\Entity\AppVersion;
use AppInfo\Domain\Repository\AppVersionRepository;

class GetLastVersionService
{
    /** @var AppVersionRepository */
    private $repository;

    public function __construct(AppVersionRepository $repository)
    {
        $this->repository = $repository;
    }

    public function __invoke(): AppVersion
    {
        return $this->repository->findLastVersion();
    }
}
