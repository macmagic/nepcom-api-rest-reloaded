<?php

declare(strict_types=1);

namespace App\Infraestructure\Persistence\Repository;

use App\Domain\Entity\AppVersion;
use App\Domain\Repository\AppVersionRepository;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;

class AppVersionDoctrineRepository extends ServiceEntityRepository implements AppVersionRepository
{
    public function findLastVersion(): AppVersion
    {
    }
}
