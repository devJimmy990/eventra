import 'dart:io';
import 'package:eventra/core/constants/acc.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLauncher {
  static ExternalLauncher? _instance;

  ExternalLauncher._();
  factory ExternalLauncher() => _instance ??= ExternalLauncher._();

  static launchMail({
    required String name,
    required String email,
    required String phone,
    required String message,
  }) async {
    final Uri uri = Uri.parse(
        "mailto:${AccConstants.email}?subject=${Uri.encodeComponent('help')}&body=${Uri.encodeComponent('''
Name: $name
Phone: $phone

Message:
$message
        ''')}");

    await _launchUrl(uri);
  }

  static launchCaller() async {
    final Uri uri = Uri.parse('tel:${AccConstants.phone}');
    await _launchUrl(uri);
  }

  static launchWhatsapp() async {
    final url = Platform.isAndroid
        ? 'https://wa.me/${AccConstants.whatsapp}'
        : 'https://api.whatsapp.com/send?phone=${AccConstants.whatsapp}';
    await _launchUrl(Uri.parse(url));
  }

  static _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  static launchTwitter() async =>
      await _launchUrl(Uri.parse(AccConstants.twitter));

  static launchYoutube() async =>
      await _launchUrl(Uri.parse(AccConstants.youtube));

  static launchInstagram() async =>
      await _launchUrl(Uri.parse(AccConstants.instagram));

  static launchLocation({String? location}) async =>
      await _launchUrl(Uri.parse(location ?? AccConstants.location));

  static launchFacebook() async =>
      await _launchUrl(Uri.parse(AccConstants.facebook));
}
