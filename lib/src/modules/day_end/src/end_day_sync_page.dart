import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/modules/common/data_stream_builder/data_stream_builder.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/company_logo.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/my_linear_progress_indicator.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class EndDaySyncPage extends StatefulWidget {
  //TODO(TusharFA): Add abstract class.
  final bloc;
  final Function onSuccess;

  const EndDaySyncPage({required this.bloc, required this.onSuccess});

  @override
  _EndDaySyncPageState createState() => _EndDaySyncPageState();
}

class _EndDaySyncPageState extends State<EndDaySyncPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    final result = await widget.bloc.endTheDay();
    result.when(
      success: () => widget.onSuccess(),
      failure: (e) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DataStreamBuilder<bool?>(
        stream: widget.bloc.subject,
        onData: (data) {
          return Center(
            child: Text('End Day successful'),
          );
        },
        onLoading: () {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 70,
                  child: CompanyLogo(),
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    Images.acceleratingGrowth,
                  ), //TODO:(Samvit)  Add start day sync cloud image
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    Texts.dayEndSync,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: MyLinearProgressIndicator(),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: StreamBuilder<bool?>(
        stream: widget.bloc.subject,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return BottomActionButton(
              title: 'Retry'.toUpperCase(),
              showIcon: false,
              onPressed: widget.bloc.endTheDay,
            );
          } else {
            return SizedBox(
              height: 0,
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}
