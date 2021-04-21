pageextension 50106 CustomerCardEXT extends "Customer Card"
{
    layout
    {
        addafter(PostingDetails)
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