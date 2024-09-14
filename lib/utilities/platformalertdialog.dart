// import 'dart:io';
// import 'package:app/Utilities/platform_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart' hide Badge;

// class PlatformAlertDialog
//     extends PlatformWidget<CupertinoAlertDialog, AlertDialog> {
//   PlatformAlertDialog(
//       {required this.title,
//       required this.content,
//       this.cancelText,
//       required this.confirmText,
//       this.onCallBack})
//       : assert(title != null),
//         assert(content != null),
//         assert(confirmText != null);

//   final String title;
//   final String content;
//   final String? cancelText;
//   final String confirmText;
//   final Function? onCallBack;
//   @override
//   AlertDialog buildMaterialWidget(BuildContext context) {
//     return AlertDialog(
//       title: Text(title),
//       content: Text(
//         content,
//         style: TextStyle(color: Colors.black),
//       ),
//       actions: _actions(
//           context, cancelText?.toUpperCase(), confirmText.toUpperCase()),
//     );
//   }

//   @override
//   CupertinoAlertDialog buildCupertinoWidget(BuildContext context) {
//     return CupertinoAlertDialog(
//       title: Text(
//         title,
//         style: TextStyle(color: Colors.black),
//       ),
//       content: Text(content),
//       actions: _actions(context, cancelText, confirmText),
//     );
//   }

//   List<Widget> _actions(
//       BuildContext context, String? cancelText, String confirmText) {
//     var actions = <Widget>[];
//     if (cancelText != null) {
//       actions.add(PlatformAlertDialogAction(
//         child: Text(cancelText),
//         onPressed: () => _dismiss(context, false),
//       ));
//     }
//     actions.add(PlatformAlertDialogAction(
//       child: Text(confirmText),
//       onPressed: () => _dismiss(context, true),
//     ));
//     return actions;
//   }

//   Future<bool> show(BuildContext context) async {
//     final result = await showDialog<bool>(
//       context: context,
//       barrierDismissible: !Platform.isIOS,
//       builder: (context) => this,
//     );
//     // showDialog returns null if the dialog has been dismissed with the back
//     // button on Android.
//     // here we ensure that we return only true or false
//     return Future.value(result ?? false);
//   }

//   void _dismiss(BuildContext context, bool value) {
//     Navigator.of(context, rootNavigator: true).pop(value);
//     if (onCallBack != null) {
//       onCallBack!(value);
//     }
//   }
// }

// class PlatformAlertDialogAction
//     extends PlatformWidget<CupertinoDialogAction, TextButton> {
//   PlatformAlertDialogAction({this.child, this.onPressed});
//   final Widget? child;
//   final VoidCallback? onPressed;

//   @override
//   TextButton buildMaterialWidget(BuildContext context) {
//     return TextButton(
//       child: child!,
//       onPressed: onPressed,
//     );
//   }

//   @override
//   CupertinoDialogAction buildCupertinoWidget(BuildContext context) {
//     return CupertinoDialogAction(
//       child: child!,
//       onPressed: onPressed,
//     );
//   }
// }
