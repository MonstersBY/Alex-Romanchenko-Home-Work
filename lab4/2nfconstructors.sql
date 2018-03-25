CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `2nfconstructors` AS
    SELECT 
        `constructors3nf`.`Pos` AS `Pos`,
        `constructors3nf`.`Name` AS `Name`,
        `constructors3nf`.`Point` AS `Point`
    FROM
        `constructors3nf`