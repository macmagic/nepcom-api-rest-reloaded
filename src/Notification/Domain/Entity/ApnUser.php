<?php


namespace Notification\Domain\Entity;


class ApnUser
{
    /** @var int */
    private $id;

    /** @var string */
    private $user;

    /** @var string */
    private $token;

    /** @var int */
    private $lastSeen;

    /** @var bool */
    private $notificationGroupEnabled;

    /** @var bool */
    private $notificationEnabled;

    /** @var bool */
    private $vibrationGroupEnabled;

    /** @var bool */
    private $vibrationEnabled;

    /** @var string */
    private $soundType;

    public function __construct(int $id, string $user, string $token, int $lastSeen, bool $notificationGroupEnabled, bool $notificationEnabled, bool $vibrationGroupEnabled, bool $vibrationEnabled, string $soundType)
    {
        $this->id = $id;
        $this->user = $user;
        $this->token = $token;
        $this->lastSeen = $lastSeen;
        $this->notificationGroupEnabled = $notificationGroupEnabled;
        $this->notificationEnabled = $notificationEnabled;
        $this->vibrationGroupEnabled = $vibrationGroupEnabled;
        $this->vibrationEnabled = $vibrationEnabled;
        $this->soundType = $soundType;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getUser(): string
    {
        return $this->user;
    }

    public function getToken(): string
    {
        return $this->token;
    }

    public function getLastSeen(): int
    {
        return $this->lastSeen;
    }

    public function isNotificationGroupEnabled(): bool
    {
        return $this->notificationGroupEnabled;
    }

    public function isNotificationEnabled(): bool
    {
        return $this->notificationEnabled;
    }

    public function isVibrationGroupEnabled(): bool
    {
        return $this->vibrationGroupEnabled;
    }

    public function isVibrationEnabled(): bool
    {
        return $this->vibrationEnabled;
    }

    public function getSoundType(): string
    {
        return $this->soundType;
    }
}