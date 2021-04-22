tableextension 50107 ResourceEXT extends Resource
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