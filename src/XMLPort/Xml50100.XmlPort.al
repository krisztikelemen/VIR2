/// <summary>
/// XmlPort XmlPort (ID 50100).
/// </summary>
xmlport 50100 "XmlPort"
{
    Caption = 'XmlPort';
    schema
    {
        textelement(RootNodeName)
        {
            tableelement(NutritionHeader; "Nutrition Header")
            {
                fieldelement(NutritionNo; NutritionHeader."Nutrition No.")
                {
                }
                fieldelement(CustomerNo; NutritionHeader."Customer No.")
                {
                }
                fieldelement(CustomerName; NutritionHeader."Customer Name")
                {
                }
                fieldelement(Date; NutritionHeader."Date")
                {
                }
                fieldelement(Status; NutritionHeader.Status)
                {
                }
                fieldelement(TotalProtein; NutritionHeader."Total Protein")
                {
                }
                fieldelement(TotalFat; NutritionHeader."Total Fat")
                {
                }
                fieldelement(TotalCarbohydrate; NutritionHeader."Total Carbohydrate")
                {
                }
                fieldelement(TotalKJ; NutritionHeader."Total KJ")
                {
                }
                fieldelement(TotalKcal; NutritionHeader."Total Kcal")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
