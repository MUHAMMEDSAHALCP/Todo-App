import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  final String taskTittle;
  final bool isChecked;
  final void Function(bool?) checkBoxCallBack;
  final Function deleteCallBack;

  const TaskTile({
    Key? key,
    required this.taskTittle,
    required this.isChecked,
    required this.checkBoxCallBack,
    required this.deleteCallBack,
  }) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  var ds = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.taskTittle),
      onDismissed: (direction) {
        widget.deleteCallBack();
      },
      child: ListTile(
        title: Text(
          widget.taskTittle,
          style: TextStyle(
              decoration: widget.isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: widget.isChecked,
          onChanged: widget.checkBoxCallBack,
        ),
      ),
      background: Container(
        decoration: BoxDecoration(
            color: const Color(0xffD96098),
            borderRadius: BorderRadius.circular(20)),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }
}

// StreamBuilder(
// stream: ds.collection('tasks').snapshots(),
// builder: (context, AsyncSnapshot snapshot) {
// if (snapshot.hasData) {
// return ListView.builder(
// itemCount: snapshot.data.docs.length,
// itemBuilder: (BuildContext context, index) {
// DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
// return Container();
// },
// );
// } else {
// return const CircularProgressIndicator();
// }
// });
