<?php

declare(strict_types=1);

namespace Behat;

use Behat\Behat\Context\Context;
use Doctrine\Common\DataFixtures\Purger\ORMPurger;
use Doctrine\Common\Persistence\ManagerRegistry;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\Tools\SchemaTool;

class DatabaseContext implements Context
{
    /** @var ManagerRegistry */
    private $doctrine;

    /** @var EntityManagerInterface */
    private $entityManager;

    public function __construct(ManagerRegistry $doctrine)
    {
        $this->doctrine = $doctrine;

        /** @var EntityManagerInterface */
        $this->entityManager = $this->doctrine->getManager();

        /** @var EntityManagerInterface $em */
        $em = $this->doctrine->getManager();

        if ('pdo_sqlite' !== $em->getConnection()->getDriver()->getName()) {
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
        $this->entityManager->getConnection()->getConfiguration()->setSQLLogger(null);

        $purger = new ORMPurger($this->entityManager);
        if ('pdo_sqlite' === $this->entityManager->getConnection()->getDriver()->getName()) {
            $tableNames = $this->entityManager->getConnection()->getSchemaManager()->listTableNames();
            $purger->setPurgeMode(ORMPurger::PURGE_MODE_DELETE);
            $purger->purge();
            $resetIdsQuery = 'DELETE FROM sqlite_sequence WHERE name IN ("'.implode('", "', $tableNames).'");';
            $this->entityManager->getConnection()->query($resetIdsQuery);
        } else {
            $this->entityManager->getConnection()->query('SET FOREIGN_KEY_CHECKS = 0');
            $purger->setPurgeMode(ORMPurger::PURGE_MODE_TRUNCATE);
            $purger->purge();
            $this->entityManager->getConnection()->query('SET FOREIGN_KEY_CHECKS = 1');
        }
        $this->entityManager->clear();
    }
}
