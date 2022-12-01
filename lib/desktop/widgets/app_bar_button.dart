import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../providers/projects.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Projects>(context, listen: false).downloadCV();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            border: Border.all(color: kprimaryColor, width: 2.0),
            color: kdarkColor,
            borderRadius: const BorderRadius.all(Radius.circular(45)),
          ),
          child: Row(
            children: [
              Text('CV', style: kNormalTextStyleWhite),
              SizedBox(width: 10),
              Icon(Icons.download_rounded, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
