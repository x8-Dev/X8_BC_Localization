pageextension 50113 PurchaseOrderSubformEXT extends "Purchase Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("WHT Business Posting Group"; Rec."WHT Business Posting Group")
            {
                ApplicationArea = All;
                trigger OnValidate()
                var
                    myInt: Integer;
                begin
                    GetTotalWHTAndNetAmount();
                end;

            }
            field("WHT Product Posting Group"; Rec."WHT Product Posting Group")
            {
                ApplicationArea = All;
                trigger OnValidate()
                var
                    myInt: Integer;
                begin
                    GetTotalWHTAndNetAmount();
                end;
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
        modify("Invoice Discount Amount")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
            begin
                //GetTotalWHTAndNetAmount();
            end;
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var
                ItemRec: Record Item;
                VendorRec: Record Vendor;
            begin
                ItemRec.Reset;
                ItemRec.SetRange("No.", Rec."No.");
                IF ItemRec.FindFirst Then begin
                    Rec."WHT Product Posting Group" := ItemRec."WHT Product Posting Group";
                    Rec.Modify();
                end;

                VendorRec.Reset;
                VendorRec.SetRange("No.", Rec."Buy-from Vendor No.");
                IF VendorRec.FindFirst then begin
                    Rec."WHT Business Posting Group" := VendorRec."WHT Business Posting Grp";
                    Rec.Modify();
                end;
            end;
        }
        modify("Unit Price (LCY)")
        {
            trigger OnAfterValidate()
            begin
                GetTotalWHTAndNetAmount();
            end;
        }
        modify(Quantity)
        {
            trigger OnAfterValidate()
            begin
                GetTotalWHTAndNetAmount();
            end;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    local procedure GetTotalWHTAndNetAmount()
    var
        PurchaseHeaderRec: Record "Purchase Header";
        PurchaseLineRec: Record "Purchase Line";
        decWHTAmountTotals: Decimal;
        recPurchaseLine: Record "Purchase Line";
    begin
        CurrPage.Update();
        Rec."WHT Amount" := 0;
        Rec."Net Amount" := 0;
        decWHTAmount := 0;
        decNetAmount := 0;
        decWHTAmountTotals := 0;
        decNetAmountTotals := 0;

        PurchaseHeaderRec.reset;
        PurchaseHeaderRec.SetRange("No.", rec."Document No.");
        PurchaseHeaderRec.SetRange("Document Type", PurchaseHeaderRec."Document Type"::"Order");
        if PurchaseHeaderRec.Find('-') then
            IF PurchaseHeaderRec."Prices Including VAT" = false Then begin

                PurchaseLineRec.reset;
                PurchaseLineRec.SetRange("Document No.", PurchaseHeaderRec."No.");
                if PurchaseLineRec.find('-') then begin
                    WHTPostingSetupRec.SetRange("WHT Business Posting Group", PurchaseLineRec."WHT Business Posting Group");
                    WHTPostingSetupRec.SetRange("WHT Product Posting Group", PurchaseLineRec."WHT Product Posting Group");
                    IF WHTPostingSetupRec.FIND('-') THEN begin
                        decWHTAmountTotals := PurchaseLineRec."VAT Base Amount" * (WHTPostingSetupRec."WHT Percentage" / 100);
                        decNetAmountTotals := PurchaseLineRec."Amount Including VAT" - decWHTAmountTotals;
                        rec."WHT Amount" := decWHTAmountTotals;
                        rec."Net Amount" := decNetAmountTotals;
                        CurrPage.Update();
                    end;
                end;
            end;

        decWHTAmountTotals := 0;
        recPurchaseLine.reset;
        recPurchaseLine.SetRange("Document No.", PurchaseHeaderRec."No.");
        if recPurchaseLine.find('-') then begin
            repeat
                recPurchaseLine.CalcSums("WHT Amount");
                recPurchaseLine.CalcSums("Net Amount");
                decWHTAmount := recPurchaseLine."WHT Amount";
                decNetAmount := recPurchaseLine."Net Amount";
                CurrPage.Update();
            until recPurchaseLine.next = 0;
        end;

    end;


    var
        myInt: Integer;
        TotalWHTAmount: Decimal;
        TotalNetAmount: Decimal;
        WHTPostingSetupRec: Record "WHT Posting Set";
        PurchaseHeaderRec: Record "Purchase Header";
        PurchaseLineRec: Record "Purchase Line";
        ItemRec: Record Item;
        VendorRec: Record Vendor;
        decWHTAmount: Decimal;
        decNetAmount: Decimal;
        bolOnOpenPage: Boolean;
        decWHTAmountTotals: Decimal;
        decNetAmountTotals: Decimal;
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
            recPurchaseLine.SetRange("Document Type", rec."Document Type"::Order);
            if recPurchaseLine.find('-') then begin
                repeat
                    decWHTAmount := decWHTAmount + recPurchaseLine."WHT Amount";
                    decNetAmount := decNetAmount + recPurchaseLine."Net Amount";
                until recPurchaseLine.next = 0;
            end;
        end;
    end;

}