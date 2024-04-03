import 'package:flutter/material.dart';

class QuantityBreakdown {
  QuantityBreakdown({
    required this.type,
    required this.orderedProductCount,
    required this.totalProductCount,
  });

  final String type;
  final int orderedProductCount;
  final int totalProductCount;
}

class AmountBreakdown {
  AmountBreakdown({required this.type, required this.amount});

  final String type;
  final double amount;
}

class OrderAmountSummaryWidget extends StatelessWidget {
  OrderAmountSummaryWidget({
    required this.distributorName,
    required this.distributorAddress,
    required this.quantityBreakdownList,
    required this.amountBreakdownList,
    required this.marginPercentage,
    required this.marginAmount,
    required this.payableAmount,
    super.key,
  });

  final String distributorName;
  final String distributorAddress;
  final List<QuantityBreakdown> quantityBreakdownList;
  final List<AmountBreakdown> amountBreakdownList;
  final double marginPercentage;
  final double marginAmount;
  final double payableAmount;

  final titleTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.warehouse,
              color: Theme.of(context).primaryColor,
            ),
            title: Row(
              children: [
                Text(
                  "Distributor: ",
                  style: titleTextStyle,
                ),
                Text(
                  distributorName,
                  style: titleTextStyle.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            subtitle: Text(distributorAddress),
          ),
          ExpansionTile(
            title: Row(
              children: [
                Text(
                  "Total Quantity",
                  style: titleTextStyle,
                ),
                Spacer(),
                Text(
                  "${_calculateTotalQuantity()} SKUs",
                  style: titleTextStyle,
                )
              ],
            ),
            leading: Icon(
              Icons.inventory,
              color: Theme.of(context).primaryColor,
            ),
            initiallyExpanded: true,
            childrenPadding:
                EdgeInsets.only(left: 16 + 60, right: 16, top: 8, bottom: 8),
            children: [
              ...List.generate(
                quantityBreakdownList.length,
                (index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(quantityBreakdownList[index].type),
                    Text(
                      "${quantityBreakdownList[index].orderedProductCount} / ${quantityBreakdownList[index].totalProductCount}",
                    ),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            childrenPadding: EdgeInsets.only(
              left: 16 + 60,
              right: 16,
              top: 8,
              bottom: 8,
            ),
            leading: Icon(
              Icons.currency_rupee_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Row(
              children: [
                Text(
                  "Payable Amount",
                  style: titleTextStyle,
                ),
                Spacer(),
                Text(
                  "$payableAmount",
                  style: titleTextStyle,
                ),
              ],
            ),
            initiallyExpanded: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Margin (%)",
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    "₹ $marginAmount ($marginPercentage%)",
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              ...List.generate(
                amountBreakdownList.length,
                (index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(amountBreakdownList[index].type),
                    Text("₹ ${amountBreakdownList[index].amount}"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int _calculateTotalQuantity() {
    var count = 0;
    for (final element in quantityBreakdownList) {
      count += element.orderedProductCount;
    }
    return count;
  }
}
