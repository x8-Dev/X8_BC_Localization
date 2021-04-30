pageextension 50129 SalesReturnOrderSubformEXT extends "Sales Return Order Subform"
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
            field("WHT Amount"; rec."WHT Amount")
            {
                ApplicationArea = All;

            }
            field("Net Amount"; rec."Net Amount")
            {
                ApplicationArea = All;

            }

        }
        modify("Unit Price")
        {
            trigger OnAfterValidate()
            begin
                if rec."Unit Price" = 0 then begin

                end else begin

                    Rec."WHT Amount" := 0;
                    Rec."Net Amount" := 0;

                    SalesHeaderRec.reset;
                    SalesHeaderRec.SetRange("No.", rec."Document No.");
                    if SalesHeaderRec.FindFirst() then begin

                        IF SalesHeaderRec."Prices Including VAT" = false Then begin

                            SalesLineRec.reset;
                            SalesLineRec.SetRange("Document No.", SalesHeaderRec."No.");
                            if SalesLineRec.find('-') then begin
                                repeat

                                    WHTPostingSetupRec.SetRange("WHT Business Posting Group", SalesLineRec."WHT Business Posting Group");
                                    WHTPostingSetupRec.SetRange("WHT Product Posting Group", SalesLineRec."WHT Product Posting Group");
                                    IF WHTPostingSetupRec.FIND('-') THEN begin

                                        Message(format(SalesLineRec."VAT Base Amount"));
                                        decWHTAmount := SalesLineRec."VAT Base Amount" * (WHTPostingSetupRec."WHT Percentage" / 100);

                                        rec."WHT Amount" += decWHTAmount;

                                        decNetAmount := SalesLineRec."Amount Including VAT" - SalesLineRec."WHT Amount";

                                        rec."Net Amount" += decNetAmount;

                                    end;

                                until SalesLineRec.next = 0;
                            end;

                        end else begin

                        end;
                    end;

                end;

            end;

        }
        modify(Quantity)
        {
            trigger OnAfterValidate()
            begin
                WHTPostingSetupRec.SetRange("WHT Business Posting Group", Rec."WHT Business Posting Group");
                IF WHTPostingSetupRec.FINDFIRST THEN begin
                    IF WHTPostingSetupRec."Realized WHT Type" = WHTPostingSetupRec."Realized WHT Type"::Invoice THEN begin
                        IF Rec."VAT %" > 0 THEN begin
                            SalesHeaderRec.SetRange("No.", Rec."Document No.");
                            IF SalesHeaderRec."Prices Including VAT" = false Then begin
                                Rec."WHT Amount" := Rec."VAT Base Amount" * (WHTPostingSetupRec."WHT Percentage" / 100);
                                Rec."Net Amount" := Rec."Amount Including VAT" - Rec."WHT Amount";
                            end;
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

    var
        myInt: Integer;
        WHTPostingSetupRec: Record "WHT Posting Set";
        SalesHeaderRec: Record "Sales Header";
        SalesLineRec: Record "Sales Line";
        decWHTAmount: Decimal;
        decNetAmount: Decimal;
}
