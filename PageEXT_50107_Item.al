pageextension 50107 ItemEXT extends "Item Card"
{
    layout
    {
        addafter("Inventory Posting Group")
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