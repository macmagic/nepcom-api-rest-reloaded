<?php

declare(strict_types=1);

namespace App\Shared\Domain\Bus;

use App\Shared\Domain\Message;
use App\Shared\Domain\ValueObject\Uuid;

abstract class Request extends Message
{
    public function requestId(): Uuid
    {
        return $this->getMessageId();
    }
}
