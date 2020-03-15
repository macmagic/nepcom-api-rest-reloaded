<?php


namespace Notification\Infrastructure\Persistence\Repository;


use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Notification\Domain\Entity\GcmUser;
use Notification\Domain\Repository\GcmUserRepository;

class GcmUserDoctrineRepository extends ServiceEntityRepository implements GcmUserRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, GcmUser::class);
    }

    public function findByUser(string $user): ?GcmUser
    {
        $query = $this->createQueryBuilder('gu')
            ->where('gc.user = :user')
            ->setParameter('user', $user)
            ->setMaxResults(1)
            ->getQuery();

        return $query->getOneOrNullResult();
    }
}