<?php


namespace Behat;

use Behat\Behat\Context\Context;
use Doctrine\Common\Persistence\ManagerRegistry;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Tools\SchemaTool;

class DatabaseContext implements Context
{
    /** @var ManagerRegistry */
    private $doctrine;

    private $entityManager;

    public function __construct(ManagerRegistry $doctrine)
    {
        $this->doctrine = $doctrine;

        /** @var EntityManagerInterface */
        $this->entityManager = $this->doctrine->getManager();

        /** @var EntityManagerInterface $em */
        $em = $this->doctrine->getManager();

        if('pdo_sqlite' !== $em->getConnection()->getDriver()->getName()) {
            throw new \RuntimeException(sprintf('Driver "%s" should be pdo_sqlite', $em->getConnection()->getDriver()->getName()));
        }

        $schemaTool = new SchemaTool($em);
        $classes = $em->getMetadataFactory()->getAllMetadata();
        $schemaTool->updateSchema($classes);
    }

    /**
     * @BeforeScenario
     */
    public function purgeDatabase(): void
    {
        //$this->entityManager->getConnection()
    }

}