pageextension 50112 PurchaseOrderEXT extends "Purchase Order"
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