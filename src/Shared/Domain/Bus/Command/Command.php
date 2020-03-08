<?php

declare(strict_types=1);

namespace App\Shared\Domain\Bus\Command;

use App\Shared\Domain\Bus\Request;
use App\Shared\Domain\ValueObject\Uuid;

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
