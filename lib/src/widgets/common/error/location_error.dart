import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:fa_flutter_ui_kit/src/config/colors.dart';
import 'package:flutter/material.dart';

import '../rounded_action_button.dart';

class LocationErrorWidget extends StatelessWidget {
  const LocationErrorWidget({
    required this.error,
    this.onRefreshTap,
    this.pop = true,
    Key? key,
  }) : super(key: key);

  final String error;

  final bool pop;
  final VoidCallback? onRefreshTap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(top: 64, bottom: 14),
        child: Column(
          children: [
            Image.asset(
              Images.superCommander,
              width: MediaQuery.of(context).size.shortestSide / 2,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              error,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Super Commander needs location',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.kLightGrey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xFFF2F2F2),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                shadows: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please try the following things:',
                    style: TextStyle(
                      color: const Color(0xFF454545),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Item 1
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                        child: Text(
                          '1.',
                          style: _buildTextStyle(),
                        ),
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              _buildTextSpan('Turn on '),
                              _buildTextSpan('Location Services', isBold: true),
                              _buildTextSpan(
                                  ' in your device settings and set accuracy to '),
                              _buildTextSpan('High/Precise', isBold: true),
                              _buildTextSpan('.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Item 2
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                        child: Text(
                          '2.',
                          style: _buildTextStyle(),
                        ),
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              _buildTextSpan('Go to '),
                              _buildTextSpan('App Settings > Permissions',
                                  isBold: true),
                              _buildTextSpan(' and allow '),
                              _buildTextSpan('location access', isBold: true),
                              _buildTextSpan(' for this app.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Item 3
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                        child: Text(
                          '3.',
                          style: _buildTextStyle(),
                        ),
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              _buildTextSpan('Test by opening '),
                              _buildTextSpan('Google Maps', isBold: true),
                              _buildTextSpan(' - if it shows your location, '),
                              _buildTextSpan('restart this app', isBold: true),
                              _buildTextSpan('.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Item 3
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                        child: Text(
                          '4.',
                          style: _buildTextStyle(),
                        ),
                      ),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              _buildTextSpan('If issues persist, '),
                              _buildTextSpan('restart your device',
                                  isBold: true),
                              _buildTextSpan(' and try again.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              textAlign: TextAlign.center,
              "Your location helps your manager review your work accurately.",
              style: TextStyle(
                color: AppColors.kLightGrey,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Flexible(
                    child: RoundedRectangleButton(
                      text: "Retry",
                      hasBorder: true,
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.kDarkBlue,
                      ),
                      color: AppColors.kLightBlue,
                      height: 40,
                      icon: Icon(
                        size: 20,
                        Icons.refresh,
                        color: AppColors.kDarkBlue,
                      ),
                      showIcon: true,
                      ontap: onRefreshTap,
                      gradient: null,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: RoundedRectangleButton(
                      text: "Open Settings",
                      height: 40,
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                      showIcon: false,
                      color: AppColors.kDarkBlue,
                      ontap: () async {
                        final isServiceEnabled =
                            await Geolocator.isLocationServiceEnabled();
                        if (!isServiceEnabled) {
                          await Geolocator.openLocationSettings();
                        } else {
                          await Geolocator.openAppSettings();
                        }
                        onRefreshTap?.call();
                      },
                      gradient: LinearGradient(
                        begin: Alignment(1.00, 1.01),
                        end: Alignment(0.05, 0.14),
                        colors: [
                          const Color(0xFF07378B),
                          const Color(0xFF0A85ED)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for consistent text style
  TextStyle _buildTextStyle({bool isBold = false}) {
    return TextStyle(
      color: Colors.black.withValues(alpha: 0.54),
      fontSize: 14,
      fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
      height: 1.6,
      letterSpacing: 0.12,
    );
  }

// Helper method to create consistent TextSpan widgets
  TextSpan _buildTextSpan(String text, {bool isBold = false}) {
    return TextSpan(
      text: text,
      style: _buildTextStyle(isBold: isBold),
    );
  }
}
