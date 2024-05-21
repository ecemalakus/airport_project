import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DiscoverController extends GetxController {
  Future<void> launchInWebView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }
}
