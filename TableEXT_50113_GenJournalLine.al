tableextension 50113 GenJournalLineEXT extends "Gen. Journal Line"
{
    fields
    {
        field(50100; "WHT Business Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WHT Business Posting Group";
        }
        field(50101; "WHT Product Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WHT Product Posting Group";
        }
        field(50102; "WHT Payment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}