<?php

declare(strict_types=1);

namespace App\AppInfo\Domain\Response;

use App\AppInfo\Domain\Entity\AppVersion;

class Response implements \App\Shared\Domain\Bus\Query\Response
{
    /** @var AppVersion */
    private $entityData;

    public function __construct(AppVersion $entityData)
    {
        $this->entityData = $entityData;
    }

    public function getContent(): AppVersion
    {
        return $this->entityData;
    }
}
