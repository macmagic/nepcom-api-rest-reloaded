<?php

declare(strict_types=1);

namespace AppInfo\Domain\Entity;

use DateTime;

class AppVersion
{
    /** @var int */
    private $id;

    /** @var string */
    private $lastVersion;

    /** @var DateTime */
    private $createDate;

    public function __construct(int $id, string $lastVersion, DateTime $createDate)
    {
        $this->id = $id;
        $this->lastVersion = $lastVersion;
        $this->createDate = $createDate;
    }

    public function getId(): int
    {
        return $this->id;
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
