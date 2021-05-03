tableextension 50122 GLAccountEXT extends "G/L Account"
{
    fields
    {
        field(50100; "WHT Business Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WHT Business Posting Group".code;
        }
        field(50101; "WHT Product Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WHT Product Posting Group".code;
        }
    }

    var
        myInt: Integer;
}