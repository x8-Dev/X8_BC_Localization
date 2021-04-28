tableextension 50119 SalesInvoiceLineEXT extends "Sales Invoice Line"
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