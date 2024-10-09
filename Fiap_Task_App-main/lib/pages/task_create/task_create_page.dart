import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/task_model.dart';

class TaskCreatePage extends StatefulWidget {
  const TaskCreatePage({super.key, required this.groupId, this.task});
  final String groupId;
  final Task? task;

  @override
  State<TaskCreatePage> createState() => _TaskCreatePageState();
}

class _TaskCreatePageState extends State<TaskCreatePage> {
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              //_buildTitle(),
              const SizedBox(height: 20),
              // _buildSubtitle(),
              const SizedBox(height: 20),
              //  _buildDatePicker(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () async {
          await _submitForm();
        },
        label: const Text('Add Task'),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildDatePicker() {
    return GestureDetector(
      onTap: () async {
        final selectedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2000, 3, 5),
            lastDate: DateTime(2030, 3, 5));
        if (selectedDate != null) {
          setState(() {
            date = selectedDate;
          });
        }

        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(color: Colors.grey.shade300, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text('Select a Date'),
            ),
            Expanded(child: Container()),
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 140,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Center(
                child: Text(DateFormat.yMMMEd().format(date).toString()),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _submitForm() async {}
}
