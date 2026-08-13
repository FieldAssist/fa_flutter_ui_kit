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
    this.identifier,
  });

  final String type;
  final int orderedProductCount;
  final int totalProductCount;
  final bool isContainSingleValue;
  final String singleValue;

  /// Optional `Semantics(identifier:)` for E2E tests.
  ///
  /// Pass a STABLE KIND, never [type]. `type` is the rendered label and is
  /// company-config driven (`nomenClature?.buyAgain ?? kBestSeller`), so keying
  /// on it would make an admin renaming a row look like a UI change to a
  /// structural regression check. Which rows exist IS structure; what they are
  /// called is not.
  final String? identifier;
}

class AmountBreakdown {
  AmountBreakdown({
    required this.type,
    required this.amount,
    this.color,
    this.amtPrefix = "",
    this.valueStyle,
    this.typeStyle,
    this.identifier,
  });

  final String type;
  final double amount;
  final Color? color;

  /// Optional `Semantics(identifier:)` for E2E tests — see
  /// [QuantityBreakdown.identifier]. Pass a stable kind, not [type].
  final String? identifier;

  /// It can be used to denote negative (-) amount
  /// Eg: -₹ 100 so you can pass amtPrefix as "-"
  final String amtPrefix;

  final TextStyle? valueStyle;
  final TextStyle? typeStyle;
}

class OrderAmountSummaryWidget extends StatelessWidget {
  OrderAmountSummaryWidget({
    required this.qtyDisplayText,
    required this.distributorName,
    required this.distributorAddress,
    required this.quantityBreakdownList,
    required this.amountBreakdownList,
    required this.marginPercentage,
    required this.marginAmount,
    required this.payableAmount,
    required this.mainColor,
    required this.currencyUtil,
    this.customWidget,
    this.currency = "₹",
    this.showMargin = true,
    this.discountWidget,
    this.isDistributorVisible = false,
    this.qtyTitleText,
    this.payableAmtTitleText,
    this.distributorTitleText,
    this.decimalInfoString,
    this.breakDownListPadding =
        const EdgeInsets.only(bottom: 2, left: 2, right: 2),
    this.compactNumber = false,
    this.payableAmountInSecondCurrency,
    this.isRestrictStockValueVisibility = false,
    this.miscWidget,
    super.key,
  });

  final String qtyDisplayText;
  final String distributorName;
  final String? decimalInfoString;
  final String distributorAddress;
  final String currency;
  final List<QuantityBreakdown> quantityBreakdownList;
  final List<AmountBreakdown> amountBreakdownList;
  final CurrencyUtil currencyUtil;

  /// It appears After Qty Info and before Payable Amount Info
  final Widget? discountWidget;
  final double marginPercentage;
  final double marginAmount;
  final String payableAmount;
  final Color mainColor;
  final Widget? customWidget;
  final bool showMargin;
  final bool isDistributorVisible;
  final String? qtyTitleText;
  final String? payableAmtTitleText;
  final String? distributorTitleText;
  final EdgeInsets breakDownListPadding;
  final bool compactNumber;
  final String? payableAmountInSecondCurrency;
  final Widget? miscWidget;

  final bool isRestrictStockValueVisibility;
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      qtyTitleText ?? "Total Quantity",
                      style: titleTextStyle,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: Text(
                      qtyDisplayText,
                      style: subTitleTextStyle,
                      textAlign: TextAlign.end,
                    ),
                  ),
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
                  (index) => Semantics(
                    identifier: quantityBreakdownList[index].identifier ?? '',
                    // The row's two Texts merge into this node, which is what we
                    // want: the id marks that the ROW EXISTS. Its values are data
                    // and deliberately not addressable.
                    child: Padding(
                      padding: breakDownListPadding,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(quantityBreakdownList[index].type,
                                style: subTitleTextStyle),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: Text(
                                quantityBreakdownList[index].isContainSingleValue
                                    ? "${quantityBreakdownList[index].singleValue}"
                                    : "${quantityBreakdownList[index].orderedProductCount} / ${quantityBreakdownList[index].totalProductCount}",
                                style: subTitleTextStyle.copyWith(
                                    color: Colors.black),
                                textAlign: TextAlign.end),
                          ),
                        ],
                      ),
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
            if (!isRestrictStockValueVisibility)
              ExpansionTile(
                shape: RoundedRectangleBorder(side: BorderSide.none),
                visualDensity: VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity),
                childrenPadding: EdgeInsets.only(
                    left: 16 + 45, right: 16, top: 8, bottom: 8),
                leading: SvgPicture.asset(
                  SvgIcons.cashIcon,
                  height: 25,
                  width: 25,
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        payableAmtTitleText ?? "Payable Amount",
                        style: titleTextStyle,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "$currency $payableAmount",
                            style: titleTextStyle,
                          ),
                          if (payableAmountInSecondCurrency != null)
                            Text(
                              "(\u0024 $payableAmountInSecondCurrency)",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                        ],
                      ),
                    )
                  ],
                ),
                initiallyExpanded: true,
                trailing: (showMargin || amountBreakdownList.isNotEmpty)
                    ? null
                    : SizedBox.shrink(),
                children: [
                  if (showMargin)
                    Padding(
                      padding: breakDownListPadding,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Margin (%)",
                              style: subTitleTextStyle.copyWith(
                                  color: AppColors.colorGreenLight),
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: Text(
                              "$currency $marginAmount ($marginPercentage%)",
                              style: subTitleTextStyle.copyWith(
                                  color: AppColors.colorGreenLight),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ...List.generate(
                    amountBreakdownList.length,
                    (index) {
                      final amtBreakdownItem = amountBreakdownList[index];
                      return Semantics(
                        identifier: amtBreakdownItem.identifier ?? '',
                        child: Padding(
                          padding: breakDownListPadding,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(amtBreakdownItem.type,
                                    style: amtBreakdownItem.typeStyle ??
                                        subTitleTextStyle),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "${amtBreakdownItem.amtPrefix}$currency ${currencyUtil.formatNumber(amtBreakdownItem.amount, compact: compactNumber)}",
                                  style: subTitleTextStyle.copyWith(
                                    color:
                                        amtBreakdownItem.color ?? Colors.black,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            if (miscWidget != null) ...[
              DottedDivider(),
              miscWidget!,
            ],
            if (decimalInfoString != null)
              Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 2),
                child: Text(
                  decimalInfoString!,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: AppColors.kLightGrey,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
