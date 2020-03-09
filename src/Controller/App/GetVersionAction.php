<?php

declare(strict_types=1);

namespace App\Controller\App;

use App\AppInfo\Application\GetVersion\GetVersionQuery;
use App\Shared\Infrastructure\Api\ApiController;
use AppInfo\Application\GetVersion\AppVersionResponse;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\NameConverter\CamelCaseToSnakeCaseNameConverter;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;

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
