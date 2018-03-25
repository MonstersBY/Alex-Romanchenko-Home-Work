CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `3nfconstructorscountry` AS
    SELECT 
        `constructorscountry3nf`.`Name` AS `Name`,
        `constructorscountry3nf`.`Country` AS `Country`
    FROM
        `constructorscountry3nf`