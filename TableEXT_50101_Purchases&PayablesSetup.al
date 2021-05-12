tableextension 50101 "Purchases&PayablesSetupEXT" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50100; "Enable Print of 2307"; Boolean)
        {
            Caption = 'Enable Print of 2307 upon Post of Invoice';
            DataClassification = ToBeClassified;
        }
        field(50102; "Post Dated Check - Purchase"; Text[50])
        {
            Caption = 'Post Dated Check - Purchases';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name WHERE("Template Type" = FILTER(Payments));
        }
    }

    var
        myInt: Integer;
}