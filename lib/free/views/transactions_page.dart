import 'package:bsas/free/models/transaction.dart';
import 'package:bsas/free/models/transaction_summary.dart';
import 'package:bsas/free/services/report.dart';
import 'package:bsas/free/helper/transaction.dart';
import 'package:flutter/material.dart';

class Statement extends StatefulWidget {
  final String bankStatentPath;

  const Statement({Key? key, required this.bankStatentPath}) : super(key: key);

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {
  final ReportService _reportService = ReportService();

  List<Transaction> _transactionList = [];
  List<TransactionSummary> _transactionSummariesList = [];
  double _totalIncome = 0;
  double _totalExpense = 0;

  Future getTransactions() async {
    _transactionList =
        await _reportService.getTransactions('fnb', widget.bankStatentPath);
    setState(() {
      _totalIncome = TransactionHelper.totalIncome(_transactionList);
      _totalExpense = TransactionHelper.totalExpense(_transactionList);
    });
  }

  Future getTransactionSummaries() async {
    _transactionSummariesList = await _reportService.getTransactionSummaries(
        'fnb', widget.bankStatentPath);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getTransactions();
    getTransactionSummaries();
  }

  TextStyle? rowHeader = const TextStyle(
      color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.keyboard_backspace_outlined)),
        title: const Text('TRANSACTIONS'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Center(
              child: _transactionList.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      color: Colors.grey[200],
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: RichText(
                              text: TextSpan(
                                text: 'From: ',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          '${_transactionList[0].date} - ${_transactionList[_transactionList.length - 1].date}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Transactions',
                            style: rowHeader,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: Table(
                              columnWidths: const {1: FractionColumnWidth(.45)},
                              children: [
                                TableRow(
                                    decoration: const BoxDecoration(
                                        color: Colors.black26),
                                    children: [
                                      Text(
                                        'Date',
                                        style: rowHeader,
                                      ),
                                      Text(
                                        'Description',
                                        style: rowHeader,
                                      ),
                                      Text(
                                        'Type',
                                        style: rowHeader,
                                      ),
                                      Text(
                                        'Amount',
                                        style: rowHeader,
                                      )
                                    ])
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3 - 50,
                            child: ListView(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Table(
                                  columnWidths: const {
                                    1: FractionColumnWidth(.45)
                                  },
                                  children:
                                      TransactionHelper.getTransactionRows(
                                          _transactionList),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Summaries',
                            style: rowHeader,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: Table(
                              columnWidths: const {0: FractionColumnWidth(.45)},
                              children: [
                                TableRow(
                                    decoration: const BoxDecoration(
                                        color: Colors.black26),
                                    children: [
                                      Text(
                                        'Description',
                                        style: rowHeader,
                                      ),
                                      Text(
                                        'Appear',
                                        style: rowHeader,
                                      ),
                                      Text(
                                        'Type',
                                        style: rowHeader,
                                      ),
                                      Text(
                                        'Amount',
                                        style: rowHeader,
                                      )
                                    ])
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3 - 50,
                            child: ListView(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Table(
                                  columnWidths: const {
                                    0: FractionColumnWidth(.45)
                                  },
                                  children: TransactionHelper
                                      .getTransactionSummariesRows(
                                          _transactionSummariesList),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Table(
                            columnWidths: const {0: FractionColumnWidth(0.8)},
                            children: [
                              TableRow(children: [
                                Text(
                                  'Total Income (${TransactionHelper.totalNumberOfIncomes(_transactionList)})',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  TransactionHelper.totalIncome(
                                          _transactionList)
                                      .toStringAsFixed(2),
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ])
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Table(
                            columnWidths: const {0: FractionColumnWidth(0.8)},
                            children: [
                              TableRow(children: [
                                Text(
                                  'Total Expense (${TransactionHelper.totalNumberOfExpenses(_transactionList)})',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  TransactionHelper.totalExpense(
                                          _transactionList)
                                      .toStringAsFixed(2),
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ])
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Table(
                            columnWidths: const {0: FractionColumnWidth(0.8)},
                            children: [
                              TableRow(children: [
                                Text(
                                  'Total',
                                  style: rowHeader,
                                ),
                                Text(
                                  'R ${(_totalIncome - _totalExpense).toStringAsFixed(2)}',
                                  style: rowHeader,
                                )
                              ])
                            ],
                          ),
                        ],
                      )),
            )
          ],
        ),
      ),
    );
  }
}
