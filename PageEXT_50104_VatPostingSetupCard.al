pageextension 50104 "Vat Posting Setup Card" extends "VAT Posting Setup Card"
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