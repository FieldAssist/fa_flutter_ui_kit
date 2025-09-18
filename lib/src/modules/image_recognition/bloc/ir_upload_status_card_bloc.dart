import 'package:fa_flutter_core/fa_flutter_core.dart';

import '../models/ir_master_model.dart';
import '../models/task_status.dart';

class IrUploadStatusCardBloc {
  IrUploadStatusCardBloc();

  final _progressStream = BehaviorSubject<bool?>.seeded(null);

  BehaviorSubject<bool?> get progressStream => _progressStream;

  IrMasterModel? _prevVisit;

  IrMasterModel? get prevVisit => _prevVisit;

  void progress(IrMasterModel currentMasterModel) {
    _prevVisit = currentMasterModel;

    if (_prevVisit != null) {
      switch (_prevVisit!.syncStatus) {
        case TaskStatus.draft:
          _progressStream.add(null);
          return;
        case TaskStatus.completed:
          _progressStream.add(true);
          return;
        case TaskStatus.pending:
        case TaskStatus.fail:
          _progressStream.add(false);
          return;
      }
    }
  }
}
