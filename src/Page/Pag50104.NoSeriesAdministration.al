/// <summary>
/// Page No Series List (ID 50104).
/// </summary>
page 50104 "No Series Administration"
{
    Caption = 'No. Series Administration';
    PageType = Card;
    SourceTable = "No Series";
    UsageCategory = Administration;
    ApplicationArea = All;

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
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then
            Rec.Insert();
    end;
}
