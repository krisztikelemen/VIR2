/// <summary>
/// Codeunit No Series Management (ID 50100).
/// </summary>
codeunit 50100 "Nutrition No. Management"
{
    /// <summary>
    /// GetNewSeriesNumber.
    /// </summary>
    /// <param name="Nutrition Header">VAR Record "Nutrition Header".</param>
    procedure GetNewSeriesNumber(var "Nutrition Header": Record "Nutrition Header")
    var
        NoSeries: Record "No Series";
        NoManagement: Codeunit NoSeriesManagement;
    begin
        if "Nutrition Header"."Nutrition No." = '' then begin
            NoSeries.Get();
            "Nutrition Header"."Nutrition No." := NoManagement.GetNextNo(NoSeries."Nutrition No.", WorkDate(), true);
        end;

    end;
}
