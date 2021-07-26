import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_core/src/api/endpoint/tasking/task_state.dart';

/// Задача — базовый класс для любого взаимодействия пользователя с АИС.
///
/// По умолчанию создаётся с состоянием [TaskAwaitingState]. Для начала
/// выполнения задачи необходим метод — точка входа, например:
/// ```
/// void run(int someArg)
/// ```
///
/// Такой подход позволяет реализовать несколько независимых друг от друга
/// вариантов выполнения задачи.
abstract class Task extends Cubit<TaskState> {
  Task() : super(TaskAwaitingState());
}

class TaskResult<T> extends TaskCompletedState {
  final T snapshot;

  TaskResult(this.snapshot);
}
