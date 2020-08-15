<?php

declare(strict_types=1);

namespace Shared\Domain\Bus;

use Shared\Domain\ValueObject\Uuid;

abstract class Message
{
    /** @var Uuid */
    private $messageId;

    public function __construct(Uuid $messageId)
    {
        $this->messageId = $messageId;
    }

    public function getMessageId(): Uuid
    {
        return $this->messageId;
    }
}
