CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `1nfdriver` AS
    SELECT 
        `driver1nf`.`Pos` AS `Pos`,
        `driver1nf`.`DriverCountry` AS `DriverCountry`,
        `driver1nf`.`Name` AS `Name`,
        `driver1nf`.`Surname` AS `Surname`,
        `driver1nf`.`PointsDriver` AS `PointsDriver`,
        `driver1nf`.`Constructors` AS `Constructors`,
        `driver1nf`.`PointsConstructors` AS `PointsConstructors`,
        `driver1nf`.`PosConstructors` AS `PosConstructors`,
        `driver1nf`.`ConstructorsCountry` AS `ConstructorsCountry`
    FROM
        `driver1nf`