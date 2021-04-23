library fa_flutter_ui_kit;

//Initialiaze config file to use the ui-kit
export 'src/config/index.dart';
export 'src/constants/index.dart';
export 'src/core/index.dart';
export 'src/data/index.dart';
export 'src/navigator/index.dart';
export 'src/modules/index.dart';
export 'src/utils/index.dart';
export 'src/widgets/index.dart';

/// A Calculator
class Calculator {
  ///Returns [value] plus 1
  int addOne(int value) => value + 1;
}
