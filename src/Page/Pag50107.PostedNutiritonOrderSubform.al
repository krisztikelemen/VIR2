/// <summary>
/// Page Posted Nutiriton Order Subform (ID 50107).
/// </summary>
page 50107 "Posted Nutrition Order Subform"
{
    Caption = 'Posted Nutrition Order Subform';
    PageType = ListPart;
    SourceTable = "Posted Nutrition Line";
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Nutrition No."; Rec."Nutrition No.")
                {
                    ApplicationArea = All;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = All;
                }
                field("Nutrition Code"; Rec."Nutrition Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                }
                field(Protein; Rec.Protein)
                {
                    ApplicationArea = All;
                }
                field(Fat; Rec.Fat)
                {
                    ApplicationArea = All;
                }
                field(Carbohydrate; Rec.Carbohydrate)
                {
                    ApplicationArea = All;
                }
                field("Kilojoules (kJ)"; Rec."Kilojoules (kJ)")
                {
                    ApplicationArea = All;
                }
                field("Kilocalories (kcal)"; Rec."Kilocalories (kcal)")
                {
                    ApplicationArea = All;
                }

            }

            group(Osszesen)
            {
                field("Total Protein"; Rec.Protein)
                {
                    Caption = 'Osszes Protein';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Total Fat"; Rec.Fat)
                {
                    Caption = 'Osszes Zsir';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Total Carbohydrate"; Rec.Carbohydrate)
                {
                    Caption = 'Osszes Szenhidrat';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Total kJ"; Rec."Kilojoules (kJ)")
                {
                    Caption = 'Osszes kJ';
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Total kcal"; Rec."Kilocalories (kcal)")
                {
                    Caption = 'Osszes kcal';
                    ApplicationArea = All;
                    Editable = false;

                }
            }
        }
    }
}
