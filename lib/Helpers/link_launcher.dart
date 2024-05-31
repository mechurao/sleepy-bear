import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class LinkLauncher {
  static Future<void> _openLink(String url, String scheme) async {
    final encodedUrl = Uri.encodeFull(url);
    final appUri = Uri.parse("$scheme$encodedUrl");
    final httpUri = Uri.parse("https://$encodedUrl");

    if (Platform.isIOS || Platform.isAndroid) {
      if (await canLaunchUrl(appUri)) {
        await launchUrl(appUri, mode: LaunchMode.externalApplication);
      } else if (await canLaunchUrl(httpUri)) {
        await launchUrl(httpUri);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      if (await canLaunchUrl(httpUri)) {
        await launchUrl(httpUri);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  static Future<void> openYoutube(String url) async {
    await _openLink(url, "youtube://");
  }

  static Future<void> openTwitter(String url) async {
    await _openLink(url, "twitter://");
  }

  static Future<void> openTikTok(String url) async {
    await _openLink(url, "snssdk1233://");
  }

  static Future<void> openLink(String url) async{
    await launchUrlString(url);
  }
}
