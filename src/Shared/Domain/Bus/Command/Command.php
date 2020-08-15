<?php

declare(strict_types=1);

namespace Shared\Domain\Bus\Command;

use Shared\Domain\Bus\Request;
use Shared\Domain\ValueObject\Uuid;

abstract class Command extends Request
{
    public function commandId(): Uuid
    {
        return $this->requestId();
    }

    public function messageType(): string
    {
        return 'command';
    }
}
