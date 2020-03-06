<?php


namespace Domain\Response;


use App\Domain\Entity\AppVersion;

class Response implements \App\Shared\Domain\Bus\Query\Response
{
    /** @var AppVersion */
    private $entityData;

    public function __construct(AppVersion $entityData)
    {
        $this->entityData = $entityData;
    }

    public function getContent(): AppVersion
    {
        return $this->entityData;
    }
}