<?php

declare(strict_types=1);

namespace App\Controller\App;

use Symfony\Component\HttpFoundation\Response;

class GetVersionAction
{
    public function __invoke()
    {
        return new Response('', Response::HTTP_OK);
    }
}
