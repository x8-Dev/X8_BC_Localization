pageextension 50142 PaymentJournallEXT extends "Payment Journal"
{
    layout
    {
        addlast(Control1)
        {
            field("WHT Payment"; Rec."WHT Payment")
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