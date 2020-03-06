<?php

declare(strict_types=1);

namespace App\Domain\Service;

use App\Domain\Repository\AppVersionRepository;
use Domain\Response\Response;

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
