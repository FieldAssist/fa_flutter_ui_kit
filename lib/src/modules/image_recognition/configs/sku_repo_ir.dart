import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/ir_sku.dart';

abstract class SkuRepositoryIR {
  List<int> get mustSellSkus;

  List<int> get focusProducts;

  Set<int> get premiumSkus;

  Map<int, IrSku> get idVsSkus;

}
