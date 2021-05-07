import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/company_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForceEndDayPage extends StatefulWidget {
  final Function onForceEndDay;

  const ForceEndDayPage({required this.onForceEndDay});

  @override
  _ForceEndDayPageState createState() => _ForceEndDayPageState();
}

class _ForceEndDayPageState extends State<ForceEndDayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('End Previous Day'),
      ),
      bottomNavigationBar: BottomActionButton(
        title: 'PROCEED',
        onPressed: () => widget.onForceEndDay.call(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 70,
            child: CompanyLogo(),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Looks like your previous retailing session has not been ended yet."
              "\n\nPlease End Day to continue.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
