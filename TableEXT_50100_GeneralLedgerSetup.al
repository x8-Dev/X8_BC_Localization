tableextension 50100 GeneralLedgerSetupEXT extends "General Ledger Setup"
{
    fields
    {
        field(50101; "Enable Phil. With. Tax"; Boolean)
        {
            Caption = 'Enable Philippine Witholding Tax';
            DataClassification = ToBeClassified;
        }
        field(50102; "Manual Calc. of WHT Sales"; Boolean)
        {
            Caption = 'Manual Calculation of Withholding Tax for Sales';
            DataClassification = ToBeClassified;
        }
    }
}