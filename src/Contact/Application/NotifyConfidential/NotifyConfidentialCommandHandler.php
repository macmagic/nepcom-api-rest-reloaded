<?php

declare(strict_types=1);

namespace App\Contact\Application\NotifyConfidential;

use App\Contact\Domain\Service\NotifyConfidentialService;
use App\Shared\Domain\Bus\Command\CommandHandler;

class NotifyConfidentialCommandHandler implements CommandHandler
{
    /** @var mixed */
    private $service;

    public function __construct(NotifyConfidentialService $service)
    {
        $this->service = $service;
    }

    public function __invoke(NotifyConfidentialCommand $command)
    {
        $this->service->publishNotifyConfidential($command->getFrom(), $command->getTo(), $command->getStatus());
    }
}
