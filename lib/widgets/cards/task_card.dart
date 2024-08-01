// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_colors.dart';
import 'package:todo_app/constants/app_text_style.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
    required this.btnVal,
    required this.title,
  });

  final int btnVal;
  final String title;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  int selectedBtn = 1;
  // Function to return true or false based on selection
  // bool _isOptionSelected(int value) {
  //   return selectedBtn == value;
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // return Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    //   child: const Text("This is a task card"),
    // );
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
            blurRadius: 2,
            color: AppColors.cardColor,
            spreadRadius: 2,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              print("button is clicked");
            },
            child: Container(
              width: width * 0.07,
              height: width * 0.07,
              decoration: BoxDecoration(
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
              style: AppTextStyle.boldBlack20,
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
