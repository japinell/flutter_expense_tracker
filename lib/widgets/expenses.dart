import "package:flutter/material.dart";
import "package:flutter_expense_tracker/models/expense.dart";
import "package:flutter_expense_tracker/widgets/expenses_list.dart";
import "package:flutter_expense_tracker/widgets/new_expense.dart";

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
      isScrollControlled: true, // Enable full screen mode
      context: context,
      builder: (ctx) {
        return NewExpense(onAddExpense: _addExpense);
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      expenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text("No expenses found... Start adding some!"),
    );

    if (expenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: expenses,
        onRemoveExpense: _removeExpense,
      );
    }

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
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
