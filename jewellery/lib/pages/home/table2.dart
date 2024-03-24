import 'package:flutter/material.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Animation Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(), // Add borders to cells
          children: const [
            TableRow(
              children: [
                TableCell(child: Center(child: Text('Header 1'))),
                TableCell(child: Center(child: Text('Header 2'))),
                TableCell(child: Center(child: Text('Header 3'))),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Center(child: Text('Row 1, Cell 1'))),
                TableCell(child: Center(child: Text('Row 1, Cell 2'))),
                TableCell(child: Center(child: Text('Row 1, Cell 3'))),
              ],
            ),
            TableRow(
              children: [
                TableCell(child: Center(child: Text('Row 2, Cell 1'))),
                TableCell(child: Center(child: Text('Row 2, Cell 2'))),
                TableCell(child: Center(child: Text('Row 2, Cell 3'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
