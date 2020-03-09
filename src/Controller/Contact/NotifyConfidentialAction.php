<?php

declare(strict_types=1);

namespace App\Controller\Contact;

use App\Contact\Application\NotifyConfidential\NotifyConfidentialCommand;
use App\Shared\Domain\ValueObject\Uuid;
use App\Shared\Infrastructure\Api\ApiController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class NotifyConfidentialAction extends ApiController
{
    public function __invoke(Request $request)
    {
        $content = json_decode($request->getContent(), true);
        $from = $content['from'];
        $to = $content['to'];
        $status = $content['status'];

        $command = new NotifyConfidentialCommand(Uuid::random(), $from, $to, $status);
        $this->dispatch($command);

        return new Response('', Response::HTTP_CREATED);
    }
}
