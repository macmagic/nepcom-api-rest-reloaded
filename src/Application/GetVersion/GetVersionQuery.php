<?php

declare(strict_types=1);

namespace App\Application\GetVersion;

use App\Shared\Domain\Bus\Query\Query;

class GetVersionQuery implements Query
{
    /** @var string */
    private $id;

    public function __construct(string $id)
    {
        $this->id = $id;
    }

    public function id(): string
    {
        return $this->id;
    }
}
