pageextension 50103 "Vat Posting Setup" extends "VAT Posting Setup"
{
    layout
    {
        addafter("Tax Category")
        {
            field("Vat Type"; Rec."Vat Type")
            {
                ApplicationArea = All;
            }
        }
    }
}