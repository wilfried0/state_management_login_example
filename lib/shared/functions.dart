import 'package:url_launcher/url_launcher.dart';

launchURL() async {
  final Uri url = Uri.parse('https://github.com/wilfried0/state_management_login_example.git');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}