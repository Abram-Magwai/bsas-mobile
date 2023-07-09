import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey[400],
            child: ListView(
              children: [
                Table(columnWidths: const {
                  1: FractionColumnWidth(.4)
                }, children: [
                  TableRow(
                    decoration: BoxDecoration(color: Color.fromARGB(255, 31, 13, 13)),
                    children: [
                      Text(
                        'Date',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Type',
                        style: Theme.of(context).textTheme.titleMedium,
                      ), 
                      Text(
                        'Amount',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  )
                ])
              ],
            ),
          )
        ],
      ),
    ));
  }
}
