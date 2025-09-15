import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/material.dart';

import '../../../../config/colors.dart';
import '../../../common/app_texts.dart';
import '../../models/ir_response_product_data.dart';

class IrSkuDetailsWidget extends StatelessWidget {
  const IrSkuDetailsWidget({
    required this.irProductResponse,
    required this.filteredMustSellSku,
    required this.filteredPremiumSku,
    required this.filteredOtherSku,
    this.isPreviousVisit = false,
    super.key,
  });

  final List<IrResponseProductData> irProductResponse;

  final List<IrResponseProductData> filteredMustSellSku;
  final List<IrResponseProductData> filteredPremiumSku;
  final List<IrResponseProductData> filteredOtherSku;
  final bool isPreviousVisit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Center(
            child: Text(
              AppTexts().kSkuDetails.toUpperCase(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Divider(height: 24),
          if (irProductResponse.isEmpty)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(AppTexts().kNoSkuDetected),
              ),
            )
          else
            Column(
              children: [
                if (filteredMustSellSku.isNotEmpty)
                  IdentifiedSkuListWithLabel(
                    skuList: filteredMustSellSku,
                    label:
                        "${AppTexts().kMustSell} (${filteredMustSellSku.length})",
                  ),
                if (filteredPremiumSku.isNotEmpty)
                  IdentifiedSkuListWithLabel(
                    skuList: filteredPremiumSku,
                    label:
                        "${AppTexts().kPremiumSku} (${filteredPremiumSku.length})",
                  ),
                if (filteredOtherSku.isNotEmpty)
                  IdentifiedSkuListWithLabel(
                    skuList: filteredOtherSku,
                    label: isPreviousVisit
                        ? "${AppTexts().kSkus.toUpperCase()} (${filteredOtherSku.length})"
                        : "${AppTexts().kOther} ${AppTexts().kSku.toUpperCase()} (${filteredOtherSku.length})",
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class IdentifiedSkuListWithLabel extends StatelessWidget {
  const IdentifiedSkuListWithLabel({
    required this.skuList,
    required this.label,
    super.key,
  });

  final List<IrResponseProductData> skuList;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      "${skuList[index].label.toUpperCase()} ${isDebug ? skuList[index].id : ''}",
                      style: TextStyle(
                        color: AppColors.kLightGrey,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${skuList[index].count} pcs",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              );
            },
            itemCount: skuList.length,
          ),
        ],
      ),
    );
  }
}
