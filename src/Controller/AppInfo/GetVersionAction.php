<?php

declare(strict_types=1);

namespace App\Controller\AppInfo;

use App\AppInfo\Application\GetVersion\AppVersionResponse;
use App\AppInfo\Application\GetVersion\GetVersionQuery;
use App\Shared\Infrastructure\Api\ApiController;
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
