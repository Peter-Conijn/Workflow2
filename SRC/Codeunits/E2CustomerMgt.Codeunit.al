codeunit 50111 "E2 Customer Mgt."
{
    internal procedure UpdateE2Name(var SourceVariant: Variant; FieldNo: Integer)
    var
        Customer: Record Customer;
        E2Customer: Record "E2 Customer";
        SourceRecordRef: RecordRef;
        E1NameValue: Text;
    begin
        if not SourceVariant.IsRecord() then
            exit;
        SourceRecordRef.GetTable(SourceVariant);
        SourceRecordRef.SetTable(Customer);

        case FieldNo of
            GetE1NameValueFieldNo():
                begin
                    if not SourceRecordRef.FieldExist(GetE1NameFieldNo()) then
                        exit;

                    if not E2Customer.Get(Customer."No.") then begin
                        E2Customer.Init();
                        E2Customer."Customer No." := Customer."No.";
                        E2Customer.Insert(true);
                    end;

                    E1NameValue := Format(SourceRecordRef.Field(GetE1NameFieldNo()).Value);
                    case E1NameValue of
                        Customer.Name:
                            E2Customer."E2 Name" := Customer."Name 2";
                        Customer."Name 2":
                            E2Customer."E2 Name" := Customer."Name";
                        else
                            E2Customer."E2 Name" := StrSubstNo('%1 - %2', Customer.Name, Customer."Name 2");
                    end;
                    E2Customer.Modify();
                end;
        end;
    end;

    local procedure GetE1NameValueFieldNo(): Integer
    begin
        exit(50100);
    end;

    local procedure GetE1NameFieldNo(): Integer
    begin
        exit(50101);
    end;
}