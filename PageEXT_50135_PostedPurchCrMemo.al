pageextension 50135 PostedPurchCrMemoEXT extends "Posted Purchase Credit Memo"
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