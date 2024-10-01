SELECT LastName FROM Owner WHERE FirstName="Bruce";
SELECT * FROM Owner WHERE Age>=30;
SELECT Description FROM Thing WHERE Cost>100;
SELECT LastName FROM Owner, Thing WHERE Description="Cape" AND Owner.Initials=Thing.Initials;
SELECT FirstName, Description FROM Owner, Thing WHERE Cost<1000 AND Owner.Initials=Thing.Initials;
SELECT FirstName, LastName FROM Owner, City WHERE CityName="Metropolis" AND Owner.Initials=City.Initials;