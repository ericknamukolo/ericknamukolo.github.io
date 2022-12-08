import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/services/notification.dart';

class Analytics {
  static Future<void> trackVisit(Enum type) async {
    try {
      Notification.sendNotification(type);
      Notification.storeNotification(type);

      var data = await FirebaseFirestore.instance
          .collection('analytics')
          .doc('data')
          .get();
      int newValue = int.parse(data.data()![type.name].toString()) + 1;
      await FirebaseFirestore.instance
          .collection('analytics')
          .doc('data')
          .update({type.name: newValue});
    } catch (e) {
      print(e);
    }
  }
}
