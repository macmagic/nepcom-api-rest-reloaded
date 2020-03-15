<?php


namespace Notification\Domain\Entity;


class GcmUser
{
    /** @var int */
    private $id;

    /** @var string */
    private $user;

    /** @var string */
    private $gcmKey;

    /** @var int */
    private $lastSeen;

    public function __construct(string $user, string $gcmKey, int $lastSeen)
    {
        $this->user = $user;
        $this->gcmKey = $gcmKey;
        $this->lastSeen = $lastSeen;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getUser(): string
    {
        return $this->user;
    }

    public function getGcmKey(): string
    {
        return $this->gcmKey;
    }

    public function getLastSeen(): int
    {
        return $this->lastSeen;
    }
}