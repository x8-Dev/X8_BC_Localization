page 50108 "WHT Entries List"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "WHT Entries";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = All;

                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = All;

                }
                field("Bill-to/ Pay-to No."; rec."Bill-to/ Pay-to No.")
                {
                    ApplicationArea = All;

                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;

                }
                field("Document No"; rec."Document No")
                {
                    ApplicationArea = All;

                }
                field("External Document No."; rec."External Document No.")
                {
                    ApplicationArea = All;

                }
                field("Document Type"; rec."Document Type")
                {
                    ApplicationArea = All;

                }
                field("Transaction Type"; rec."Transaction Type")
                {
                    ApplicationArea = All;

                }
                field("Base Amount"; rec."Base Amount")
                {
                    ApplicationArea = All;

                }
                field("VAT Amount"; rec."VAT Amount")
                {
                    ApplicationArea = All;

                }
                field("Withholding Amount"; rec."Withholding Amount")
                {
                    ApplicationArea = All;

                }
                field("Net Amount"; rec."Net Amount")
                {
                    ApplicationArea = All;

                }
                field("Currency Code"; rec."Currency Code")
                {
                    ApplicationArea = All;

                }
                field("Base Amount (LCY)"; rec."Base Amount (LCY)")
                {
                    ApplicationArea = All;

                }
                field("VAT Amount (LCY)"; rec."VAT Amount (LCY)")
                {
                    ApplicationArea = All;

                }
                field("Withholding Amount (LCY)"; rec."Withholding Amount (LCY)")
                {
                    ApplicationArea = All;

                }
                field("Net Amount (LCY)"; rec."Net Amount (LCY)")
                {
                    ApplicationArea = All;

                }
                field("WHT Business Posting Group"; rec."WHT Business Posting Group")
                {
                    ApplicationArea = All;

                }
                field("WHT Product Posting Group"; rec."WHT Product Posting Group")
                {
                    ApplicationArea = All;

                }
                field("WHT Revenue Type"; rec."WHT Revenue Type")
                {
                    ApplicationArea = All;

                }
                field("WHT %"; rec."WHT %")
                {
                    ApplicationArea = All;

                }
                field("Realized Base Amount"; rec."Realized Base Amount")
                {
                    ApplicationArea = All;

                }
                field("Realized Amount"; rec."Realized Amount")
                {
                    ApplicationArea = All;

                }
                field("Realized Base Amount (LCY)"; rec."Realized Base Amount (LCY)")
                {
                    ApplicationArea = All;

                }
                field("Realized Amount (LCY)"; rec."Realized Amount (LCY)")
                {
                    ApplicationArea = All;

                }
                field("Unrealized Base Amount"; rec."Unrealized Base Amount")
                {
                    ApplicationArea = All;

                }
                field("Unrealized Amount"; rec."Unrealized Amount")
                {
                    ApplicationArea = All;

                }
                field("Unrealized Base Amount (LCY)"; rec."Unrealized Base Amount (LCY)")
                {
                    ApplicationArea = All;

                }
                field("Unrealized Amount (LCY)"; rec."Unrealized Amount (LCY)")
                {
                    ApplicationArea = All;

                }
                field(Reversed; rec.Reversed)
                {
                    ApplicationArea = All;

                }
                field("Reversed by Entry No"; rec."Reversed by Entry No")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}