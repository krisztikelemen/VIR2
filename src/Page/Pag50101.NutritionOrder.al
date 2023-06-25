/// <summary>
/// Page Nutrition Order (ID 50101).
/// </summary>
page 50101 "Nutrition Order"
{
    Caption = 'Taplalkozas adatai';
    PageType = Document;
    SourceTable = "Nutrition Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Alapveto adatok';

                field("Nutrition No."; Rec."Nutrition No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Taplalkozasi Szam field.';
                    ShowMandatory = true;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vevo Szam field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vevo Neve field.';
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Datum field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Statusz field.';
                }
                field("Total Protein"; Rec."Total Protein")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total Fat"; Rec."Total Fat")
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Total Carbohydrate"; Rec."Total Carbohydrate")
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Total KJ"; Rec."Total KJ")
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Total Kcal"; Rec."Total Kcal")
                {
                    ApplicationArea = All;
                    Editable = false;

                }
            }
            part(Lines; "Nutrition Order Subform")
            {
                SubPageLink = "Nutrition No." = field("Nutrition No.");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Close)
            {
                Caption = 'Taplalkozas lezarasa';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    NutritionActions.ChangeStatus(Rec, Rec.Status::Close)
                end;
            }
            action(Reopen)
            {
                Caption = 'Taplalkozas ujranyitasa';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    NutritionActions.ChangeStatus(Rec, Rec.Status::Open)
                end;
            }
            action("Export")
            {
                Caption = 'Exportalas fajlba';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    Xmlport.Run(50100, false, false, Rec);
                end;
            }
            action("Post")
            {
                Caption = 'Konyveles';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    NutritionActions.PostOrder(Rec);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        PageEditable := Rec.Status = Rec.Status::Open;
        CurrPage.Editable(PageEditable)
    end;

    var
        PageEditable: Boolean;
        NutritionActions: Codeunit "Nutrition Actions";
}
