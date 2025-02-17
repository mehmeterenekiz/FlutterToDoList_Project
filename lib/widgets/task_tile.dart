import 'package:flutter/material.dart';
import 'package:todoapp/data/data.dart';
import 'package:gap/gap.dart';
import 'package:todoapp/utils/extentions.dart';

import 'circle_container.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task, this.onCompleted});
  final Task task;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    final int iconOpacity =
        task.isCompleted ? ((0.6 * 255).toInt()) : ((0.9 * 255).toInt());
    final int backgroundOpacity =
        task.isCompleted ? ((0.2 * 255).toInt()) : ((0.4 * 255).toInt());
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          CircleContainer(
            color: task.category.color.withAlpha(
                backgroundOpacity), // eğer görev tamamlanmışsa farklı, tamamlanmamışsa farklı bir icon görünümü verir.
            child: Center(
              child: Icon(
                task.category.icon,
                color: task.category.color.withAlpha(
                    iconOpacity), // eğer görev tamamlanmışsa farklı, tamamlanmamışsa farklı bir icon görünümü verir.
              ),
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                    fontSize: 16,
                    fontWeight: fontWeight,
                  ),
                ),
                Text(
                  task.time,
                  style: style.titleMedium?.copyWith(
                    decoration: textDecoration,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(value: task.isCompleted, onChanged: onCompleted),
        ],
      ),
    );
  }
}
