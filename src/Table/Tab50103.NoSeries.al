/// <summary>
/// Table No. Series  (ID 50103).
/// </summary>
table 50103 "No Series"
{
    Caption = 'No Series';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(2; "Nutrition No."; Code[20])
        {
            Caption = 'Taplalkozasi Szam';
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
            ValidateTableRelation = true;
        }
        // field(3; "Serial No."; Code[20])
        // {
        //     Caption = 'Sorszam';
        //     DataClassification = CustomerContent;
        //     TableRelation = "No. Series".Code;
        //     ValidateTableRelation = true;
        // }
        field(3; "Posted Nutrition No."; Code[20])
        {
            Caption = 'Konyvelt Taplalkozas Szama';
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
            ValidateTableRelation = true;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
