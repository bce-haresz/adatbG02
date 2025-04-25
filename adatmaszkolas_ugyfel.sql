CREATE TABLE UgyfelData
(
LOGIN varchar(50) PRIMARY KEY,
EMAIL text MASKED WITH (function = 'email()'),
NEV text MASKED WITH (Function = 'partial(1,"XXX",1)'),
SZULEV int MASKED WITH (Function = 'random(1,100)'),
NEM text,
CIM text MASKED WITH (Function = 'default()'),
)

INSERT INTO UgyfelData
SELECT * FROM Ugyfel

CREATE USER MaszkoltUser WITHOUT Login;
GRANT SELECT ON UgyfelData TO MaszkoltUser

EXECUTE AS User= 'MaszkoltUser';
SELECT * FROM UgyfelData
REVERT