/// <summary>
/// Page Macronutrients (ID 50100).
/// </summary>
page 50100 Macronutrients
{
    ApplicationArea = All;
    Caption = 'Makrotapanyagok';
    PageType = List;
    SourceTable = Macronutrients;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Nutrition Code"; Rec."Nutrition Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Kod field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leiras field.';
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
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mertekegyseg field.';
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
        }
    }
}
