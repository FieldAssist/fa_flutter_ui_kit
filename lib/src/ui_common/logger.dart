import 'package:fa_flutter_core/fa_flutter_core.dart';

/// Where this package logs. Console-only until the host points it at its own
/// logger at startup, so errors reach the host's crash reporting.
AppLog faUiCommonLogger = AppLogImpl(packageName: 'fa_flutter_ui_kit');
