import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UntrustedDeviceWidget extends StatelessWidget {
  final bool isDeveloperMode;
  final bool isAutoTimeZoneEnabled;
  final bool isAutoTimeEnabled;

  const UntrustedDeviceWidget({
    Key? key,
    required this.isDeveloperMode,
    required this.isAutoTimeZoneEnabled,
    required this.isAutoTimeEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  FontAwesomeIcons.triangleExclamation,
                  size: 64,
                  color: Colors.orange,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Device Security Alert',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                if (isDeveloperMode)
                  _buildSettingItem(
                    title: 'Developer Mode is enabled',
                    description:
                    'Please disable Developer options in your device settings.\n1. Go to Settings\n2. Tap on System > Developer Options\n3. Turn off the toggle at the top',
                    onTap: () => AppSettings.openAppSettings(
                        type: AppSettingsType.developer, asAnotherTask: true),
                    icon: Icons.developer_mode,
                  ),
                if (!isAutoTimeZoneEnabled)
                  _buildSettingItem(
                    title: 'Automatic Time Zone is disabled',
                    description:
                    'Please enable automatic time zone in your device settings.\n1. Go to Settings\n2. Tap on System > Date & Time\n3. Enable "Automatic time zone"',
                    onTap: () => AppSettings.openAppSettings(
                        type: AppSettingsType.date, asAnotherTask: true),
                    icon: Icons.access_time_filled,
                  ),
                if (!isAutoTimeEnabled)
                  _buildSettingItem(
                    title: 'Automatic Time is disabled',
                    description:
                    'Please enable automatic time in your device settings.\n1. Go to Settings\n2. Tap on System > Date & Time\n3. Enable "Automatic date & time"',
                    onTap: () => AppSettings.openAppSettings(
                        type: AppSettingsType.date, asAnotherTask: true),
                    icon: Icons.schedule,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    required String description,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.red, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Open Settings',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
