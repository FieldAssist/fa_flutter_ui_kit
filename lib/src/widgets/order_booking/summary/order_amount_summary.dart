import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
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
    required this.mainColor,
    super.key,
  });

  final String distributorName;
  final String distributorAddress;
  final List<QuantityBreakdown> quantityBreakdownList;
  final List<AmountBreakdown> amountBreakdownList;
  final double marginPercentage;
  final double marginAmount;
  final double payableAmount;
  final Color mainColor;

  final titleTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            leading: SvgPicture.asset(
              SvgIcons.distributorIcon,
              height: 25,
              width: 25,
            ),
            title: Row(
              children: [
                Text(
                  "Distributor: ",
                  style: titleTextStyle.copyWith(color: mainColor),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    distributorName,
                    style: titleTextStyle,
                  ),
                ),
              ],
            ),
            subtitle: Text(distributorAddress),
          ),
          ExpansionTile(
            visualDensity: VisualDensity.compact,
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
            leading: SvgPicture.asset(
              SvgIcons.boxIcon,
              height: 25,
              width: 25,
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
            visualDensity: VisualDensity.compact,
            childrenPadding: EdgeInsets.only(
              left: 16 + 60,
              right: 16,
              top: 8,
              bottom: 8,
            ),
            leading: SvgPicture.asset(
              SvgIcons.rupeeRoundedIcon,
              height: 25,
              width: 25,
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
