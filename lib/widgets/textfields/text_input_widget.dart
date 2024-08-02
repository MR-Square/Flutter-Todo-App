// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_colors.dart';
import 'package:todo_app/constants/app_text_style.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.7,
      height: height * 0.055,
      // padding: const EdgeInsets.fromLTRB(20, 15, 15, 1),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.lightGrey.withOpacity(0.1),
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        maxLength: 20,
        textAlignVertical: TextAlignVertical.top,
        style: AppTextStyle.mediumPrimary18,
        decoration: InputDecoration(
          hintText: "Write your task",
          counterText: "",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
