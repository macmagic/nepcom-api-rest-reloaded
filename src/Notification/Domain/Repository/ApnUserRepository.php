<?php


namespace Notification\Domain\Repository;

use Notification\Domain\Entity\ApnUser;

interface ApnUserRepository
{
    public function findByUser(string $user): ApnUser;
}