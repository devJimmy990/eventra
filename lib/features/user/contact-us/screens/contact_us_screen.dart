import 'package:eventra/core/helper/localization.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:eventra/core/helper/external_launcher.dart';
import 'package:eventra/features/user/contact-us/widgets/mail_form.dart';
import 'package:eventra/features/user/contact-us/widgets/general_info.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Localization.userContact),
      ),
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
                Localization.userContactHeader,
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
                    text: Localization.userContactCallUs,
                    onPress: () => ExternalLauncher.launchCaller(),
                  )),
                  Expanded(
                      child: _BuildMasterContactCard(
                    icon: Icons.mail,
                    text: Localization.userContactEmailUs,
                    onPress: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => ContactUsMailFormBottomSheet(),
                      );
                    },
                  )),
                ],
              ),
              _BuildSocialContactCard(
                icon: Bootstrap.facebook,
                title: Localization.userContactFacebook,
                message: Localization.userContactFacebookMsg,
                onPress: () => ExternalLauncher.launchFacebook(),
              ),
              _BuildSocialContactCard(
                icon: Bootstrap.instagram,
                title: Localization.userContactInstagram,
                message: Localization.userContactInstagramMsg,
                onPress: () => ExternalLauncher.launchInstagram(),
              ),
              _BuildSocialContactCard(
                icon: Bootstrap.twitter_x,
                title: Localization.userContactTwitter,
                message: Localization.userContactTwitterMsg,
                onPress: () => ExternalLauncher.launchTwitter(),
              ),
              _BuildSocialContactCard(
                icon: Bootstrap.youtube,
                title: Localization.userContactYoutube,
                message: Localization.userContactYoutubeMsg,
                onPress: () => ExternalLauncher.launchYoutube(),
              ),
              _BuildSocialContactCard(
                icon: Bootstrap.whatsapp,
                title: Localization.userContactWhats,
                message: Localization.userContactWhatsMsg,
                onPress: () => ExternalLauncher.launchWhatsapp(),
              ),
              _BuildSocialContactCard(
                icon: Icons.location_on,
                title: Localization.userContactLocation,
                message: Localization.userContactLocationMsg,
                onPress: () => ExternalLauncher.launchLocation(),
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
