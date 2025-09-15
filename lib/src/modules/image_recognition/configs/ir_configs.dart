import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/app_theme_config.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/session_repo_ir.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/sku_repo_ir.dart';

import 'ir_company_config_provider.dart';

class IrConfigs {
  final SkuRepositoryIR skuRepositoryIR;
  final SessionRepositoryIR sessionRepositoryIR;
  final AppThemeConfigProvider appThemeConfigProvider;
  final IrCompanyConfigProvider companyConfigProvider;
  final bool isUserJsr;

  IrConfigs({
    required this.skuRepositoryIR,
    required this.sessionRepositoryIR,
    required this.appThemeConfigProvider,
    required this.companyConfigProvider,
    required this.isUserJsr,
  });
}
