<?php

declare(strict_types=1);

namespace App\AppInfo\Infrastructure\Persistence\Repository;

use App\AppInfo\Domain\Entity\AppVersion;
use App\AppInfo\Domain\Repository\AppVersionRepository;
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
        $query = $this->createQueryBuilder('a')
            ->orderBy('a.createDate', 'DESC')
            ->setMaxResults(1)
            ->getQuery();

        return $query->getOneOrNullResult();
    }
}
