import 'package:eventra/core/external_launcher.dart';
import 'package:eventra/features/user/contact-us/presentation/general_info.dart';
import 'package:eventra/features/user/contact-us/presentation/mail_form.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ExternalLauncher launcher = ExternalLauncher();
    return Scaffold(
      appBar: AppBar(title: Text("Contact Us")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (_) => GeneralInfoBottomSheet());
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.info,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            children: [
              Text(
                "Don’t hesitate to contact us whether you have a suggestion on our improvement, a complain to discuss or an issue to solve.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15),
              ),
              Row(
                spacing: 25,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: _BuildMasterContactCard(
                    icon: Icons.call,
                    text: "Call us",
                    onPress: () => launcher.launchCaller(),
                  )),
                  Expanded(
                      child: _BuildMasterContactCard(
                    icon: Icons.mail,
                    text: "Email us",
                    onPress: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          child: ContactUsMailFormBottomSheet(),
                        ),
                      );
                    },
                  )),
                ],
              ),
              _BuildSocialContactCard(
                icon: Bootstrap.facebook,
                title: "Facebook",
                message: "follow us on facebook",
                onPress: () => launcher.launchFacebook(),
              ),
              _BuildSocialContactCard(
                icon: Bootstrap.instagram,
                title: "Instagram",
                message: "follow us on instagram",
                onPress: () => launcher.launchInstagram(),
              ),
              _BuildSocialContactCard(
                icon: Bootstrap.twitter_x,
                title: "Twitter",
                message: "follow us on twitter",
                onPress: () => launcher.launchTwitter(),
              ),
              _BuildSocialContactCard(
                icon: Bootstrap.youtube,
                title: "YouTube",
                message: "subscribe our channel",
                onPress: () => launcher.launchYoutube(),
              ),
              _BuildSocialContactCard(
                icon: Bootstrap.whatsapp,
                title: "WhatsApp",
                message: "contact us on whatsapp",
                onPress: () => launcher.launchWhatsapp(),
              ),
              _BuildSocialContactCard(
                icon: Icons.location_on,
                title: "Location",
                message: "visit our location",
                onPress: () => launcher.launchLocation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildMasterContactCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onPress;
  const _BuildMasterContactCard(
      {required this.icon, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            spacing: 10,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    icon,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildSocialContactCard extends StatelessWidget {
  final IconData icon;
  final String title, message;
  final void Function() onPress;
  const _BuildSocialContactCard({
    required this.icon,
    required this.title,
    required this.message,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onPress,
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            child: Icon(
              icon,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(title),
        subtitle: Text(message),
        trailing: CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
