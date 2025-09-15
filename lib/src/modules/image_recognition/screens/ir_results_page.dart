import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/material.dart';

import '../bloc/ir_bloc.dart';
import '../models/ir_assets_model.dart';
import 'new_ir_results_screen.dart';

class IrResultsPage extends StatefulWidget {
  const IrResultsPage({required this.onProceed, required this.irBloc, super.key});

  final void Function() onProceed;
  final IrBloc irBloc;

  @override
  State<IrResultsPage> createState() => _IrResultsPageState();
}

class _IrResultsPageState extends State<IrResultsPage> {

  @override
  void initState() {
    super.initState();
    prepareAssetsList();
  }

  Future<void> prepareAssetsList() async {
    await widget.irBloc.prepareListOfInputDataCategories();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<IrAssetsModel>?>(
      stream: widget.irBloc.assetsListOfInputCategories,
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          final listOfAssets = snapshot.data!;
          final listOfEquipments = widget.irBloc.equipmentListOfInputCategories.value;
          return NewIrResultsScreen(
            onProceed: widget.onProceed,
            listOfAssets: listOfAssets,
            listOfEquipments: listOfEquipments ?? [],
            irBloc: widget.irBloc,
          );
        }
        return Scaffold(
          body: Center(
            child: Lottie.asset(
              'assets/animations/ir_detection_on_progress.json',
              height: 100,
              width: 100,
            ),
          ),
        );
      },
    );
  }
}
