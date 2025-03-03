import 'dart:io';
import 'package:eventra/core/constants/acc.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLauncher {
  static ExternalLauncher? _instance;

  ExternalLauncher._();
  factory ExternalLauncher() => _instance ??= ExternalLauncher._();

  Future<void> launchMail({
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

  Future<void> launchCaller() async {
    final Uri uri = Uri.parse('tel:${AccConstants.phone}');
    await _launchUrl(uri);
  }

  Future<void> launchWhatsapp() async {
    final url = Platform.isAndroid
        ? 'https://wa.me/${AccConstants.whatsapp}'
        : 'https://api.whatsapp.com/send?phone=${AccConstants.whatsapp}';
    await _launchUrl(Uri.parse(url));
  }

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  Future<void> launchTwitter() async =>
      await _launchUrl(Uri.parse(AccConstants.twitter));

  Future<void> launchYoutube() async =>
      await _launchUrl(Uri.parse(AccConstants.youtube));

  Future<void> launchInstagram() async =>
      await _launchUrl(Uri.parse(AccConstants.instagram));

  Future<void> launchLocation() async =>
      await _launchUrl(Uri.parse(AccConstants.location));

  Future<void> launchFacebook() async =>
      await _launchUrl(Uri.parse(AccConstants.facebook));
}
