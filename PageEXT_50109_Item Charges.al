pageextension 50109 ItemChargesEXT extends "Item Charges"
{
    layout
    {
        addafter("VAT Prod. Posting Group")
        {
            field("WHT Product Posting Group"; Rec."WHT Product Posting Group")
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