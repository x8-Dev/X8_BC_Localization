page 50105 "WHT Posting Setup List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "WHT Posting Setup";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("WHT Business Posting Group"; Rec."WHT Business Posting Group")
                {
                    ApplicationArea = All;
                }
                field("WHT Product Posting Group"; Rec."WHT Product Posting Group")
                {
                    ApplicationArea = All;
                }
                field("WHT Percentage"; Rec."WHT Percentage")
                {
                    ApplicationArea = All;
                }
                field("Realized WHT Type"; Rec."Realized WHT Type")
                {
                    ApplicationArea = All;
                }
                field("WHT Revenue Type"; Rec."WHT Revenue Type")
                {
                    ApplicationArea = All;
                }
                field("BIR Form"; Rec."BIR Form")
                {
                    ApplicationArea = All;
                }
                field("Prepaid WHT Account Code"; Rec."Prepaid WHT Account Code")
                {
                    ApplicationArea = All;
                }
                field("Bal. Prepaid Account Code"; Rec."Bal. Prepaid Account Code")
                {
                    ApplicationArea = All;
                }
                field("Payable Account"; Rec."Payable Account")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}