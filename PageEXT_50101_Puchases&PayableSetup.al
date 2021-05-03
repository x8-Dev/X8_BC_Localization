pageextension 50101 PurchasesAndPayablesSetupEXT extends "Purchases & Payables Setup"
{
    layout
    {
        addafter(General)
        {
            group("BIR Localization")
            {
                field("Enable Print of 2307"; Rec."Enable Print of 2307")
                {
                    ApplicationArea = All;
                }
                field("Post Dated Check - Purchase"; Rec."Post Dated Check - Purchase")
                {
                    ApplicationArea = All;
                }
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