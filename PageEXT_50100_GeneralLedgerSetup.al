pageextension 50100 GeneralLedgerSetupEXT extends "General Ledger Setup"
{
    layout
    {
        addafter(General)
        {
            group("BIR Localization")
            {
                field("Enable Phil. With. Tax"; Rec."Enable Phil. With. Tax")
                {
                    ApplicationArea = all;
                }
                field("Manual Calc. of WHT Sales"; Rec."Manual Calc. of WHT Sales")
                {
                    ApplicationArea = all;
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