tableextension 50107 ResourceEXT extends Resource
{
    fields
    {
        field(50100; "WHT Product Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            //TableRelation = "WHT Product Posting Group";
        }
    }

    var
        myInt: Integer;
}