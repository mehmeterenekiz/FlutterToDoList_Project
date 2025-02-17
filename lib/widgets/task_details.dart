import 'package:flutter/material.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/circle_container.dart';
import 'package:gap/gap.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          CircleContainer(
            color: task.category.color.withAlpha(((0.3 * 255).toInt())),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          const Gap(16),
          Text(
            task.title,
            style: style.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(task.time, style: style.titleMedium),
          const Gap(16),
          Visibility(
            visible: !task.isCompleted, // eğer görev yapılmamışsa (false) visible true döner ve bu bilgiler görünür.
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Görev ${task.date} tarihine kadar yapılabilir.'),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                ),
              ],
            ),
          ),
          const Gap(16),
          Divider(
            // divider düz çizgi çeker.
            thickness: 1.5,
            color: task.category.color,
          ),
          const Gap(16),
          Text(task.note.isEmpty
              ? 'Bu görev için bir notunuz bulunmamaktadır'
              : task.note),
          const Gap(16),
          Visibility(
            visible: task.isCompleted, // eğer görev yapılmışsa (true) visible true döner ve bu bilgiler görünür.
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('görev tammalandı '),
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
