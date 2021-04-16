table 50102 "WHT Posting Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "WHT Business Posting Group"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WHT Business Posting Group";
        }
        field(2; "WHT Product Posting Group"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WHT Product Posting Group";
        }
        field(3; "WHT Percentage"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Realized WHT Type"; Enum "Realized WHT Type")
        {
            DataClassification = ToBeClassified;
        }
        field(5; "WHT Revenue Type"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WHT Product Posting Group";
        }
        field(6; "BIR Form"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Report Layout Selection";
        }
        field(7; "Prepaid WHT Account Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }

        field(8; "Bal. Prepaid Account Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(9; "Payable Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }

    }

    keys
    {
        /* key(Key1; MyField)
         {
             Clustered = true;
         }*/
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}