import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:portfolio/providers/analytics.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HomeIconHover extends StatefulWidget {
  final IconData icon;
  final Color color;
  bool isMobile;
  HomeIconHover({
    Key? key,
    required this.icon,
    required this.color,
    this.isMobile = false,
  }) : super(key: key);

  @override
  State<HomeIconHover> createState() => _HomeIconHoverState();
}

class _HomeIconHoverState extends State<HomeIconHover> {
  Color iconColor = const Color(0xffB3A595);
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          iconColor = widget.color;
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          iconColor = const Color(0xffB3A595);
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: () async {
          if (widget.icon == MdiIcons.linkedin) {
            Analytics.trackVisit('linkedIn');
            await launch(
              'https://www.linkedin.com/in/ericknamukolo/',
            );
          } else if (widget.icon == MdiIcons.github) {
            Analytics.trackVisit('github');
            await launch(
              'https://github.com/ericknamukolo',
            );
          } else if (widget.icon == Icons.whatsapp_rounded) {
            Analytics.trackVisit('whatsApp');
            var whatsappUrl = 'https://wa.me/260962885743?text=Hello';
            await launch(whatsappUrl);
          } else if (widget.icon == MdiIcons.facebook) {
            Analytics.trackVisit('fb');
            await launch(
              'https://www.facebook.com/ericnamukolo/',
            );
          } else if (widget.icon == MdiIcons.googlePlay) {
            Analytics.trackVisit('playStore');
            await launch(
              'https://play.google.com/store/apps/dev?id=8203990443766365712',
            );
          }
        },
        child: Padding(
          padding: widget.isMobile
              ? const EdgeInsets.symmetric(horizontal: 8)
              : const EdgeInsets.only(right: 10),
          child: _isHovered
              ? GlowIcon(
                  widget.icon,
                  glowColor: iconColor,
                  size: 26,
                  color: iconColor,
                )
              : Icon(
                  widget.icon,
                  size: 26,
                  color: iconColor,
                ),
        ),
      ),
    );
  }
}
