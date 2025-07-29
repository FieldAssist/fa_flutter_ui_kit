import 'package:flutter/material.dart';

class BuildInfoWidget extends StatelessWidget {
  final Future<String> Function() getBuildNumber;
  final Future<String> Function() getBuildVersion;

  const BuildInfoWidget({
    Key? key,
    required this.getBuildNumber,
    required this.getBuildVersion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: Future.wait([
        getBuildNumber(),
        getBuildVersion(),
      ]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            snapshot.data != null) {
          final buildNumber = snapshot.data![0];
          final buildVersion = snapshot.data![1];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Build: $buildNumber',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'v$buildVersion',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
