<?php

declare(strict_types=1);

namespace App\Shared\Domain;

abstract class Message
{
    /** @var Uuid */
    private $messageId;

    public function __construct()
    {
    }
}
