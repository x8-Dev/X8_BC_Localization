pageextension 50127 SalesInvoiceSubformEXT extends "Sales Invoice Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("WHT Business Posting Group"; Rec."WHT Business Posting Group")
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    GetTotalWHTAndNetAmounts();
                end;
            }
            field("WHT Product Posting Group"; Rec."WHT Product Posting Group")
            {
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    GetTotalWHTAndNetAmounts();
                end;
            }
        }

        addafter("Total Amount Incl. VAT")
        {
            field("Total WHT"; decWHTAmountTotals)
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Total Net Amount"; decNetAmountTotals)
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        modify("Unit Price")
        {
            trigger OnAfterValidate()
            begin
                GetTotalWHTAndNetAmounts();
            end;
        }
        modify(Quantity)
        {
            trigger OnAfterValidate()
            begin
                GetTotalWHTAndNetAmounts();
            end;
        }
        modify("No.")
        {
            trigger OnAfterValidate()

            begin
                CurrPage.Update();

                recItems.reset;
                recItems.SetRange("No.", rec."No.");
                if recitems.FIND('-') then begin

                    SalesLineRec.reset;
                    SalesLineRec.SetRange("Document Type", SalesLineRec."Document Type"::Invoice);
                    SalesLineRec.SetRange("Document No.", rec."Document No.");
                    SalesLineRec.SetRange("No.", recitems."No.");
                    SalesLineRec.SetRange("Line No.", rec."Line No.");
                    if SalesLineRec.FIND('-') then begin

                        Rec."WHT Product Posting Group" := recItems."WHT Product Posting Group";
                        CurrPage.Update();
                    end;

                    recCustomer.Reset();
                    recCustomer.SetRange("No.", rec."Sell-to Customer No.");
                    if recCustomer.FIND('-') then begin

                        SalesLineRec.reset;
                        SalesLineRec.SetRange("Document Type", SalesLineRec."Document Type"::Invoice);
                        SalesLineRec.SetRange("Document No.", rec."Document No.");
                        SalesLineRec.SetRange("No.", recitems."No.");
                        SalesLineRec.SetRange("Line No.", rec."Line No.");
                        if SalesLineRec.FIND('-') then begin

                            Rec."WHT Business Posting Group" := recCustomer."WHT Business Posting Group";
                            CurrPage.Update();
                        end;
                    end;
                end;
            end;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    local procedure GetTotalWHTAndNetAmounts()

    var

    begin
        CurrPage.Update();
        Rec."WHT Amount" := 0;
        Rec."Net Amount" := 0;
        decWHTAmount := 0;
        decNetAmount := 0;
        decWHTAmountTotals := 0;
        decNetAmountTotals := 0;

        SalesHeaderRec.reset;
        SalesHeaderRec.SetRange("No.", rec."Document No.");
        SalesHeaderRec.SetRange("Document Type", SalesHeaderRec."Document Type"::Invoice);
        if SalesHeaderRec.Find('-') then
            SalesLineRec.reset;
        SalesLineRec.SetRange("Document No.", SalesHeaderRec."No.");
        SalesLineRec.SetRange("Line No.", rec."Line No.");
        if SalesLineRec.find('-') then begin

            WHTPostingSetupRec.SetRange("WHT Business Posting Group", SalesLineRec."WHT Business Posting Group");
            WHTPostingSetupRec.SetRange("WHT Product Posting Group", SalesLineRec."WHT Product Posting Group");
            IF WHTPostingSetupRec.FIND('-') THEN begin
                decWHTAmount := decWHTAmount + (SalesLineRec."VAT Base Amount" * (WHTPostingSetupRec."WHT Percentage" / 100));
                decNetAmount := decNetAmount + (SalesLineRec."Amount Including VAT" - decWHTAmount);
                rec."WHT Amount" := decWHTAmount;
                rec."Net Amount" := decNetAmount;
                CurrPage.Update();
            end;
        end;

        decWHTAmountTotals := 0;
        decNetAmountTotals := 0;
        recWHTAmountTotals.reset;
        recWHTAmountTotals.SetRange("Document No.", SalesHeaderRec."No.");
        if recWHTAmountTotals.find('-') then begin
            repeat
                recWHTAmountTotals.CalcSums("WHT Amount");
                recWHTAmountTotals.CalcSums("Net Amount");
                decWHTAmountTotals := recWHTAmountTotals."WHT Amount";
                decNetAmountTotals := recWHTAmountTotals."Net Amount";
                CurrPage.Update();
            until recWHTAmountTotals.next = 0;
        end;
    end;

    var
        myInt: Integer;

        WHTPostingSetupRec: Record "WHT Posting Set";

        SalesHeaderRec: Record "Sales Header";

        SalesLineRec: Record "Sales Line";

        decWHTAmount: Decimal;

        decNetAmount: Decimal;

        decWHTAmountTotals: Decimal;

        decNetAmountTotals: Decimal;

        recWHTAmountTotals: Record "Sales Line";
        recItems: Record Item;
        recCustomer: Record Customer;
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
            recWHTAmountTotals.SetRange("Document Type", rec."Document Type"::Invoice);
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