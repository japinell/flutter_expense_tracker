import "package:flutter/material.dart";
import "package:flutter_expense_tracker/models/expense.dart";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [Text("The chart"), Text("Expense list")]),
    );
  }
}
