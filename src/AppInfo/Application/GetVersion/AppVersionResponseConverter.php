<?php

declare(strict_types=1);

namespace AppInfo\Application\GetVersion;

use AppInfo\Domain\Entity\AppVersion;

class AppVersionResponseConverter
{
    public function __invoke(AppVersion $appVersion): AppVersionResponse
    {
        return new AppVersionResponse(
            $appVersion->getLastVersion(),
            $appVersion->getCreateDate()
        );
    }
}
