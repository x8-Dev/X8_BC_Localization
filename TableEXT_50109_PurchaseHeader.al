tableextension 50109 PurchaseHeaderEXT extends "Purchase Header"
{
    fields
    {
        field(50100; "WHT Business Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WHT Business Posting Group";
        }
        field(50101; "WHT Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Net Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}