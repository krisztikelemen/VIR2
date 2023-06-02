/// <summary>
/// Page Nutrition Order Subform (ID 50103).
/// </summary>
page 50103 "Nutrition Order Subform"
{
    Caption = 'Taplalkozasi Adatok Reszletesen';
    PageType = ListPart;
    SourceTable = "Nutrition Line";
    // AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Nutrition No."; Rec."Nutrition No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Taplalkozasi Szam field.';
                    // ShowMandatory = true;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sorszam field.';
                    // ShowMandatory = true;
                }
                field("Nutrition Code"; Rec."Nutrition Code")
                {
                    ApplicationArea = All;
                    // ShowMandatory = true;
                    Lookup = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leiras field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mennyiseg field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Feherje field.';
                }
                field(Protein; Rec.Protein)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Feherje field.';
                }
                field(Fat; Rec.Fat)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Zsir field.';
                }
                field(Carbohydrate; Rec.Carbohydrate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Szenhidrat field.';
                }
                field("Kilojoules (kJ)"; Rec."Kilojoules (kJ)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the kJ field.';
                }
                field("Kilocalories (kcal)"; Rec."Kilocalories (kcal)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the kcal field.';
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