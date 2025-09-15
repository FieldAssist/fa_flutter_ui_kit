import 'package:collection/collection.dart';

enum IrKpiEnum {
  shareOfShelf(0, "Share of Shelf"),
  brandFaceCount(1, "Brand Face Count"),
  planogramCompliance(2, "Planogram Compliance"),
  mustSellSKUCount(3, "Must Sell SKU Count"),
  focusedSKUCount(4, "Focused SKU Count"),
  premiumSkuCount(5, "Premium SkuCount"),
  coolerPurity(6, "Cooler Purity");

  const IrKpiEnum(this.value, this.title);

  final int value;
  final String title;
}

IrKpiEnum? irKpiEnumFromJson(int? value) {
  if (value == null) {
    return null;
  }
  return IrKpiEnum.values.firstWhereOrNull(
    (e) => e.value == value,
  );
}

int? irKpiEnumToJson(IrKpiEnum? enumValue) {
  return enumValue?.value;
}
