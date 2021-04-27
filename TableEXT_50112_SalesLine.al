tableextension 50112 SalesLineEXT extends "Sales line"
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
        field(50102; "WHT Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Total WHT';

        }
        field(50103; "Net Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Total Net Amount';
        }
    }


    var
        myInt: Integer;
}