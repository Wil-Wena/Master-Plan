import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../plan_provider.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  ScrollController? scrollController;

  //Remove Focus from TextField
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Master Plan')),
      body: buildList(),
      floatingActionButton: buildAddTaskButton(),
    );
  }

  Widget buildAddTaskButton() {
    final plan = PlanProvider.of(context);
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            plan.tasks.add(Task());
          });
        });
  }

  Widget buildList() {
    final plan = PlanProvider.of(context);

    return ListView.builder(
      controller: scrollController,
      itemCount: plan?.tasks.length,
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
