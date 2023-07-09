class TransactionSummary {
  final String description;
  final double total;
  final int visits;
  final String transactionType;

  TransactionSummary(
      {required this.description,
      required this.total,
      required this.visits,
      required this.transactionType});

  factory TransactionSummary.fromJson(Map<String, dynamic> json) {
    return TransactionSummary(
      description: json['description'],
      total: double.parse(json['total'].toString()),
      transactionType: json['transactionType'],
      visits: (json['visits']),
    );
  }
}
