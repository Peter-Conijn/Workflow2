table 50110 "E2 Customer"
{
    fields
    {
        field(1; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
        }
        field(5; "E2 Name"; Text[200])
        {
            DataClassification = ToBeClassified;
            Caption = 'E2 Name';
        }
    }
}