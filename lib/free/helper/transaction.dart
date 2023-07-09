import 'package:bsas/free/constants/transaction_type_constants.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../models/transaction_summary.dart';

class TransactionHelper {
  static List<TableRow> getTransactionRows(List<Transaction> transactionList) {
    List<TableRow> tableRows = [];
    for (var transaction in transactionList) {
      tableRows.add(TableRow(
          decoration: BoxDecoration(
              color: transaction.transactionType == Expense
                  ? Colors.red[200]
                  : Colors.blue[200]),
          children: [
            Text(transaction.date),
            Text(transaction.description),
            Text(transaction.transactionType),
            Text(transaction.amount.toString())
          ]));
    }
    return tableRows;
  }

  static List<TableRow> getTransactionSummariesRows(
      List<TransactionSummary> transactionSummariesList) {
    List<TableRow> tableRows = [];
    for (var transaction in transactionSummariesList) {
      tableRows.add(TableRow(
          decoration: BoxDecoration(
              color: transaction.transactionType == Expense
                  ? Colors.red[200]
                  : Colors.blue[200]),
          children: [
            Text(transaction.description),
            Text(transaction.visits.toString()),
            Text(transaction.transactionType),
            Text(transaction.total.toStringAsFixed(2))
          ]));
    }
    return tableRows;
  }

  static double totalIncome(List<Transaction> transactions) {
    double income = 0;
    for (var tr in transactions) {
      if (tr.transactionType == Income) {
        income += tr.amount;
      }
    }
    return income;
  }

  static double totalExpense(List<Transaction> transactions) {
    double expense = 0;
    for (var tr in transactions) {
      if (tr.transactionType == Expense) {
        expense += tr.amount;
      }
    }
    return expense;
  }

  static int totalNumberOfIncomes(List<Transaction> transactions) {
    int count = 0;
    for (var tr in transactions) {
      if (tr.transactionType == Income) {
        count++;
      }
    }
    return count;
  }

  static int totalNumberOfExpenses(List<Transaction> transactions) {
    int count = 0;
    for (var tr in transactions) {
      if (tr.transactionType == Expense) {
        count++;
      }
    }
    return count;
  }
}
