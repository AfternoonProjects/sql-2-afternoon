-- ******** Problem #1 Questions and Solutions ******** --

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

-- Get all PlaylistTrack TrackIds where the playlist Name is Music.

-- Get all Track Names for PlaylistId 5.

-- Get all Track Names and the playlist Name that they're on ( 2 joins ).

-- Get all Track Names and Album Titles that are the genre "Alternative" ( 2 joins ).

-- ******** Problem #2 Questions and Solutions ******** --

-- ******** Problem #3 Questions and Solutions ******** --

-- ******** Problem #4 Questions and Solutions ******** --

-- ******** Problem #5 Questions and Solutions ******** --

-- ******** Problem #6 Questions and Solutions ******** --
