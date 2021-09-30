import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/desktop/widgets/icon_hover.dart';
import 'package:url_launcher/url_launcher.dart';

class TProjectCard extends StatefulWidget {
  final String id;
  final String name;
  final String type;
  final String desc;
  final String imgUrl;
  const TProjectCard({
    Key? key,
    required this.id,
    required this.name,
    required this.type,
    required this.desc,
    required this.imgUrl,
  }) : super(key: key);

  @override
  _TProjectCardState createState() => _TProjectCardState();
}

class _TProjectCardState extends State<TProjectCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1020
        ? Column(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) {
                  setState(() {
                    _isHovered = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    _isHovered = false;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 300,
                  width: double.infinity,
                  child: Stack(
                    //alignment: Alignment.centerLeft,
                    children: [
                      Positioned(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 450),
                          curve: Curves.easeInBack,
                          height: 300,
                          width: _isHovered ? 550 : 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            image: DecorationImage(
                              image: AssetImage(widget.imgUrl),
                              fit: BoxFit.cover,
                              colorFilter: _isHovered
                                  ? null
                                  : ColorFilter.mode(
                                      kprimaryColor.withOpacity(0.2),
                                      BlendMode.srcOver,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 1200),
                          curve: Curves.bounceOut,
                          height: 280,
                          width: _isHovered ? 290 : 380,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.type, style: kMiniTitleTextStylePink),
                              Text(
                                widget.name,
                                style: kTitleTextStyle.copyWith(fontSize: 30),
                              ),
                              Container(
                                height: 160,
                                width: double.infinity,
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  color: kdarkColor,
                                  borderRadius: BorderRadius.circular(6.0),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(3, 5),
                                      color: const Color(0xff000000)
                                          .withOpacity(.1),
                                      blurRadius: 2.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  widget.desc,
                                  style: kNormalTextStyleGrey,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconHover(
                                    icon: MdiIcons.github,
                                    color: kprimaryColor,
                                    click: () async {
                                      await launch(
                                        'https://www.linkedin.com/in/erick-namukolo-a49482202/',
                                      );
                                    },
                                  ),
                                  IconHover(
                                    icon: MdiIcons.openInNew,
                                    color: kprimaryColor,
                                    click: () async {
                                      await launch(
                                        'https://www.linkedin.com/in/erick-namukolo-a49482202/',
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: kprimaryColor,
                thickness: 3,
                endIndent: 450,
                indent: 450,
              ),
            ],
          )
        : Container(
            height: 350,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              image: DecorationImage(
                image: AssetImage(widget.imgUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.srcOver,
                  color: Colors.black.withOpacity(.4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 10),
                      child: Text(widget.type, style: kMiniTitleTextStylePink),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        widget.name,
                        style: kTitleTextStyle.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        widget.desc,
                        style: kNormalTextStyleWhite,
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Container(
                      color: kdarkColor,
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconHover(
                            icon: MdiIcons.github,
                            color: kprimaryColor,
                            click: () async {
                              await launch(
                                'https://www.linkedin.com/in/erick-namukolo-a49482202/',
                              );
                            },
                          ),
                          IconHover(
                            icon: MdiIcons.openInNew,
                            color: kprimaryColor,
                            click: () async {
                              await launch(
                                'https://www.linkedin.com/in/erick-namukolo-a49482202/',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
