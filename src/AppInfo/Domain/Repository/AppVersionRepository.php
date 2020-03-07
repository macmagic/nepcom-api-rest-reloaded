<?php

declare(strict_types=1);

namespace App\AppInfo\Domain\Repository;

use App\AppInfo\Domain\Entity\AppVersion;

interface AppVersionRepository
{
    public function findLastVersion(): AppVersion;
}
