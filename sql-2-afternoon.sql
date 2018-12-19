-- ******** Practice Joins Set #1 Questions and Solutions ******** --

-- Get all invoices where the UnitPrice on the InvoiceLine is greater than $0.99.

SELECT *
FROM Invoice i 
JOIN InvoiceLine il ON il.invoiceId = i.invoiceId
WHERE il.UnitPrice > 0.99;

-- Get the InvoiceDate, customer FirstName and LastName, and Total from all invoices.

SELECT i.InvoiceDate, c.FirstName, c.LastName, i.Total
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId;

-- Get the customer FirstName and LastName and the support rep's FirstName and LastName from all customers.

SELECT c.FirstName, c.LastName, e.FirstName, e.LastName
FROM Customer c
JOIN Employee e ON c.SupportRepId = e.EmployeeId;

-- Get the album Title and the artist Name from all albums.

SELECT al.Title, ar.Name
FROM Album al
JOIN Artist ar ON al.ARtistId = ar.ArtistId;

-- Get all PlaylistTrack TrackIds where the playlist Name is Music.

SELECT pt.TrackId
FROM PlaylistTrack pt
JOIN Playlist p ON p.PlaylistId = pt.PlaylistId
WHERE p.Name = 'Music';

-- Get all Track Names for PlaylistId 5.

SELECT t.Name
FROM Track t
JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId
WHERE pt.PlaylistId = 5;

-- Get all Track Names and the playlist Name that they're on ( 2 joins ).

SELECT t.name, p.Name
FROM Track t
JOIN PlaylistTrack pt ON t.TrackId = pt.TrackId
JOIN Playlist p ON pt.PlaylistId = p.PlaylistId;

-- Get all Track Names and Album Titles that are the genre "Alternative" ( 2 joins ).

SELECT t.name, a.title
FROM Track t
JOIN Album a ON t.AlbumId = a.AlbumId
JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = "Alternative";

-- ******** Practice Nested Queries Set #2 Questions and Solutions ******** --

-- Get all invoices where the UnitPrice on the InvoiceLine is greater than $0.99.

SELECT *
FROM Invoice
WHERE InvoiceId IN ( SELECT InvoiceId FROM InvoiceLine WHERE UnitPrice > 0.99 );

-- Get all Playlist Tracks where the playlist name is Music.

SELECT *
FROM PlaylistTrack
WHERE PlaylistId IN ( SELECT PlaylistId FROM Playlist WHERE Name = "Music" );

-- Get all Track names for PlaylistId 5.

SELECT Name
FROM Track
WHERE TrackId IN ( SELECT TrackId FROM PlaylistTrack WHERE PlaylistId = 5);

-- Get all tracks where the Genre is Comedy.

SELECT *
FROM Track
WHERE GenreId IN ( SELECT GenreId FROM Genre WHERE Name = "Comedy" );

-- Get all tracks where the Album is Fireball.

SELECT * 
FROM Track
WHERE AlbumId IN ( SELECT AlbumId FROM Album WHERE Title = "Fireball" );

-- Get all tracks for the artist Queen ( 2 nested subqueries ).

SELECT *
FROM Track
WHERE AlbumId IN (
	SELECT AlbumId FROM Album WHERE ArtistId IN (
    	SELECT ArtistID FROM Artist WHERE Name = "Queen"
    )
);

-- ******** Practice Updating Rows Set #3 Questions and Solutions ******** --

-- Find all customers with fax numbers and set those numbers to null.

UPDATE Customer
SET Fax = null
WHERE Fax IS NOT null;

-- Find all customers with no company (null) and set their company to "Self".

UPDATE Customer
SET Company = "Self"
WHERE Company IS null;

-- Find the customer Julia Barnett and change her last name to Thompson.

UPDATE Customer
SET LastName = "Thompson"
WHERE FirstName = "Julia" AND LastName = "Barnett";

-- Find the customer with this email luisrojas@yahoo.cl and change his support rep to 4.

UPDATE Customer
SET SupportRepId = 4
WHERE Email = "luisrojas@yahoo.cl";

-- Find all tracks that are the genre Metal and have no composer. Set the composer to "The darkness around us".

UPDATE Track
SET Composer = "The darkness around us"
WHERE GenreId = ( SELECT GenreId FROM Genre WHERE Name = "Metal" )
AND Composer IS null;

-- Refresh your page to remove all database changes.

-- ******** Practice Group By Set #4 Questions and Solutions ******** --

-- Find a count of how many tracks there are per genre. Display the genre name with the count.

SELECT Count(*), g.Name
FROM Track t
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name;

-- Find a count of how many tracks are the "Pop" genre and how many tracks are the "Rock" genre.

SELECT Count(*), g.Name
FROM Track t
JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = 'Pop' OR g.Name = 'Rock'
GROUP BY g.Name;

-- Find a list of all artists and how many albums they have.

SELECT ar.Name, Count(*)
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
GROUP BY al.Artistid;

-- ******** Practice Use Distinct Set #5 Questions and Solutions ******** --

-- From the Track table find a unique list of all Composers.

SELECT DISTINCT Composer
FROm Track;

-- From the Invoice table find a unique list of all BillingPostalCodes.

SELECT DISTINCT BillingPostalCode
FROM Invoice;

-- From the Customer table find a unique list of all Companys.

SELECT DISTINCT Company
FROM Customer;

-- ******** Practice Delete Rows Set #6 Questions and Solutions ******** --

-- Copy, paste, and run the SQL code from the summary.

CREATE TABLE practice_delete ( Name string, Type string, Value integer );
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "bronze", 50);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "bronze", 50);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "bronze", 50);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "silver", 100);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "silver", 100);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "gold", 150);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "gold", 150);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "gold", 150);
INSERT INTO practice_delete ( Name, Type, Value ) VALUES ("delete", "gold", 150);

SELECT * FROM practice_delete;

-- Delete all "bronze" entries from the table.

DELETE 
FROM practice_delete 
WHERE Type = "bronze";

-- Delete all "silver" entries from the table.

DELETE 
FROM practice_delete 
WHERE Type = "silver";

-- Delete all entries whose value is equal to 150.

DELETE 
FROM practice_delete 
WHERE Value = 150;