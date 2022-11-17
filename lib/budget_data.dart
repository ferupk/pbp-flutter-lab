import 'package:flutter/material.dart';
import 'package:counter_7/nav_drawer.dart';

List budgetData = [];

class MyBudgetDataPage extends StatefulWidget {
  const MyBudgetDataPage({super.key});
  final String title = 'Data Budget';

  @override
  State<MyBudgetDataPage> createState() => _MyBudgetDataPageState();
}

class _MyBudgetDataPageState extends State<MyBudgetDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const NavDrawer(),
      body: Center(
        child: ListView(
          children: [
            for (var data in budgetData)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data[0],
                        style: const TextStyle(fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      Text(data[2]),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data[1].toString()),
                          Text(data[3]),
                        ],
                      ),
                    ],
                  ),
                )
              ),
          ],
        ),
      ),
    );
  }
}