tableextension 50116 PurchCrMemoHdr extends "Purch. Cr. Memo Hdr."
{
    fields
    {
        field(50100; "WHT Business Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WHT Business Posting Group";
        }
    }

    var
        myInt: Integer;
}