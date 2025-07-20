import "package:flutter/material.dart";
import "package:flutter_expense_tracker/models/expense.dart";
import "package:flutter_expense_tracker/widgets/expense_item.dart";

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, idx) {
        return Dismissible(
          key: ValueKey(idx),
          background: Container(
            color: Theme.of(context).colorScheme.error,
            margin: Theme.of(context).cardTheme.margin,
          ),
          onDismissed: (direction) {
            onRemoveExpense(expenses[idx]);
          },
          child: ExpenseItem(expenses[idx]),
        );
      },
    );
  }
}
