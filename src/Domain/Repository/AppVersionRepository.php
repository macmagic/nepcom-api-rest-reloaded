<?php

declare(strict_types=1);

namespace App\Domain\Repository;

use App\Domain\Entity\AppVersion;

interface AppVersionRepository
{
    public function findLastVersion(): AppVersion;
}
