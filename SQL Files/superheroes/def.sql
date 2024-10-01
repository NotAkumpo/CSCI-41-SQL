CREATE TABLE Owner(
  Initials VARCHAR(2) PRIMARY KEY,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Age INT(3)
  );
  
CREATE TABLE Thing(
  CatNum VARCHAR(4) PRIMARY KEY,
  Description VARCHAR(255),
  Cost DOUBLE(10,2),
  Initials VARCHAR(2),
  FOREIGN KEY (Initials)
  REFERENCES Owner(Initials)
  );
   
CREATE TABLE City(
  Initials VARCHAR(2),
  FOREIGN KEY (Initials)
  REFERENCES Owner(Initials),
  CityCode VARCHAR(2),
  CityName VARCHAR(14)
  );
   
   INSERT INTO Owner VALUES ("CK", "Clark", "Kent", 35);
   INSERT INTO Owner VALUES ("BW", "Bruce", "Wayne", 30);
   INSERT INTO Owner VALUES ("BB", "Bruce", "Banner", 20);
   INSERT INTO Owner VALUES ("LL", "Lois", "Lane", 12);
   
   INSERT INTO Thing VALUES ("BM11", "Bat Mobile", 999999.99, "BW");
   INSERT INTO Thing VALUES ("CP01", "Cape", 100.00, "CK");
   INSERT INTO Thing VALUES ("CP02", "Cape", 100.00, "BW");
   INSERT INTO Thing VALUES ("UB00", "Utility Belt", 1111.11, "BW");
   INSERT INTO Thing VALUES ("EG00", "Eye Glasses", 99.00, "CK");
   INSERT INTO Thing VALUES ("EG01", "Eye Glasses", 99.00, "LL");
   
   INSERT INTO City VALUES ("BW", "GT", "Gotham");
   INSERT INTO City VALUES ("CK", "MP", "Metropolis");
   INSERT INTO City VALUES ("LL", "MP", "Metropolis");
   INSERT INTO City VALUES ("BB", "NY", "New York");
  