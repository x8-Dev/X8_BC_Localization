pageextension 50107 ItemEXT extends "Item Card"
{
    layout
    {
        addafter("Inventory Posting Group")
        {
            field("WHT Product Posting Group"; rec."WHT Product Posting Group")
            {
                ApplicationArea = All;
                ShowMandatory = true;
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