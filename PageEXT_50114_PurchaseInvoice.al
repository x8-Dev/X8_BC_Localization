pageextension 50114 PurchaseInvoiceEXT extends "Purchase Invoice"
{
    layout
    {
        addlast("Invoice Details")
        {
            field("WHT Business Posting Group"; Rec."WHT Business Posting Group")
            {
                ApplicationArea = All;
            }
        }
        modify("Buy-from Vendor No.")
        {
            trigger OnAfterValidate()
            var
                myInt: Integer;
                VendorRec: Record Vendor;
            begin
                VendorRec.Reset;
                VendorRec.SetRange("No.", Rec."Buy-from Vendor No.");
                IF VendorRec.FindFirst() then begin
                    Rec."WHT Business Posting Group" := VendorRec."WHT Business Posting Grp";
                    Rec.Modify();
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
}