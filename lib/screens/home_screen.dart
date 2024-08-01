import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_colors.dart';
import 'package:todo_app/constants/app_text_style.dart';
import 'package:todo_app/widgets/buttons/add_button.dart';
import 'package:todo_app/widgets/cards/task_card.dart';
import 'package:todo_app/widgets/textfields/text_input_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map> taskList = [
    {
      'id': 1,
      'title': 'This is my first task',
      'isCompleted': false,
    },
    {
      'id': 2,
      'title': 'Task 2',
      'isCompleted': false,
    },
    {
      'id': 3,
      'title': 'Task 3',
      'isCompleted': false,
    },
  ];
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
          style: AppTextStyle.regularWhite22.copyWith(
            fontWeight: FontWeight.bold,
          ),
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
                        'Keep it up',
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
                      border: Border.all(strokeAlign: 1),
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.deepOrange,
                    ),
                    child: Center(
                      child: Text(
                        "3/5",
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
                const TextInputWidget(),
                AddButton(
                  onPress: showTaskAddedMessage,
                ),
              ],
            ),

            SizedBox(
              height: height * 0.02,
            ),
            // Rendering list of tasks
            Flexible(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskCard(
                    btnVal: index,
                    title: taskList[index]['title'],
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
