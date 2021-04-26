pageextension 50126 SalesInvoiceEXT extends "Sales Invoice"
{
    layout
    {
        addlast("Invoice Details")
        {
            field("WHT Business Posting Group"; Rec."WHT Business Posting Group")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}