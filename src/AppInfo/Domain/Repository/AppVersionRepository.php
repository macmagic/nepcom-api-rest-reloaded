<?php

declare(strict_types=1);

namespace AppInfo\Domain\Repository;

use AppInfo\Domain\Entity\AppVersion;

interface AppVersionRepository
{
    public function findLastVersion(): AppVersion;
}
