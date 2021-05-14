pageextension 50138 PostedSalesInvoiceSubformEXT extends "Posted Sales Invoice Subform"
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
            field("WHT Amount"; decWHTAmountTotals)
            {
                ApplicationArea = All;
            }
            field("Net Amount"; decNetAmountTotals)
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
        decWHTAmountTotals: Decimal;
        decNetAmountTotals: Decimal;
        recWHTAmountTotals: Record "Sales Invoice Line";
        bolOnOpenPage: Boolean;


    trigger OnOpenPage()

    begin
        bolOnOpenPage := true;
    end;

    trigger OnAfterGetRecord()

    begin

        if bolOnOpenPage = true then begin
            decWHTAmountTotals := 0;
            decNetAmountTotals := 0;
            recWHTAmountTotals.reset;
            recWHTAmountTotals.SetRange("Document No.", rec."Document No.");
            if recWHTAmountTotals.find('-') then begin
                repeat
                    recWHTAmountTotals.CalcSums("WHT Amount");
                    recWHTAmountTotals.CalcSums("Net Amount");
                    decWHTAmountTotals := recWHTAmountTotals."WHT Amount";
                    decNetAmountTotals := recWHTAmountTotals."Net Amount";
                until recWHTAmountTotals.next = 0;
            end;

        end else begin

        end;

    end;
}