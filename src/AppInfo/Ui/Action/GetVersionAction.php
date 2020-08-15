<?php

declare(strict_types=1);

namespace AppInfo\Ui\Action;

use AppInfo\Application\GetVersion\AppVersionResponse;
use AppInfo\Application\GetVersion\GetVersionQuery;
use Shared\Infrastructure\Api\ApiController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\Encoder\JsonEncoder;

class GetVersionAction extends ApiController
{
    public function __invoke()
    {
        /** @var AppVersionResponse $result */
        $result = $this->ask(new GetVersionQuery());

        return JsonResponse::fromJsonString(
            $this->serialize($result, JsonEncoder::FORMAT)
        );
    }
}
