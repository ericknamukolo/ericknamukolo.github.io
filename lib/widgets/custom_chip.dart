import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/constants.dart';

class CustomChip extends StatelessWidget {
  const CustomChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Text('JavaScript',
          style: kNormalTextStyleWhite.copyWith(fontSize: 12)),
      decoration: BoxDecoration(
          color: kprimaryColor.withOpacity(.1),
          border: Border.all(
            color: kprimaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(50.0)),
    );
  }
}
