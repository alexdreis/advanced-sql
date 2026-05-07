/* Target the AP table specifically */
USE AP
GO

/* Creates the sp_InvoiceDrillDown stored procedure with an optional parameter */
CREATE PROC sp_InvoiceDrillDown
	@InvID int = NULL
AS
/* Checks if the input is a null value */
IF @InvID IS NULL
	/* If a null value is present, return all data from invoices table */
	SELECT *
	FROM Invoices
/* Otherwise, select all data attached to an invoice number that matches the 
   inputted Invoice number */
ELSE
	SELECT	InvoiceID,
			VendorID,
			InvoiceNumber
			InvoiceDate,
			InvoiceTotal,
			PaymentTotal,
			CreditTotal,
			TermsID,
			InvoiceDueDate,
			PaymentDate
	FROM Invoices
	WHERE InvoiceID = @InvID