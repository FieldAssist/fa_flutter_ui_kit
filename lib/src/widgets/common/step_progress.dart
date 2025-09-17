import 'package:flutter/material.dart';

class StepProgressBar extends StatelessWidget {
  final int currentStep;
  final List<String> steps;

  const StepProgressBar({
    Key? key,
    required this.currentStep,
    required this.steps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: List.generate(steps.length * 2 - 1, (index) {
          // Even index -> step, Odd index -> connector line
          if (index.isEven) {
            final stepIndex = index ~/ 2;
            final isCompleted = stepIndex < currentStep;
            final isCurrent = stepIndex == currentStep;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isCompleted
                      ? Icons.check_circle
                      : isCurrent
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                  color: isCompleted
                      ? Colors.green
                      : isCurrent
                          ? Colors.blue
                          : Colors.grey,
                  size: 20,
                ),
                const SizedBox(height: 4),
                Text(
                  steps[stepIndex],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isCompleted || isCurrent
                        ? Colors.black
                        : Colors.grey[500],
                  ),
                ),
              ],
            );
          } else {
            final lineIndex = index ~/ 2;
            final isCompleted = lineIndex < currentStep;

            return Expanded(
              child: Container(
                height: 2,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                color: isCompleted ? Colors.green : Colors.grey[300],
              ),
            );
          }
        }),
      ),
    );
  }
}
