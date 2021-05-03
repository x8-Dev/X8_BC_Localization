pageextension 50144 GLAccountCardEXT extends "G/L Account Card"
{
    layout
    {
        addlast(Posting)
        {
            field("WHT Business Posting Group"; rec."WHT Business Posting Group")
            {
                ApplicationArea = All;
                ShowMandatory = true;

            }
              field("WHT Product Posting Group"; Rec."WHT Product Posting Group")
            {
                ApplicationArea = All;
                ShowMandatory = true;

            }

        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}