pageextension 50110 "E2 Customer Card" extends "Customer Card"
{
    layout
    {
        addfirst(factboxes)
        {
            part(E2CustomerNameFactbox; "E2 Customer Name Factbox")
            {
                ApplicationArea = All;
                Caption = 'E2 Customer Data';
                SubPageLink = "Customer No." = FIELD("No.");
            }
        }
    }
}