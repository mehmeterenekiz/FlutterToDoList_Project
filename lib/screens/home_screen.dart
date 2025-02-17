import 'package:flutter/material.dart';
import 'package:todoapp/config/routes/route_location.dart';
import 'package:todoapp/data/models/task.dart';
import 'package:todoapp/providers/providers.dart';
import 'package:todoapp/providers/task/task_provider.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(tasksProvider);
    final inCompletedTasks = _incompltedTasks(taskState.tasks);
    final completedTasks = _compltedTasks(taskState.tasks);

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                      text: '7 Ocak, 2025',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    Gap(10),
                    DisplayWhiteText(
                      text: 'Yapılacaklar Listem',
                      fontSize: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   const DisplayListOfTasks(
                      // tasks: incompletedTasks,
                      tasks: [
                        Task(
                          title: 'dişci randevusu',
                          note: '',
                          time: '10:12',
                          date: '17 Ekim',
                          isCompleted: false,
                          category: TaskCategories.health,
                        ),
                        Task(
                          title: 'proje sunumu',
                          note: 'emülatörü çalıştır hale getir.',
                          time: '14:00',
                          date: '9 Ocak',
                          isCompleted: false,
                          category: TaskCategories.education,
                        ),
                      ],
                    ),
                    const Gap(20),
                    Text(
                      'Completed',
                      style: context.textTheme.headlineMedium,
                    ),
                    Gap(20),
                    const DisplayListOfTasks(
                        // tasks: completedTasks,
                      tasks: [
                        Task(
                          title: 'Futbol Maçı',
                          note: 'hazırlıklı ol',
                          time: '22:00',
                          date: '15 Ocak',
                          isCompleted: true,
                          category: TaskCategories.social,
                        ),
                        Task(
                          title: 'Topkapı Sarayı Gezisi',
                          note: 'arkadaşlarla gidilecek',
                          time: '13:30',
                          date: '25 Ocak',
                          isCompleted: true,
                          category: TaskCategories.personal,
                        ),
                        Task(
                          title: 'Market Alışverişi',
                          note: 'arkadaşlarla gidilecek',
                          time: '13:30',
                          date: '25 Ocak',
                          isCompleted: true,
                          category: TaskCategories.shopping,
                        ),
                      ],
                      isCompletedTasks: true, // kutunun boyutu küçük geldi ekrana
                    ),
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () => context.push(RouteLocation.createTask),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayWhiteText(
                          text: 'Yeni Görev Ekle',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Task> _incompltedTasks(List<Task> tasks) {
    final List<Task> filteredTasks = [];

    for (var task in tasks) {
      if (!task.isCompleted) {
          filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }

  List<Task> _compltedTasks(List<Task> tasks) {
    final List<Task> filteredTasks = [];

    for (var task in tasks) {
      if (task.isCompleted) {
        filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }
}


// Bütün dependencies bu projede kullanılacaktır.