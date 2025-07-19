import "package:uuid/uuid.dart";

const uuid = Uuid();

class Expense {
  // Title, amount, and date are required parameters for the Expense class.
  // The id is generated using the uuid package.
  Expense({required this.title, required this.amount, required this.date})
    : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
}
