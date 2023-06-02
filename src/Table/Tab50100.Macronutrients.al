/// <summary>
/// Table Macronutrients (ID 50100).
/// </summary>
table 50100 Macronutrients
{
    Caption = 'Makrotapanyagok';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Nutrition Code"; Code[20])
        {
            Caption = 'Kod';
            DataClassification = CustomerContent;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Leiras';
            DataClassification = CustomerContent;
        }
        field(3; Protein; Decimal)
        {
            Caption = 'Feherje';
            DataClassification = CustomerContent;
        }
        field(4; Fat; Decimal)
        {
            Caption = 'Zsir';
            DataClassification = CustomerContent;
        }
        field(5; Carbohydrate; Decimal)
        {
            Caption = 'Szenhidrat';
            DataClassification = CustomerContent;
        }
        field(6; "Unit of Measure"; Code[10])
        {
            Caption = 'Mertekegyseg';
            DataClassification = CustomerContent;
            TableRelation = "Unit of Measure";
        }
        field(7; "Kilojoules (kJ)"; Decimal)
        {
            Caption = 'kJ';
            DataClassification = CustomerContent;
        }
        field(8; "Kilocalories (kcal)"; Decimal)
        {
            Caption = 'kcal';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Nutrition Code")
        {
            Clustered = true;
        }
    }
}
