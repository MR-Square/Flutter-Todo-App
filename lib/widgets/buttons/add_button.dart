import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.onPress,
  });

  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: const Icon(
        Icons.add_circle_outlined,
        color: AppColors.darkGreen,
        size: 45,
      ),
    );
  }
}
