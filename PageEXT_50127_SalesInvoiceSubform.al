pageextension 50127 SalesInvoiceSubformEXT extends "Sales Invoice Subform"
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
}