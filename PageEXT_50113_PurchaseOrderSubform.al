pageextension 50113 PurchaseOrderSubformEXT extends "Purchase Order Subform"
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
            field("WHT Amount"; Rec."WHT Amount")
            {
                ApplicationArea = All;
            }
            field("Net Amount"; Rec."Net Amount")
            {
                ApplicationArea = All;
            }
        }
        modify("Unit Price (LCY)")
        {
            trigger OnAfterValidate()
            begin
                TotalNetAmount := 0;
                TotalWHTAmount := 0;
                PurchaseLineRec.RESET;
                PurchaseLineRec.SetRange("Document No.", Rec."Document No.");
                IF PurchaseLineRec.FINDFIRST THEN
                    repeat
                        WHTPostingSetupRec.SetRange("WHT Business Posting Group", PurchaseLineRec."WHT Business Posting Group");
                        WHTPostingSetupRec.SetRange("WHT Product Posting Group", PurchaseLineRec."WHT Product Posting Group");
                        IF WHTPostingSetupRec.FINDFIRST THEN begin
                            IF WHTPostingSetupRec."Realized WHT Type" = WHTPostingSetupRec."Realized WHT Type"::Invoice THEN begin
                                IF PurchaseLineRec."VAT %" > 0 THEN begin
                                    PurchaseHeaderRec.SetRange("No.", PurchaseLineRec."Document No.");
                                    IF PurchaseHeaderRec."Prices Including VAT" = false Then begin
                                        TotalWHTAmount := TotalWHTAmount + (PurchaseLineRec."VAT Base Amount" * (WHTPostingSetupRec."WHT Percentage" / 100));
                                        TotalNetAmount := TotalNetAmount + (PurchaseLineRec."Amount Including VAT" - TotalWHTAmount);
                                    end;
                                end;
                            end;
                        end;
                    Until PurchaseLineRec.Next = 0;

                Rec."WHT Amount" := TotalWHTAmount;
                Rec."Net Amount" := TotalNetAmount;
            end;
        }
        modify(Quantity)
        {
            trigger OnAfterValidate()
            begin
                TotalNetAmount := 0;
                TotalWHTAmount := 0;
                PurchaseLineRec.RESET;
                PurchaseLineRec.SetRange("Document No.", Rec."Document No.");
                IF PurchaseLineRec.FINDFIRST THEN
                    repeat
                        WHTPostingSetupRec.SetRange("WHT Business Posting Group", PurchaseLineRec."WHT Business Posting Group");
                        WHTPostingSetupRec.SetRange("WHT Product Posting Group", PurchaseLineRec."WHT Product Posting Group");
                        IF WHTPostingSetupRec.FINDFIRST THEN begin
                            IF WHTPostingSetupRec."Realized WHT Type" = WHTPostingSetupRec."Realized WHT Type"::Invoice THEN begin
                                IF PurchaseLineRec."VAT %" > 0 THEN begin
                                    PurchaseHeaderRec.SetRange("No.", PurchaseLineRec."Document No.");
                                    IF PurchaseHeaderRec."Prices Including VAT" = false Then begin
                                        TotalWHTAmount := TotalWHTAmount + (PurchaseLineRec."VAT Base Amount" * (WHTPostingSetupRec."WHT Percentage" / 100));
                                        TotalNetAmount := TotalNetAmount + (PurchaseLineRec."Amount Including VAT" - TotalWHTAmount);
                                    end;
                                end;
                            end;
                        end;
                    Until PurchaseLineRec.Next = 0;

                Rec."WHT Amount" := TotalWHTAmount;
                Rec."Net Amount" := TotalNetAmount;
            end;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
        TotalWHTAmount: Decimal;
        TotalNetAmount: Decimal;
        TotalIncludingVAT: Decimal;
        WHTPostingSetupRec: Record "WHT Posting Set";
        PurchaseHeaderRec: Record "Purchase Header";
        PurchaseLineRec: Record "Purchase Line";

}