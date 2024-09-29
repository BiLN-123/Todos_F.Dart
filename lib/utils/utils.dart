import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:flutter_todos/utils/colors.dart';

enum kMoreOptionsKeys {
  clearAll,
  BiLN,
  shareApp,
}

Map<int, String> kMoreOptionsMap = {
  kMoreOptionsKeys.clearAll.index: 'Xoá Tất Cả Việc Hoàn Thành',
  kMoreOptionsKeys.BiLN.index: 'Lê Tấn Ngọc',
  kMoreOptionsKeys.BiLN.index: 'Lê Tấn Ngọc',
  kMoreOptionsKeys.BiLN.index: 'Lê Tấn Ngọc',
  kMoreOptionsKeys.BiLN.index: 'Lê Tấn Ngọc',
  kMoreOptionsKeys.shareApp.index: 'Chia sẻ Ứng Dụng',

};

class Utils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  static String getWelcomeMessage() {
    final hour = DateTime.now().hour;
    String msg;

    if (hour < 12) {
      msg = '🌞🌞🌞';
    } else if (hour < 18) {
      msg = '🌤️🌤️🌤️';
    } else {
      msg = '🌙🌙🌙';
    }

    return msg;
  }

  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Không Thể Chạy $url');
    }
  }

  static String getPlatformSpecificUrl({String iOSUrl, String androidUrl}) {
    if (Platform.isIOS) {
      return iOSUrl;
    } else if (Platform.isAndroid) {
      return androidUrl;
    }
  }

  static void showCustomDialog(BuildContext context,
      {String title,
      String msg,
      String noBtnTitle: 'Đóng',
      Function onConfirm,
      String confirmBtnTitle: 'Có'}) {
    final dialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <Widget>[
        if (onConfirm != null)
          RaisedButton(
            color: Color(TodosColor.kPrimaryColorCode),
            onPressed: () {
              onConfirm();
              Navigator.pop(context);
            },
            child: Text(
              confirmBtnTitle,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        RaisedButton(
          color: Color(TodosColor.kSecondaryColorCode),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            noBtnTitle,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (x) => dialog);
  }
}
