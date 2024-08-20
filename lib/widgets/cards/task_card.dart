// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_colors.dart';
import 'package:todo_app/constants/app_text_style.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.taskId,
    required this.title,
    required this.isCompleted,
    required this.updateTaskStatus,
  });

  final int taskId;
  final String title;
  final bool isCompleted;
  final Function(bool taskStatus) updateTaskStatus;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isCompleted = false;

  @override
  void initState() {
    isCompleted = widget.isCompleted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      height: height * 0.1,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
            color: AppColors.cardColor,
            spreadRadius: 1,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              print(widget.taskId);
              setState(() {
                isCompleted = !isCompleted;
                widget.updateTaskStatus(isCompleted);
              });
            },
            child: Container(
              width: width * 0.07,
              height: width * 0.07,
              decoration: isCompleted
                  ? BoxDecoration(
                      color: AppColors.darkGreen,
                      border: Border.all(
                        strokeAlign: 1,
                        color: AppColors.darkGreen,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    )
                  : BoxDecoration(
                      border: Border.all(
                        strokeAlign: 1,
                        color: AppColors.attdRed,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
            ),
          ),
          SizedBox(
            width: width * 0.02,
          ),
          SizedBox(
            width: width * 0.48,
            child: Text(
              overflow: TextOverflow.ellipsis,
              widget.title,
              style: isCompleted
                  ? AppTextStyle.boldBlack20.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.lightGrey,
                    )
                  : AppTextStyle.boldBlack20,
            ),
          ),
          // const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_document,
                  color: AppColors.lightGrey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.lightGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
