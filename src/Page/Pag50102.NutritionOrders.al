/// <summary>
/// Page Nutrition Orders (ID 50102).
/// </summary>
page 50102 "Nutrition Orders"
{
    ApplicationArea = All;
    Caption = 'Taplalkozas adatai';
    PageType = List;
    SourceTable = "Nutrition Header";
    UsageCategory = Lists;
    CardPageId = "Nutrition Order";

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
            }
        }
    }
}