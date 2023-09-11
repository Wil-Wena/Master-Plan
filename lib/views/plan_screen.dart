import 'package:flutter/material.dart';

import '../models/data_layer.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final plan = Plan();
  late ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Master Plan')),
      body: buildList(),
      floatingActionButton: buildAddTaskButton(),
    );
  }

  Widget buildAddTaskButton() {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            plan.tasks.add(Task());
          });
        });
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => buildTaskTile(plan.tasks[index]),
    );
  }

  Widget buildTaskTile(Task task) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            task.complete = selected!;
          });
        },
      ),
      title: TextField(onChanged: (text) {
        setState(() {
          task.description = text;
        });
      }),
    );
  }
}
