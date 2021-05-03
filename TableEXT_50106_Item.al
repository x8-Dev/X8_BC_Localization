tableextension 50106 ItemEXT extends Item
{
    fields
    {
        field(50100; "WHT Business Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WHT Business Posting Group";
            ObsoleteState = Removed;
        }

        field(50101; "WHT Product Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "WHT Product Posting Group";

        }
    }

    var
        myInt: Integer;
}