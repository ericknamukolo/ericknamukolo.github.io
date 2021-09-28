import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/contact_card.dart';
import 'package:portfolio/desktop/widgets/icon_hover.dart';
import 'package:portfolio/desktop/widgets/input_field.dart';
import 'package:portfolio/widgets/basic_button.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 160),
      width: double.infinity,
      height: 750,
      color: kdarkColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                const Text(
                  'Contact',
                  style: kMiniTitleTextStyleWhite,
                ),
                const Divider(
                  color: kprimaryColor,
                  thickness: 3,
                  endIndent: 500,
                  indent: 500,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 40),
                        height: 500,
                        decoration: BoxDecoration(
                          color: klightDarkColor,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(3, 5),
                              color: const Color(0xff000000).withOpacity(.12),
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 40),
                              child: Text(
                                'Contact Me',
                                style: kTitleTextStyle.copyWith(fontSize: 30),
                              ),
                            ),
                            Column(
                              children: const [
                                ContactCard(
                                  icon: Icons.location_pin,
                                  content: 'Lusaka, Zambia',
                                ),
                                ContactCard(
                                  icon: Icons.email,
                                  content: 'erickmndev@gmail.com',
                                ),
                                ContactCard(
                                  icon: Icons.phone,
                                  content: '+260 962 85743',
                                ),
                                ContactCard(
                                  icon: MdiIcons.whatsapp,
                                  content: '+260 973 520052 / +260 962 85743',
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                IconHover(
                                  icon: MdiIcons.linkedin,
                                  color: Color(0xff0A66C2),
                                ),
                                IconHover(
                                  icon: MdiIcons.github,
                                  color: Color(0xff171515),
                                ),
                                IconHover(
                                  icon: MdiIcons.facebook,
                                  color: Color(0xff4267B2),
                                ),
                                IconHover(
                                  icon: MdiIcons.basketball,
                                  color: Color(0xffea4c89),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    Expanded(
                      child: Container(
                        height: 500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Get in touch',
                              style: kTitleTextStyle.copyWith(fontSize: 30),
                            ),
                            const Text(
                              'Feel free to get in touch',
                              style: kNormalTextStyleGrey,
                            ),
                            const InputField(
                              hint: 'Your name',
                              maxLines: 1,
                            ),
                            const InputField(
                              hint: 'Your email',
                              maxLines: 1,
                            ),
                            const InputField(
                              hint: 'Type your message',
                              maxLines: 5,
                            ),
                            const BasicButton(
                              text: 'Send',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
