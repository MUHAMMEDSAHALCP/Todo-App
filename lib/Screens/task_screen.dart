import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/Models/task_data.dart';
import 'package:todoey/Widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

    final db = FirebaseFirestore.instance;

    return Scaffold(
      backgroundColor: const Color(0xff325288),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff325288),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.featured_play_list_rounded,
                      size: 30,
                      color: Color(0xff325288),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Todoey",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    "${Provider.of<TaskData>(context).taskCount} Tasks",
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                height: 380,
                padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Color(0xffFAEEE7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: const TasksList()
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// StreamBuilder(
// stream: db.collection('tasks').snapshots(),
// builder: (context, AsyncSnapshot snapshot) {
// if (snapshot.hasData) {
// return ListView.builder(
// itemCount: snapshot.data.docs.length,
// itemBuilder: (BuildContext context, index) {
// DocumentSnapshot documentSnapshot =
// snapshot.data.docs[index];
// return ListTile(
// title: Text(documentSnapshot['task']),
// trailing: Checkbox(
// value: isChecked,
// onChanged: (value) {
// setState(() {
// isChecked = value!;
// });
// },
// ),
// );
// },
// );
// } else {
// return Container();
// }
// }),