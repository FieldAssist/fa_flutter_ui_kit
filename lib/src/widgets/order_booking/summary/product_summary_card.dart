import 'package:flutter/material.dart';

class ProductSummaryCard extends StatelessWidget {
  const ProductSummaryCard({
    required this.name,
    required this.totalPrice,
    required this.ptr,
    required this.cases,
    required this.pcs,
    this.onDelete,
    this.onEdit,
    super.key,
  });

  final String name;
  final double totalPrice;
  final double ptr;
  final int cases;
  final int pcs;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "₹ $totalPrice",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (onDelete != null)
                      IconButton(
                        onPressed: onDelete,
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Price to Retailer"),
                Row(
                  children: [Text("₹ $ptr"), SizedBox(width: 50)],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Quantity"),
                Row(
                  children: [
                    Text("$cases cases | $pcs pcs"),
                    if (onEdit != null)
                      IconButton(
                        onPressed: onEdit,
                        icon: Icon(
                          Icons.mode_edit_outline_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
