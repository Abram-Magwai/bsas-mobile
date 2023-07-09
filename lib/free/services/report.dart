import 'package:bsas/free/models/transaction.dart';
import 'package:bsas/free/models/transaction_summary.dart';
import 'package:bsas/free/services/http_client.dart';

class ReportService {
  Future<List<Transaction>> getTransactions(
      String bankName, String filePath) async {
    List jsonResponse = await HttpClient.postFile(
        'report/transactions?bankname=$bankName', 'statement', filePath);
    return jsonResponse.map((e) => Transaction.fromJson(e)).toList();
  }

  Future<List<TransactionSummary>> getTransactionSummaries(
      String bankName, String filePath) async {
    List jsonResponse = await HttpClient.postFile(
        'report/transactions/summary?bankname=$bankName',
        'statement',
        filePath);
    return jsonResponse.map((e) => TransactionSummary.fromJson(e)).toList();
  }
}
