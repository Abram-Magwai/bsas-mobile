import 'dart:io';

import 'package:bsas/free/views/transactions_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

enum Bank { fnb }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Bank? _bank = Bank.fnb;
  late File bankStatement;
  String fileName = '';
  List<Transaction> transactionList = [];

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    bankStatement = File(result?.paths.first ?? '');
    List<String> filePath = bankStatement.path.split("/");
    fileName = filePath[filePath.length - 1];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Statement Analysing System'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
              height: (MediaQuery.of(context).size.height / 2) - 100,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/accounting.jpg'),
                      fit: BoxFit.cover))),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Text(
                    'Choose Bank',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                ListTile(
                  title: Text(
                    'First National Bank',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  leading: Radio<Bank>(
                    value: Bank.fnb,
                    groupValue: _bank,
                    onChanged: (Bank? value) {
                      setState(() {
                        _bank = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  fileName,
                  style: const TextStyle(color: Colors.red, fontSize: 10),
                ),
                GestureDetector(
                  onTap: pickFile,
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.file_present_outlined,
                          size: 25,
                        ),
                        Text(
                          'Choose Statement',
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => Statement(
                                      bankStatentPath: bankStatement.path,
                                    )));
                      },
                      child: const Text('Analyse Statement')),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
