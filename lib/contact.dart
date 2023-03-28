import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return (width > 1100)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  // height: 240,
                  child: Image.asset('assets_low/blur_treffy.jpg'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Basak Swarup is an amateur photographer \nbased in India and creates content with his waifu \nFujifilm XE-4',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.ebGaramond(
                          color: Colors.black, fontSize: 24, letterSpacing: 1),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'For all collaborations \n& other inquiries please contact:',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.ebGaramond(
                          color: Colors.black, fontSize: 24, letterSpacing: 1),
                    ),
                  ),
                  TextButton(
                    onPressed: () => launchMailto(),
                    child: Text(
                      'basakswarup10@gmail.com',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.ebGaramond(
                          color: Colors.black,
                          fontSize: 24,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () async {
                            const url = 'https://www.instagram.com/b0shakk/';
                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          icon: FaIcon(FontAwesomeIcons.instagram)),
                      IconButton(
                          onPressed: () async {
                            const url = 'https://www.linkedin.com/in/b0shakk/';
                            if (await canLaunchUrlString(url)) {
                              await launchUrlString(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          icon: FaIcon(FontAwesomeIcons.linkedin)),
                    ],
                  ),
                ],
              )
            ],
          )
        : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    // height: 240,
                    child: Image.asset('assets_low/25.jpg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Basak Swarup is an amateur photographer \nbased in India and creates content with his waifu \nFujifilm XE-4',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ebGaramond(
                        color: Colors.black, fontSize: 24, letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'For all collaborations & \nother inquiries please contact:',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ebGaramond(
                        color: Colors.black, fontSize: 24, letterSpacing: 1),
                  ),
                ),
                TextButton(
                  onPressed: () => launchMailto(),
                  child: Text(
                    'basakswarup10@gmail.com',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.ebGaramond(
                        color: Colors.black,
                        fontSize: 24,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () async {
                          const url = 'https://www.instagram.com/b0shakk/';
                          if (await canLaunchUrlString(url)) {
                            await launchUrlString(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        icon: FaIcon(FontAwesomeIcons.instagram)),
                    IconButton(
                        onPressed: () async {
                          const url = 'https://www.linkedin.com/in/b0shakk/';
                          if (await canLaunchUrlString(url)) {
                            await launchUrlString(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        icon: FaIcon(FontAwesomeIcons.linkedin)),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          );
  }
}

Future launchMailto() async {
  final Uri url = Uri(
    scheme: 'mailto',
    path: 'basakswarup10@gmail.com',
  );

  // String mail = "basakswarup10@gmail.com";
  // final url = 'mailto:$mail';

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
