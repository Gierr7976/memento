abstract class TaskState {}

class TaskAwaitingState extends TaskState {}

class TaskInProgressState extends TaskState {}

class TaskErrorState extends TaskState {}

class TaskCompletedState extends TaskState {}
