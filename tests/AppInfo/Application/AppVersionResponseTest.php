<?php

declare(strict_types=1);

namespace AppInfo\Application;

use App\AppInfo\Application\GetVersion\AppVersionResponse;
use App\AppInfo\Application\GetVersion\AppVersionResponseConverter;
use App\AppInfo\Domain\Entity\AppVersion;
use PHPUnit\Framework\TestCase;

class AppVersionResponseTest extends TestCase
{
    public function testAppVersionResponse(): void
    {
        $appVersion = new AppVersion(1, '22', new \DateTime());
        $converter = new AppVersionResponseConverter();
        $data = $converter->__invoke($appVersion);
        $appVersionResponse = new AppVersionResponse($data->getLastVersion(), $data->getCreateDate());

        self::assertEquals($appVersion->getCreateDate(), $appVersionResponse->getCreateDate());
        self::assertEquals($appVersion->getLastVersion(), $appVersionResponse->getLastVersion());
    }
}
