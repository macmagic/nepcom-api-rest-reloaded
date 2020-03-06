<?php

declare(strict_types=1);

namespace App\Infraestructure\Persistence\Repository;

use App\Domain\Entity\AppVersion;
use App\Domain\Repository\AppVersionRepository;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

class AppVersionDoctrineRepository extends ServiceEntityRepository implements AppVersionRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AppVersion::class);
    }


    public function findLastVersion(): AppVersion
    {
    }
}
