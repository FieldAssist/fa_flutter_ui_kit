import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/config/colors.dart';
import 'package:flutter/material.dart';

class QuantityBreakdown {
  QuantityBreakdown({
    required this.type,
    this.orderedProductCount = 0,
    this.totalProductCount = 0,
    this.isContainSingleValue = false,
    this.singleValue = "",
  });

  final String type;
  final int orderedProductCount;
  final int totalProductCount;
  final bool isContainSingleValue;
  final String singleValue;
}

class AmountBreakdown {
  AmountBreakdown({
    required this.type,
    required this.amount,
    this.color,
    this.amtPrefix = "",
  });

  final String type;
  final double amount;
  final Color? color;

  /// It can be used to denote negative (-) amount
  /// Eg: -₹ 100 so you can pass amtPrefix as "-"
  final String amtPrefix;
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
    this.customWidget,
    this.currency = "₹",
    this.unit = "SKUs",
    this.showMargin = true,
    this.discountWidget,
    this.isDistributorVisible = false,
    this.qtyTitleText,
    this.payableAmtTitleText,
    this.distributorTitleText,
    super.key,
  });

  final String distributorName;
  final String distributorAddress;
  final String currency;
  final String unit;
  final List<QuantityBreakdown> quantityBreakdownList;
  final List<AmountBreakdown> amountBreakdownList;

  /// It appears After Qty Info and before Payable Amount Info
  final Widget? discountWidget;
  final double marginPercentage;
  final double marginAmount;
  final double payableAmount;
  final int totalQty;
  final Color mainColor;
  final Widget? customWidget;
  final bool showMargin;
  final bool isDistributorVisible;
  final String? qtyTitleText;
  final String? payableAmtTitleText;
  final String? distributorTitleText;

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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            if (customWidget != null) ...[
              customWidget!,
              DottedDivider(),
            ],
            if (isDistributorVisible) ...[
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
                      distributorTitleText ?? "Distributor: ",
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
              DottedDivider()
            ],
            ExpansionTile(
              shape: RoundedRectangleBorder(side: BorderSide.none),
              visualDensity: VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity),
              childrenPadding:
                  EdgeInsets.only(left: 16 + 45, right: 16, top: 8, bottom: 8),
              title: Row(
                children: [
                  Text(
                    qtyTitleText ?? "Total Quantity",
                    style: titleTextStyle,
                  ),
                  Spacer(),
                  Text(
                    "$totalQty $unit",
                    style: titleTextStyle,
                  )
                ],
              ),
              leading: SvgPicture.asset(
                SvgIcons.boxIcon,
                height: 25,
                width: 25,
              ),
              initiallyExpanded: quantityBreakdownList.isEmpty ? false : true,
              children: [
                ...List.generate(
                  quantityBreakdownList.length,
                  (index) => Padding(
                    padding:
                        const EdgeInsets.only(bottom: 2, left: 2, right: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(quantityBreakdownList[index].type,
                            style: subTitleTextStyle),
                        Text(
                            quantityBreakdownList[index].isContainSingleValue
                                ? "${quantityBreakdownList[index].singleValue}"
                            : "${quantityBreakdownList[index].orderedProductCount} / ${quantityBreakdownList[index].totalProductCount}",
                            style: subTitleTextStyle.copyWith(
                                color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ],
              trailing:
                  quantityBreakdownList.isEmpty ? SizedBox.shrink() : null,
            ),
            DottedDivider(),
            if (discountWidget != null) ...[
              discountWidget!,
              DottedDivider(),
            ],
            ExpansionTile(
              shape: RoundedRectangleBorder(side: BorderSide.none),
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
                    payableAmtTitleText ?? "Payable Amount",
                    style: titleTextStyle,
                  ),
                  Spacer(),
                  Text(
                    "$currency $payableAmount",
                    style: titleTextStyle,
                  ),
                ],
              ),
              initiallyExpanded: true,
              trailing: (showMargin || amountBreakdownList.isNotEmpty)
                  ? null
                  : SizedBox.shrink(),
              children: [
                if (showMargin)
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 2, left: 2, right: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Margin (%)",
                          style: subTitleTextStyle.copyWith(
                              color: AppColors.colorGreenLight),
                        ),
                        Text(
                          "$currency $marginAmount ($marginPercentage%)",
                          style: subTitleTextStyle.copyWith(
                              color: AppColors.colorGreenLight),
                        ),
                      ],
                    ),
                  ),
                ...List.generate(
                  amountBreakdownList.length,
                  (index) {
                    final amtBreakdownItem = amountBreakdownList[index];
                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 2, left: 2, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(amtBreakdownItem.type, style: subTitleTextStyle),
                          Text(
                            """${amtBreakdownItem.amtPrefix}$currency ${amtBreakdownItem.amount}""",
                            style: subTitleTextStyle.copyWith(
                              color: amtBreakdownItem.color ?? Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
