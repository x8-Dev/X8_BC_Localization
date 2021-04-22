pageextension 50108 ResourceEXT extends "Resource List"
{
    layout
    {
        addafter("Default Deferral Template Code")
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