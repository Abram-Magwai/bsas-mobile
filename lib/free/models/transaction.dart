class Transaction {
  final String date;
  final String description;
  final String transactionType;
  final double amount;
  final double balance;

  const Transaction(
      {required this.date,
      required this.description,
      required this.transactionType,
      required this.amount,
      required this.balance});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        date: json['date'],
        description: json['description'],
        transactionType: json['transactionType'],
        amount: double.parse(json['amount'].toString()),
        balance: double.parse(json['balance'].toString()));
  }
}
