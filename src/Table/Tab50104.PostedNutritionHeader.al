/// <summary>
/// Table Posted Nutrition Header (ID 50104).
/// </summary>
table 50104 "Posted Nutrition Header"
{
    Caption = 'Konyvelt Taplalkozas';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Nutrition No."; Code[20])
        {
            Caption = 'Taplalkozasi Szam';
            DataClassification = CustomerContent;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Vevo Szam';
            DataClassification = CustomerContent;
        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Vevo Neve';
            DataClassification = CustomerContent;
        }
        field(4; "Date"; Date)
        {
            Caption = 'Datum';
            DataClassification = CustomerContent;
        }
        field(5; Status; Enum "Nutrition Status")
        {
            Caption = 'Statusz';
            ValuesAllowed = 0, 1;
            DataClassification = CustomerContent;
        }
        field(6; "Total Protein"; Decimal)
        {
            Caption = 'Osszes Protein';
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Nutrition Line".Protein Where("Nutrition No." = field("Nutrition No.")));
        }
        field(7; "Total Fat"; Decimal)
        {
            Caption = 'Osszes Zsir';
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Nutrition Line".Fat Where("Nutrition No." = field("Nutrition No.")));
        }
        field(8; "Total Carbohydrate"; Decimal)
        {
            Caption = 'Osszes Szenhidrat';
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Nutrition Line".Carbohydrate Where("Nutrition No." = field("Nutrition No.")));
        }
        field(9; "Total KJ"; Decimal)
        {
            Caption = 'Osszes kJ';
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Nutrition Line"."Kilojoules (kJ)" Where("Nutrition No." = field("Nutrition No.")));
        }
        field(10; "Total Kcal"; Decimal)
        {
            Caption = 'Osszes kcal';
            FieldClass = FlowField;
            CalcFormula = Sum("Posted Nutrition Line"."Kilocalories (kcal)" Where("Nutrition No." = field("Nutrition No.")));
        }
    }
    keys
    {
        key(PK; "Nutrition No.")
        {
            Clustered = true;
        }
    }
}