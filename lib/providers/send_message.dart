import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/services/send_notification.dart';

class Message {
  static Future<void> sendMessage({
    required String sender,
    required String email,
    required String message,
  }) async {
    await FirebaseFirestore.instance.collection('messages').add({
      'sender': sender.trim(),
      'email': email.trim(),
      'message': message.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });
    var ref = await adminRef.once();
    await SendNotification.sendMessageNotification(
        sender: sender, message: message, userToken: ref.value['fcmToken']);
  }
}
