<?php

namespace App\Shared\Domain;


abstract class Message
{
    /** @var Uuid */
    private $messageId;

    public function __construct()
    {
    }
}
