tableextension 50104 VendorEXT extends Vendor
{
    fields
    {
        field(50100; "WHT Business Posting Group"; Blob)
        {
            Caption = 'WHT Business Posting Grp';
            DataClassification = ToBeClassified;
            ObsoleteState = Removed;
        }
        field(50101; "WHT Business Posting Grp"; Code[20])
        {
            Caption = 'WHT Business Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "WHT Business Posting Group";
        }
    }

    var
        myInt: Integer;
}