import 'package:flutter/material.dart';

class CustomKeyPad extends StatelessWidget {
  const CustomKeyPad({
    required this.decrement,
    this.extraButtonText = ' ',
    Key? key,
  }) : super(key: key);
  final Function() decrement;
  final String extraButtonText;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(dividerColor: Theme.of(context).canvasColor),
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        child: LayoutBuilder(
          builder: (context, constraints) => DataTable(
            horizontalMargin: 0,
            columnSpacing: 0,
            headingRowHeight: 0,
            dataRowHeight: constraints.maxHeight / 4,
            columns: [
              for (var i = 0; i < 3; i++) DataColumn(label: Container()),
            ],
            rows: [
              for (var i = 0; i < 3; i++)
                DataRow(
                  cells: List.generate(
                    3,
                    (index) => DataCell(
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Center(
                          child: Text(
                            '${i * 3 + index + 1}',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ),
              DataRow(
                cells: [
                  DataCell(
                    Center(
                      child: Text(
                        extraButtonText.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    onTap: () {},
                  ),
                  DataCell(
                    Center(
                        child: Text('0',
                            style: Theme.of(context).textTheme.headlineMedium)),
                    onTap: () {},
                  ),
                  DataCell(
                    Center(
                        child: Text('C',
                            style: Theme.of(context).textTheme.headlineMedium)),
                    onTap: decrement,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
