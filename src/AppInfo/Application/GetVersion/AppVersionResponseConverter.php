<?php


namespace App\AppInfo\Application\GetVersion;

use App\AppInfo\Domain\Entity\AppVersion;

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