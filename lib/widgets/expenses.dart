import "package:flutter/material.dart";
import "package:flutter_expense_tracker/models/expense.dart";
import "package:flutter_expense_tracker/widgets/expenses_list.dart";

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> expenses = [
    Expense(
      title: "Flutter course",
      amount: 50.0,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Groceries",
      amount: 150.0,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _openAddExpenseModal() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Text("Modal bottom sheet");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: _openAddExpenseModal),
        ],
      ),
      body: Column(
        children: [
          Text("The chart"),
          Expanded(child: ExpensesList(expenses: expenses)),
        ],
      ),
    );
  }
}
