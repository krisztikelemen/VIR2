/// <summary>
/// Codeunit Series No. Management (ID 50102).
/// </summary>
// codeunit 50102 "Serial No. Management"
// {
//     procedure GetNewSerialNumber(var NutritionLine: Record "Nutrition Line")
//     var
//         NoSeries: Record "No Series";
//         NoManagement: Codeunit NoSeriesManagement;
//     begin
//         if NutritionLine."Serial No." = '' then begin
//             NoSeries.Get();
//             NutritionLine."Serial No." := NoManagement.GetNextNo(NoSeries."Serial No.", WorkDate(), true);
//         end;

//     end;
// }
