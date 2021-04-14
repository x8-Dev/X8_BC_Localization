pageextension 50102 SalesAndReceivableSetup extends "Sales & Receivables Setup"
{
    layout
    {
        addbefore("Stockout Warning")
        {
            field("Post Dated Check - Sales"; Rec."Post Dated Check - Sales")
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