import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../constants/svgs.dart';
import '../../../utils/log_utils.dart';

enum ApiStatus {
  pending,
  success,
  failed,
}

/// * [dataProgressStream] : it used for get stream for show animatedLoader
/// * [entityStatusStream] : it should be Map<String,apiStatus> for display all entity name
/// * [kText] : all translated text should be write in list with correct index to display
class DataLoadingProgressWidget extends StatelessWidget {
  final Stream<DataLoadingProgress> dataProgressStream;
  final Stream<Map<String, ApiStatus>> entityStatusStream;
  final ItemScrollController scrollController;
  final List? kTexts;
  final bool? hideScrollList;
  final void Function(int count) onScrollTrigger;

  const DataLoadingProgressWidget({
    Key? key,
    required this.dataProgressStream,
    required this.entityStatusStream,
    required this.scrollController,
    required this.onScrollTrigger,
    this.hideScrollList = false,
    this.kTexts = const [
      "Fetching data",
      "Please wait while we fetch the data."
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Progress Bar
        StreamBuilder<DataLoadingProgress>(
          stream: dataProgressStream,
          builder: (_, snapshot) {
            final progress = snapshot.data?.progress ?? 0;
            return AnimatedLoader(
              baseColor: Colors.amber,
              highlightColor: Colors.grey[300] ?? Colors.grey,
              progress: progress,
            );
          },
        ),

        const SizedBox(height: 10),

        /// Heading Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            kTexts?[0],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),

        const SizedBox(height: 10),

        /// Sub Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            kTexts?[1],
            style: const TextStyle(fontSize: 14),
          ),
        ),

        /// Entity Status List
        if (hideScrollList == false)
          StreamBuilder<Map<String, ApiStatus>>(
            stream: entityStatusStream,
            builder: (_, snapshot) {
              final mapData = snapshot.data ?? {};
              final entries = mapData.entries.toList();

              try {
                if (entries.length > 3) {
                  onScrollTrigger(entries.length);
                }
              } catch (e, s) {
                logger.e(e, s);
              }

              return Container(
                height: 200,
                margin: const EdgeInsets.symmetric(vertical: 25),
                child: Center(
                  child: ScrollConfiguration(
                    behavior: NoGlowScrollBehavior(),
                    child: ScrollablePositionedList.builder(
                      shrinkWrap: true,
                      itemScrollController: scrollController,
                      itemCount: entries.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index < 0 || index >= entries.length) {
                          return Container();
                        }
                        final model = entries[index].key;
                        final status = entries[index].value;

                        final entityName = model;

                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 50),
                          child: Row(
                            children: [
                              if (status == ApiStatus.success ||
                                  status == ApiStatus.pending)
                                SvgPicture.asset(
                                  status == ApiStatus.success
                                      ? Svgs.checkSvg
                                      : Svgs.checkMarkRounded,
                                  height: 20,
                                  width: 20,
                                  package: 'fa_flutter_ui_kit',
                                )
                              // status == apiStatus.error
                              else
                                Icon(
                                  Icons.replay_outlined,
                                ),
                              const SizedBox(width: 5),
                              Text('Fetching ${entityName.toString()}'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
