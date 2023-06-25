/// <summary>
/// Codeunit Nutrition Actions (ID 50101).
/// </summary>
codeunit 50101 "Nutrition Actions"
{
    procedure ChangeStatus(
        NutritionHeader: Record "Nutrition Header";
        Status: Enum "Nutrition Status"
    )
    begin
        NutritionHeader.TestField(NutritionHeader.Date);
        NutritionHeader.Status := Status;
        NutritionHeader.Modify();
    end;

    procedure PostOrder(var NutritionHeader: Record "Nutrition Header")
    var
        NutritionLine: Record "Nutrition Line";
        PostedNH: Record "Posted Nutrition Header";
        PostedNL: Record "Posted Nutrition Line";
        NoSeries: Record "No Series";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ExitMessage: Label 'Sikeresen konyvelve';
        PostQuestion: Label 'Biztosan konyveli a dokumentumot?';
        DeleteQuestion: Label 'Kivanja torolni a rendelest a konyveles vegeztevel?';
        ShouldBeDeleted: Boolean;

    begin
        NutritionHeader.TestField(Status, NutritionHeader.Status::Close);

        if not Confirm(PostQuestion) then
            exit;

        if Confirm(DeleteQuestion) then
            ShouldBeDeleted := true
        else
            ShouldBeDeleted := false;

        PostedNH.Init();
        PostedNH.TransferFields(NutritionHeader);
        NoSeries.Get();
        PostedNH."Nutrition No." := NoSeriesManagement.GetNextNo(NoSeries."Posted Nutrition No.", WorkDate(), true);
        PostedNH.Insert(true);

        NutritionLine.Reset();
        NutritionLine.SetRange("Nutrition No.", NutritionHeader."Nutrition No.");
        if NutritionLine.findSet() then
            repeat
                PostedNL.Init();
                PostedNL.TransferFields(NutritionLine);
                PostedNL."Nutrition No." := PostedNH."Nutrition No.";
                PostedNL.Insert(true);

                if ShouldBeDeleted then
                    NutritionLine.Delete();
            until NutritionLine.Next() = 0;

        if ShouldBeDeleted then
            NutritionHeader.Delete();

        Commit();
        Message(ExitMessage);
        Page.RunModal(Page::"Posted Nutrition Order", PostedNH);
    end;
}
