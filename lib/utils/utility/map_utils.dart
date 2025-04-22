// lib/utils/map_utils.dart
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  static Future<void> launchGoogleMaps(double lat, double lng) async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    final Uri uri = Uri.parse(googleMapsUrl);

    if (await canLaunchUrl(uri)) {
      final bool launched =
          await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        throw 'Could not launch the map.';
      }
    } else {
      throw 'Could not launch the URL: $googleMapsUrl';
    }
  }
}
