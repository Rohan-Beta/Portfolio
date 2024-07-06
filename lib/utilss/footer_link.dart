import 'package:url_launcher/url_launcher.dart';

class FooterLink {
  static Future<void> launchURL(String link) async {
    final url = Uri(scheme: 'https', path: link);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "could not launch $url";
    }
  }
}
