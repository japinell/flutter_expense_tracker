import "package:flutter/material.dart";
import "package:intl/intl.dart";

final formatter = DateFormat("MM/dd/yyyy");

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _datePicker() async {
    final today = DateTime.now();
    final firstDate = DateTime(today.year - 1, today.month, today.day);
    final lastDate = DateTime(today.year, today.month, today.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(label: Text("Title")),
            controller: _titleController,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Amount"),
                    prefixText: "\$ ",
                  ),
                  controller: _amountController,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Select a date..."
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _datePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: Text("Save"),
              ),
              SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
