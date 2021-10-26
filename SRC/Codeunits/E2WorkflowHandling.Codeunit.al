codeunit 50110 "E2 Workflow Handling"
{
    local procedure CreateResponseLibrary()
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        FillE1NameDescriptionLbl: Label 'Fill the E2 Name field';
        Group6Lbl: Label 'GROUP 6', Locked = true;
    begin
        WorkflowResponseHandling.AddResponseToLibrary(FillE1NameCodeLbl, 0, FillE1NameDescriptionLbl, Group6Lbl);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnAddWorkflowResponsesToLibrary', '', false, false)]
    local procedure OnAddWorkflowResponsesToLibrary()
    begin
        CreateResponseLibrary();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnExecuteWorkflowResponse', '', false, false)]
    local procedure OnExecuteWorkflowResponse(var "Variant": Variant; xVariant: Variant; ResponseWorkflowStepInstance: Record "Workflow Step Instance"; var ResponseExecuted: Boolean)
    var
        WorkflowResponse: Record "Workflow Response";
        WorkflowStepArgument: Record "Workflow Step Argument";
        E2CustomerMgt: Codeunit "E2 Customer Mgt.";
    begin
        if not WorkflowResponse.Get(ResponseWorkflowStepInstance."Function Name") then
            exit;

        if WorkflowStepArgument.Get(ResponseWorkflowStepInstance.Argument) then;

        case WorkflowResponse."Function Name" of
            FillE1NameCodeLbl:
                E2CustomerMgt.UpdateE2Name("Variant", WorkflowStepArgument."Field No.");
        end;

        ResponseExecuted := true;
    end;

    var
        FillE1NameCodeLbl: Label 'FILL_E2NAME', Locked = true;
}