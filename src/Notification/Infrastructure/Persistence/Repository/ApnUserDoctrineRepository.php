<?php


namespace Notification\Infrastructure\Persistence\Repository;


use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Notification\Domain\Entity\ApnUser;
use Notification\Domain\Repository\ApnUserRepository;

class ApnUserDoctrineRepository extends ServiceEntityRepository implements ApnUserRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ApnUser::class);
    }

    public function findByUser(string $user): ApnUser
    {
        $query = $this->createQueryBuilder('apn')
            ->where('apn.user = :user')
            ->setParameter('user', $user)
            ->setMaxResults(1)
            ->getQuery();

        return $query->getOneOrNullResult();
    }
}