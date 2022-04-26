import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class DiamondFirebaseMessaging {
  static Function? prepareCallback;

  static setPrepareCallback(Function fn) {
    prepareCallback = fn;
  }

  static create() {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
          print("FirebaseMessaging.instance.getInitialMessage()");
          print(message);
      if (message != null) {
        prepare(message);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      print("FirebaseMessaging.onMessage");
      print(message.data);

      prepare(message);
      
      if (notification != null && android != null) {        
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,        
          NotificationDetails(
            android: AndroidNotificationDetails(
              "app-190876",
              "data",
              icon: '@mipmap/ic_launcher',              
            ),
          ),
          payload: jsonEncode(message.data)
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');

      prepare(message);
    });

    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  }

  static subscribeToTopic(String topic) {
    FirebaseMessaging.instance.subscribeToTopic(topic);
  }

  static registerToFCM({
    Function? callback
  }) async {
    FirebaseMessaging.instance.getToken().then(
      (String? token) {
        if (callback == null) {
          callback!.call();
        }
      }
    );
  }

  static prepare(RemoteMessage message) {
    if (prepareCallback != null) {
      prepareCallback!.call();
    }
  }
}

Future<void> onBackgroundMessage(RemoteMessage message) async => DiamondFirebaseMessaging.prepare(message);