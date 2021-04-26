tableextension 50108 ItemChargesEXT extends "Item Charge"
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