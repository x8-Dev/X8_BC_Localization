table 50104 "WHT Entries"
{
    Caption = 'WHT Entries';
    TableType = Normal;
    fields
    {
        field(50100; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;

        }
        field(50101; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;

        }
        field(50102; "Bill-to/ Pay-to No."; Code[20])
        {
            Caption = 'Bill-to/ Pay-to No.';
            DataClassification = ToBeClassified;

        }
        field(50103; "Name"; Text[250])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;

        }
        field(50104; "Document No"; Code[35])
        {
            Caption = 'Document No';
            DataClassification = ToBeClassified;

        }
        field(50105; "External Document No."; Code[35])
        {
            Caption = 'External Document No.';
            DataClassification = ToBeClassified;

        }
        field(50106; "Document Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;

        }
        field(50107; "Transaction Type"; text[50])
        {
            Caption = 'Transaction Type';
            DataClassification = ToBeClassified;

        }
        field(50108; "Base Amount"; Decimal)
        {
            Caption = 'Base Amount';
            DataClassification = ToBeClassified;

        }
        field(50109; "VAT Amount"; Decimal)
        {
            Caption = 'VAT Amount';
            DataClassification = ToBeClassified;

        }
        field(50110; "Withholding Amount"; Decimal)
        {
            Caption = 'Withholding Amount';
            DataClassification = ToBeClassified;

        }
        field(50111; "Net Amount"; Decimal)
        {
            Caption = 'Net Amount';
            DataClassification = ToBeClassified;

        }
        field(50112; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;

        }
        field(50113; "Base Amount (LCY)"; Decimal)
        {
            Caption = 'Document Type';
            DataClassification = ToBeClassified;

        }
        field(50114; "VAT Amount (LCY)"; Decimal)
        {
            Caption = 'VAT Amount (LCY)';
            DataClassification = ToBeClassified;

        }
        field(50115; "Withholding Amount (LCY)"; Decimal)
        {
            Caption = 'Withholding Amount (LCY)';
            DataClassification = ToBeClassified;

        }
        field(50116; "Net Amount (LCY)"; Decimal)
        {
            Caption = 'Net Amount (LCY)';
            DataClassification = ToBeClassified;

        }
        field(50117; "WHT Business Posting Group"; code[20])
        {
            Caption = 'WHT Business Posting Group';
            DataClassification = ToBeClassified;

        }
        field(50118; "WHT Product Posting Group"; Code[20])
        {
            Caption = 'WHT Product Posting Group';
            DataClassification = ToBeClassified;

        }
        field(50119; "WHT Revenue Type"; Code[10])
        {
            Caption = 'WHT Revenue Type';
            DataClassification = ToBeClassified;

        }
        field(50120; "WHT %"; Decimal)
        {
            Caption = 'WHT %';
            DataClassification = ToBeClassified;

        }
        field(50121; "Realized Base Amount"; Decimal)
        {
            Caption = 'Realized Base Amount';
            DataClassification = ToBeClassified;

        }
        field(50122; "Realized Amount"; Decimal)
        {
            Caption = 'Realized Amount';
            DataClassification = ToBeClassified;

        }
        field(50123; "Realized Base Amount (LCY)"; Decimal)
        {
            Caption = 'Realized Base Amount (LCY)';
            DataClassification = ToBeClassified;

        }
        field(50124; "Realized Amount (LCY)"; Decimal)
        {
            Caption = 'Realized Amount (LCY)';
            DataClassification = ToBeClassified;

        }
        field(50125; "Unrealized Base Amount"; Decimal)
        {
            Caption = 'Unrealized Base Amount';
            DataClassification = ToBeClassified;

        }
        field(50126; "Unrealized Amount"; Decimal)
        {
            Caption = 'Unrealized Amount';
            DataClassification = ToBeClassified;

        }
        field(50127; "Unrealized Base Amount (LCY)"; Decimal)
        {
            Caption = 'Unrealized Base Amount (LCY)';
            DataClassification = ToBeClassified;

        }
        field(50128; "Unrealized Amount (LCY)"; Decimal)
        {
            Caption = 'Unrealized Amount (LCY)';
            DataClassification = ToBeClassified;

        }
        field(50129; "Reversed"; Boolean)
        {
            Caption = 'Reversed';
            DataClassification = ToBeClassified;

        }
        field(50130; "Reversed by Entry No"; Integer)
        {
            Caption = 'Reversed by Entry No';
            DataClassification = ToBeClassified;
        }
    }

}