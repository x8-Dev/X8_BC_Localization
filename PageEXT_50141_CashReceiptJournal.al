pageextension 50141 CashReceiptJournalEXT extends "Cash Receipt Journal"
{
    layout
    {
        addbefore("Posting Date")
        {
            field("WHT Payment"; Rec."WHT Payment")
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