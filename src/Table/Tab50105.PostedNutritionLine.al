/// <summary>
/// Table Posted Nutrition Line (ID 50105).
/// </summary>
table 50105 "Posted Nutrition Line"
{
    Caption = 'Konyvelt Taplalkozasi Sor';
    DataClassification = CustomerContent;
    LookupPageId = "Nutrition Order Subform";
    DrillDownPageId = "Nutrition Order Subform";

    fields
    {
        field(1; "Nutrition No."; Code[20])
        {
            Caption = 'Taplalkozasi Szam';
            DataClassification = CustomerContent;
            TableRelation = "Nutrition Header"."Nutrition No.";
        }
        field(2; "Serial No."; Integer)
        {
            Caption = 'Sorszam';
            DataClassification = CustomerContent;
        }
        field(3; "Nutrition Code"; Code[20])
        {
            Caption = 'Tapanyag Kod';
            DataClassification = CustomerContent;
            TableRelation = Macronutrients."Nutrition Code";
            ValidateTableRelation = true;

            trigger OnLookup()
            var
                Macronutrient: Record Macronutrients;
            begin
                Page.RunModal(Page::"Macronutrients", Macronutrient)
            end;

            trigger OnValidate()
            var
                Nutrient: Record Macronutrients;
            begin
                if Nutrient.Get(Rec."Nutrition Code") then
                    Rec.Description := Nutrient.Description
                else
                    Rec."Description" := '';
            end;
        }
        field(4; Description; Text[100])
        {
            Caption = 'Leiras';
            DataClassification = CustomerContent;
        }
        field(5; Quantity; Integer)
        {
            Caption = 'Mennyiseg';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Macronutrient: Record Macronutrients;

            begin
                if Macronutrient.Get(Rec."Nutrition Code") then begin
                    Rec.Protein := Macronutrient.Protein * Quantity;
                    Rec.Fat := Macronutrient.Fat * Quantity;
                    Rec.Carbohydrate := Macronutrient.Carbohydrate * Quantity;
                    Rec."Kilojoules (kJ)" := Macronutrient."Kilojoules (kJ)" * Quantity;
                    Rec."Kilocalories (kcal)" := Macronutrient."Kilocalories (kcal)" * Quantity;
                end
                else begin
                    Rec.Protein := 0;
                    Rec.Fat := 0;
                    Rec.Carbohydrate := 0;
                    Rec."Kilojoules (kJ)" := 0;
                    Rec."Kilocalories (kcal)" := 0;
                end
            end;
        }
        field(6; "Unit of Measure"; Code[10])
        {
            Caption = 'Mertekegyseg';
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }
        field(7; Protein; Decimal)
        {
            Caption = 'Feherje';
            DataClassification = CustomerContent;
        }
        field(8; Fat; Decimal)
        {
            Caption = 'Zsir';
            DataClassification = CustomerContent;
        }
        field(9; Carbohydrate; Decimal)
        {
            Caption = 'Szenhidrat';
            DataClassification = CustomerContent;
        }
        field(10; "Kilojoules (kJ)"; Decimal)
        {
            Caption = 'kJ';
            DataClassification = CustomerContent;
        }
        field(11; "Kilocalories (kcal)"; Decimal)
        {
            Caption = 'kcal';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Nutrition No.", "Serial No.")
        {
            Clustered = true;
        }
    }
}
