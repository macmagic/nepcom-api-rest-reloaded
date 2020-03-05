<?php

namespace App\Domain\Entity;

class AppVersion
{
    /** @var string */
    private $lastVersion;

    /** @var DateTime */
    private $createDate;

    public function __construct(string $lastVersion, DateTime $createDate)
    {
        $this->lastVersion = $lastVersion;
        $this->createDate = $createDate;
    }

    public function getLastVersion(): string
    {
        return $this->lastVersion;
    }

    public function getCreateDate(): DateTime
    {
        return $this->createDate;
    }
}
