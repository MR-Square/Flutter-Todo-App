// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app/constants/api_handler.dart';
import 'package:todo_app/constants/app_colors.dart';
import 'package:todo_app/constants/app_text_style.dart';
import 'package:todo_app/data/tasks.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/buttons/add_button.dart';
import 'package:todo_app/widgets/cards/task_card.dart';
import 'package:todo_app/widgets/textfields/text_input_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int completedTasks = 0;
  Color? statusCircleColor = AppColors.secondary;
  String statusSubtitle = "Keep it up";
  late List<Task> data = [];
  late List<Task> data1 = [];
  ApiHandler apiHandler = ApiHandler();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    data = await apiHandler.getTaskData();
    setState(() {});
  }

  addTask() async {
    var responseJson;
    if (controller.text == "") {
      print("enter a task");
    } else {
      final task = Task(
        id: 0,
        taskName: controller.text,
        isCompleted: false,
        isCanceled: false,
      );

      var response = await apiHandler.addTask(task: task);
      responseJson = json.decode(response.body);
    }
    if (!mounted) return;
    setState(() {});
  }

  updateTaskStatus(bool taskStatus) {
    if (taskStatus) {
      completedTasks++;
    } else {
      completedTasks--;
    }
    if (completedTasks == tasksList.length) {
      statusCircleColor = AppColors.darkGreen;
      statusSubtitle = "Well Done!";
    } else if (completedTasks == 0) {
      statusCircleColor = AppColors.attdRed;
      statusSubtitle = "Poor Performance";
    } else {
      statusCircleColor = AppColors.secondary;
      statusSubtitle = "Keep it up";
    }
    setState(() {});
  }

  void showTaskAddedMessage() {
    const snackBar = SnackBar(
      content: Text('Task added successfully!'),
      duration: Duration(milliseconds: 800),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: AppColors.bgColor,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          'ToDo App',
          style: AppTextStyle.boldWhite26,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.fromLTRB(30, 10, 20, 10),
              width: width * 0.85,
              height: height * 0.22,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Todo Done",
                        // style: TextStyle(
                        // color: Colors.white,
                        // ),
                        style: AppTextStyle.boldBlack24,
                      ),
                      Text(
                        statusSubtitle,
                        // style: TextStyle(
                        //     // color: Colors.white,
                        //     ),
                        style: AppTextStyle.boldBlack18,
                      ),
                    ],
                  ),
                  Container(
                    width: width * 0.33,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      // border: Border.all(strokeAlign: 1),
                      borderRadius: BorderRadius.circular(100),
                      // color: AppColors.secondary,
                      color: statusCircleColor,
                    ),
                    child: Center(
                      child: Text(
                        "$completedTasks/${data.length}",
                        style: AppTextStyle.boldWhite30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextInputWidget(
                  inputController: controller,
                ),
                AddButton(
                  // onPress: showTaskAddedMessage,
                  onPress: addTask,
                ),
              ],
            ),

            SizedBox(
              height: height * 0.02,
            ),
            // Rendering list of tasks
            Flexible(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskCard(
                    taskId: data[index].id,
                    isCompleted: data[index].isCompleted!,
                    title: data[index].taskName,
                    updateTaskStatus: updateTaskStatus,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
