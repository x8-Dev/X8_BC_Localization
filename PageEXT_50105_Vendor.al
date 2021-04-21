pageextension 50105 VendorCardEXT extends "Vendor Card"
{
    layout
    {
        addafter("Posting Details")
        {
            field("WHT Business Posting Group"; Rec."WHT Business Posting Grp")
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