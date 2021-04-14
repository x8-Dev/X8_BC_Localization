tableextension 50102 SalesAndReceivableEXT extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Post Dated Check - Sales"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch"."Template Type" WHERE("Template Type" = FILTER("Cash Receipts"));
        }
    }

    var
        myInt: Integer;
}