import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/providers/providers.dart';
import 'package:todoapp/data/data.dart';

final tasksProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});