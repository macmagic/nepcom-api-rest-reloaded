<?php


namespace Notification\Domain\Repository;


use Notification\Domain\Entity\GcmUser;

interface GcmUserRepository
{
    public function findByUser(string $user): ?GcmUser;
}