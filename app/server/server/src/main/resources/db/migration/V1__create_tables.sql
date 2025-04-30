CREATE TABLE airports (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          airport_id INT NOT NULL UNIQUE,
                          airport_name VARCHAR(100) NOT NULL,
                          city VARCHAR(100) NOT NULL,
                          state CHAR(2) NOT NULL
);

CREATE TABLE flights (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         yy INT,
                         mm INT,
                         dm INT,
                         dw INT,
                         Carrier VARCHAR(2),
                         OriginAirportID INT,
                         DestAirportID INT,
                         CRSDepTime INT,
                         DepDelay INT,
                         DepDel15 INT,
                         CRSArrTime INT,
                         ArrDelay INT,
                         ArrDel15 INT,
                         Cancelled INT
);