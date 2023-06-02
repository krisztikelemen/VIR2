/// <summary>
/// Table Nutrition Header (ID 50101).
/// </summary>
table 50101 "Nutrition Header"
{
    Caption = 'Taplalkozas';
    DataClassification = ToBeClassified;

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
            TableRelation = Customer."No.";

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                if Customer.Get("Customer No.") then
                    Rec."Customer Name" := Customer.Name
                else
                    Rec."Customer Name" := '';
            end;

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
            CalcFormula = Sum("Nutrition Line".Protein Where("Nutrition No." = field("Nutrition No.")));
        }
        field(7; "Total Fat"; Decimal)
        {
            Caption = 'Osszes Zsir';
            FieldClass = FlowField;
            CalcFormula = Sum("Nutrition Line".Fat Where("Nutrition No." = field("Nutrition No.")));
        }
        field(8; "Total Carbohydrate"; Decimal)
        {
            Caption = 'Osszes Szenhidrat';
            FieldClass = FlowField;
            CalcFormula = Sum("Nutrition Line".Carbohydrate Where("Nutrition No." = field("Nutrition No.")));
        }
        field(9; "Total KJ"; Decimal)
        {
            Caption = 'Osszes kJ';
            FieldClass = FlowField;
            CalcFormula = Sum("Nutrition Line"."Kilojoules (kJ)" Where("Nutrition No." = field("Nutrition No.")));
        }
        field(10; "Total Kcal"; Decimal)
        {
            Caption = 'Osszes kcal';
            FieldClass = FlowField;
            CalcFormula = Sum("Nutrition Line"."Kilocalories (kcal)" Where("Nutrition No." = field("Nutrition No.")));
        }
    }

    keys
    {
        key(PK; "Nutrition No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        NutritionManagement: Codeunit "Nutrition No. Management";
    begin
        NutritionManagement.GetNewSeriesNumber(Rec);
    end;
}
