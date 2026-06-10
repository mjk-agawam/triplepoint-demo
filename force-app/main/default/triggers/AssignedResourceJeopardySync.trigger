trigger AssignedResourceJeopardySync on AssignedResource (after insert, after update) {
    SA0242JeopardyAssignmentHandler.handle(Trigger.new);
}
