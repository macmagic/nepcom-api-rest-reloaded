<?php

declare(strict_types=1);

namespace App\Contact\Application\NotifyConfidential;

use App\Shared\Domain\Bus\Command\Command;
use App\Shared\Domain\ValueObject\Uuid;

class NotifyConfidentialCommand extends Command
{
    /** @var string */
    private $from;

    /** @var string */
    private $to;

    /** @var int */
    private $status;

    public function __construct(Uuid $commandId, string $from, string $to, int $status)
    {
        parent::__construct($commandId);
        $this->from = $from;
        $this->to = $to;
        $this->status = $status;
    }

    public function getFrom(): string
    {
        return $this->from;
    }

    public function getTo(): string
    {
        return $this->to;
    }

    public function getStatus(): int
    {
        return $this->status;
    }
}
