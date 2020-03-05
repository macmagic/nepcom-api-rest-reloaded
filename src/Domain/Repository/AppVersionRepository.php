<?php

namespace App\Domain\Repository;

use App\Domain\Entity\AppVersion;

interface AppVersionRepository
{
    public function findLastVersion(): AppVersion;
}
