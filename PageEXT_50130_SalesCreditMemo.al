pageextension 50130 SalesCreditMemoEXT extends "Sales Credit Memo"
{
    layout
    {
        addlast("Credit Memo Details")
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