import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

const kTextStyleWhite = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 14,
);
const kNormalTextStyleWhite = TextStyle(
  color: Colors.white,
  fontSize: 14,
);

const kMiniTitleTextStyleWhite = TextStyle(
  color: Colors.white,
  fontSize: 16,
);

const kMiniTitleTextStylePink = TextStyle(
  color: kprimaryColor,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const kNormalTextStyleGrey = TextStyle(
  color: Color(0xffB3A595),
  fontSize: 14,
);

const kTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 48,
);

const String serverToken =
    'key=AAAAwDvm_9Q:APA91bEpQxWZzdf1JAA_y1eKbFa1r26V2PO5twPU_RhdpyLEJ12xXdd0QYQYHURPdzh-zVIoe6nC8yE5Eat99WZAlr-R0ucuzTrCs8hDNn3th3wavSpIIcH6Vhah5cp-XmYniTlEDqe8';

DatabaseReference adminRef =
    FirebaseDatabase.instance.reference().child('admin');
