CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `3nfdrivercountry` AS
    SELECT 
        `drivercountry3nf`.`Name` AS `Name`,
        `drivercountry3nf`.`Surname` AS `Surname`,
        `drivercountry3nf`.`Country` AS `Country`
    FROM
        `drivercountry3nf`