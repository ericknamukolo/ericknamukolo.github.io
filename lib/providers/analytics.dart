import 'package:cloud_firestore/cloud_firestore.dart';

class Analytics {
  static Future<void> trackVisit(String analyticData) async {
    try {
      var data = await FirebaseFirestore.instance
          .collection('analytics')
          .doc('data')
          .get();
      int newValue = int.parse(data.data()![analyticData].toString()) + 1;
      await FirebaseFirestore.instance
          .collection('analytics')
          .doc('data')
          .update({analyticData: newValue});
    } catch (e) {
      print(e);
    }
  }
}
