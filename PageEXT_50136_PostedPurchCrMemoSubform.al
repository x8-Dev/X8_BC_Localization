pageextension 50136 PostedPurchCrMemoSubformEXT extends "Posted Purch. Cr. Memo Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("WHT Business Posting Group"; Rec."WHT Business Posting Group")
            {
                ApplicationArea = All;
            }
            field("WHT Product Posting Group"; Rec."WHT Product Posting Group")
            {
                ApplicationArea = All;
            }
        }
        addafter("Total Amount Incl. VAT")
        {
            field("WHT Amount"; decWHTAmount)
            {
                ApplicationArea = All;
            }
            field("Net Amount"; decNetAmount)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        bolOnOpenPage: Boolean;
        decNetAmount: Decimal;
        decWHTAmount: Decimal;
        recPurchaseLine: Record "Purchase Line";


    trigger OnOpenPage()

    begin
        bolOnOpenPage := true;
    end;

    trigger OnAfterGetRecord()

    begin
        if bolOnOpenPage = true then begin
            decNetAmount := 0;
            decWHTAmount := 0;
            recPurchaseLine.reset;
            recPurchaseLine.SetRange("Document No.", rec."Document No.");
            recPurchaseLine.SetRange("Document Type", recPurchaseLine."Document Type"::Invoice);
            if recPurchaseLine.find('-') then begin
                repeat
                    recPurchaseLine.CalcSums("WHT Amount");
                    recPurchaseLine.CalcSums("Net Amount");
                    decWHTAmount := recPurchaseLine."WHT Amount";
                    decNetAmount := recPurchaseLine."Net Amount";
                until recPurchaseLine.next = 0;
            end;
        end;
    end;
}