import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/config/colors.dart';
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
    required this.totalQty,
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
  final int totalQty;
  final Color mainColor;

  final titleTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );
  final subTitleTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.kLightGrey,
    fontSize: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            visualDensity:
                VisualDensity(horizontal: VisualDensity.minimumDensity),
            leading: SvgPicture.asset(
              SvgIcons.distributorIcon,
              height: 25,
              width: 25,
            ),
            minLeadingWidth: 40,
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
            subtitle: checkIfNotEmpty(distributorAddress)
                ? Text(distributorAddress)
                : null,
          ),
          ExpansionTile(
            visualDensity: VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
            childrenPadding:
                EdgeInsets.only(left: 16 + 45, right: 16, top: 8, bottom: 8),
            title: Row(
              children: [
                Text(
                  "Total Quantity",
                  style: titleTextStyle,
                ),
                Spacer(),
                Text(
                  "$totalQty SKUs",
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
            children: [
              ...List.generate(
                quantityBreakdownList.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 2, left: 2, right: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(quantityBreakdownList[index].type,
                          style: subTitleTextStyle),
                      Text(
                          "${quantityBreakdownList[index].orderedProductCount} / ${quantityBreakdownList[index].totalProductCount}",
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            visualDensity: VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
            childrenPadding:
                EdgeInsets.only(left: 16 + 45, right: 16, top: 8, bottom: 8),
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
              Padding(
                padding: const EdgeInsets.only(bottom: 2, left: 2, right: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Margin (%)",
                      style: subTitleTextStyle.copyWith(
                          color: AppColors.colorGreenLight),
                    ),
                    Text(
                      "₹ $marginAmount ($marginPercentage%)",
                      style: subTitleTextStyle.copyWith(
                          color: AppColors.colorGreenLight),
                    ),
                  ],
                ),
              ),
              ...List.generate(
                amountBreakdownList.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 2, left: 2, right: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(amountBreakdownList[index].type,
                          style: subTitleTextStyle),
                      Text("₹ ${amountBreakdownList[index].amount}",
                          style:
                              subTitleTextStyle.copyWith(color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
