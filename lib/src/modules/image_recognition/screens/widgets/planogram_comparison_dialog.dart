import 'package:cached_network_image/cached_network_image.dart';
import 'package:fa_flutter_ui_kit/src/modules/image_recognition/configs/app_theme_config.dart';
import 'package:flutter/material.dart';


class PlanogramComparisonDialog extends StatefulWidget {
  final String idealImageUrl;
  final String capturedImageUrl;
  final List<String> insights;
  final AppThemeConfigProvider appThemeConfigProvider;

  const PlanogramComparisonDialog({
    Key? key,
    required this.idealImageUrl,
    required this.capturedImageUrl,
    required this.insights,
    required this.appThemeConfigProvider,
  }) : super(key: key);

  @override
  _PlanogramComparisonDialogState createState() =>
      _PlanogramComparisonDialogState();
}

class _PlanogramComparisonDialogState extends State<PlanogramComparisonDialog> {
  bool _showIdeal = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header with title and close button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ideal Shelf Planogram',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Tab selector
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _showIdeal = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        gradient: _showIdeal
                            ? widget.appThemeConfigProvider.appThemeGradient
                            : null,
                        color: _showIdeal
                            ? widget.appThemeConfigProvider.appThemePrimaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        border: Border.all(
                          color: _showIdeal
                              ? Color(0xFFA31621)
                              : Colors.grey.shade300,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Ideal',
                        style: TextStyle(
                          color: _showIdeal ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _showIdeal = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        gradient: _showIdeal
                            ? null
                            : widget.appThemeConfigProvider.appThemeGradient,
                        color: _showIdeal
                            ? Colors.white
                            : widget.appThemeConfigProvider.appThemePrimaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        border: Border.all(
                          color: !_showIdeal
                              ? Color(0xFFA31621)
                              : Colors.grey.shade300,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Captured',
                        style: TextStyle(
                          color: !_showIdeal ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Image
            Container(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: _showIdeal
                      ? widget.idealImageUrl
                      : widget.capturedImageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Insights section
            Text(
              'Insights to improve score',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),

            // Insights bullet points
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.insights.map((insight) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• ', style: TextStyle(fontSize: 14)),
                          Expanded(
                            child: Text(
                              insight,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
