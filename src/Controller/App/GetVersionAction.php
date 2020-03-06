<?php

declare(strict_types=1);

namespace App\Controller\App;

use App\Application\GetVersion\GetVersionQuery;
use App\Shared\Domain\Bus\Query\QueryBus;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\SerializerInterface;

class GetVersionAction
{
    /** @var QueryBus */
    private $queryBus;

    /** @var SerializerInterface */
    private $serializer;

    public function __construct(QueryBus $queryBus, SerializerInterface $serializer)
    {
        $this->queryBus = $queryBus;
        $this->serializer = $serializer;
    }

    public function __invoke()
    {
        /** @var \Domain\Response\Response $result */
        $result = $this->queryBus->ask(new GetVersionQuery('1234'));

        return JsonResponse::fromJsonString(
            $this->serializer->serialize($result->getContent(), JsonEncoder::FORMAT)
        );
    }
}
