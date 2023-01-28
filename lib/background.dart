import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:app/mesRef.dart';
import 'package:telephony/telephony.dart';
import 'package:app/main.dart';

amtfinder(m) {
  if (m.contains("is debited from")) {
    var y = m.split(" ");
    var z = y[0].split('.');
    if (z.length == 3) {
      if (double.tryParse(z[1] + '.' + z[2]) != null) {
        return double.tryParse(z[1] + '.' + z[2]);
      } else {
        return null;
      }
    } else {
      return null;
    }
  } else {
    m = m.replaceAll("Rs.", "Rs. ");
    m = m.replaceAll("Rs", "Rs. ");

    List c = m.split(" ");

    double d = 0.0;

    for (var i = 0; i < c.length; i++) {
      if (double.tryParse(c[i]) != null) {
        d = double.parse(c[i]);
        break;
      }
    }

    return d;
  }
}

balfinder(m) {
  if (m.contains("is debited from")) {
    var y = m.split(" ");
    var z = y[y.length - 1];
    var q = z.split(',');

    var p = "";

    for (var i = 0; i < q.length; i++) {
      p = p + q[i];
    }

    if (double.tryParse(p) != null) {
      return double.tryParse(p);
    } else {
      return null;
    }
  } else {
    return 0;
  }
}

notify(message, currentUser) {
  FlutterLocalNotificationsPlugin flip = FlutterLocalNotificationsPlugin();

  // app_icon needs to be a added as a drawable
  // resource to the Android head project.
  var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
  var IOS = const DarwinInitializationSettings();

  // initialise settings for both Android and iOS device.
  var settings = InitializationSettings(android: android, iOS: IOS);
  flip.initialize(settings);
  _showNotificationWithDefaultSound(flip, currentUser, message);
}

Future _showNotificationWithDefaultSound(flip, currentUser, message) async {
  // Show a notification after every 15 minute with the first
  // appearance happening a minute after invoking the method
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your channel id', 'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high);
  var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();

  // initialise channel platform for both Android and iOS device.
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);

  if ((amtfinder(message.body.trim()) + currentUser.daily_sum >
          currentUser.daily_limit) &&
      (amtfinder(message.body.trim()) + currentUser.weekly_sum >
          currentUser.weekly_limit)) {
    await flip.show(
        0,
        'Daily and Weekly Limit Exceeded!',
        'You have spent ₹ ${(amtfinder(message.body.trim()) + currentUser.daily_sum).toStringAsFixed(2)} today!\nYou have spent ₹ ${(amtfinder(message.body.trim()) + currentUser.weekly_sum).toStringAsFixed(2)} this week!',
        platformChannelSpecifics,
        payload: 'Default_Sound');
  } else if (amtfinder(message.body.trim()) + currentUser.daily_sum >
      currentUser.daily_limit) {
    await flip.show(
        0,
        'Daily Limit Exceeded!',
        'You have spent ₹ ${(amtfinder(message.body.trim()) + currentUser.daily_sum).toStringAsFixed(2)} today!',
        platformChannelSpecifics,
        payload: 'Default_Sound');
  } else if (amtfinder(message.body.trim()) + currentUser.weekly_sum >
      currentUser.weekly_limit) {
    await flip.show(
        0,
        'Weekly Limit Exceeded!',
        'You have spent ₹ ${(amtfinder(message.body.trim()) + currentUser.weekly_sum).toStringAsFixed(2)} this week!',
        platformChannelSpecifics,
        payload: 'Default_Sound');
  }
}
