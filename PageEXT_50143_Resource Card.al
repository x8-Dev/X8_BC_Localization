pageextension 50143 ResourceCardEXT extends "Resource Card"
{
    layout
    {
        addlast(Invoicing)
        {
            field("WHT Product Posting Group"; Rec."WHT Product Posting Group")
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