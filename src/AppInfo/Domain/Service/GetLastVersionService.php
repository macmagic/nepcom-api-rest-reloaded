<?php

declare(strict_types=1);

namespace App\AppInfo\Domain\Service;

use App\AppInfo\Domain\Repository\AppVersionRepository;
use App\AppInfo\Domain\Response\Response;

class GetLastVersionService
{
    /** @var AppVersionRepository */
    private $repository;

    public function __construct(AppVersionRepository $repository)
    {
        $this->repository = $repository;
    }

    public function __invoke()
    {
        return new Response($this->repository->findLastVersion());
    }
}
