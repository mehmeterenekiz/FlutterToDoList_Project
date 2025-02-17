import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key, 
    required this.color,
     this.child
  });
  
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: const EdgeInsets.all(0.9),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color, // eğer görev tamamlanmışsa farklı, tamamlanmamışsa farklı bir icon görünümü verir.
              border: Border.all(
                width: 2,
                color: color,    // eğer görev tamamlanmışsa farklı, tamamlanmamışsa farklı bir icon görünümü verir.
              ),
            ),
            child: Center(
              child: child,
            ),
          );
  }
}