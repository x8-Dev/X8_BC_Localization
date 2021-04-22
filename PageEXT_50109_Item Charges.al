pageextension 50109 ItemChargesEXT extends "Item Charges"
{
    layout
    {
        addafter("VAT Prod. Posting Group")
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