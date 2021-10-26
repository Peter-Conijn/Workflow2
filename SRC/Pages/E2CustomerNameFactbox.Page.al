page 50110 "E2 Customer Name Factbox"
{
    PageType = CardPart;
    SourceTable = "E2 Customer";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("E2 Name"; Rec."E2 Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies which name value is represented here.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Refresh)
            {
                ApplicationArea = All;
                Image = Refresh;
                Caption = 'Refresh';

                trigger OnAction()
                begin
                    CurrPage.Update(false);
                end;
            }
        }
    }
}