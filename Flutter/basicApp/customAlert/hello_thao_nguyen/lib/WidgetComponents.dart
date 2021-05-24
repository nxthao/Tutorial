import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Button Types
enum ButtonType {
  primaryButton,
  secondaryButton,
  primaryBarButtonRoundedCorner,
  primaryBarButtonNoBackground,
  yesButton,
  textButton
}

List<Color> get yesButtonColors =>
    [Color.fromRGBO(222, 45, 45, 1), Color.fromRGBO(222, 45, 45, 1)];

const String APP_FONT_FAMILY = "Poppins";

// ignore: non_constant_identifier_names
final List<Color> _BUTTON_COLOR = [
  Color.fromRGBO(108, 190, 27, 1),
  Color.fromRGBO(108, 190, 27, 1),
  // Colors.lightGreen
];

// ignore: non_constant_identifier_names
final double _BUTTON_BORDER_RADIUS = 30.0;

double get buttonBorderRadius => 30.0;
// extension ButtonTypeExtension on ButtonType {
//   String get name => _describeEnum(this);
// }

const Color PRIMARY_BUTTON_COLOR = Color.fromRGBO(108, 190, 27, 1);

class WidgetComponents {
  Widget horizontalLine() {
    return Container(
      width: 80,
      height: 1.0,
      color: Color.fromRGBO(235, 235, 235, 1),
    );
  }

  static List<DateTime> selectedDate = List<DateTime>();

  // Future<List<DateTime>> buildDatePicker() async {
  //   String _pickValue = "DAY";
  //   Widget _widgetBuilder = DayPickerUtils();

  //   return await showGeneralDialog<List<DateTime>>(
  //     context: Get.overlayContext,
  //     barrierDismissible: false,
  //     transitionBuilder: (_, anim, __, child) =>
  //         FadeTransition(opacity: anim, child: child),
  //     transitionDuration: Duration(milliseconds: 500),
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return StatefulBuilder(
  //         builder: (context, StateSetter setState) => AlertDialog(
  //           title: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: <Widget>[
  //               Expanded(
  //                 child: CupertinoSegmentedControl(
  //                   groupValue: _pickValue,
  //                   onValueChanged: (value) {
  //                     setState(() {
  //                       _pickValue = value;

  //                       if (value == "DAY") {
  //                         _widgetBuilder = DayPickerUtils();
  //                       } else if (value == "WEEK") {
  //                         _widgetBuilder = WeekPickerUtils();
  //                       } else {
  //                         _widgetBuilder = MonthPickerUtils();
  //                       }
  //                     });
  //                   },
  //                   children: const <String, Widget>{
  //                     "DAY": Text("DAY", style: TextStyle(fontSize: 13)),
  //                     "WEEK": Text("WEEK", style: TextStyle(fontSize: 13)),
  //                     "MONTH": Text("MONTH", style: TextStyle(fontSize: 13)),
  //                   },
  //                   selectedColor: Colors.cyan,
  //                   unselectedColor: Colors.white,
  //                   borderColor: Colors.blue,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           content: AnimatedSwitcher(
  //             duration: Duration(milliseconds: 250),
  //             child: _widgetBuilder,
  //           ),
  //           actions: <Widget>[
  //             FlatButton(
  //               color: Colors.red,
  //               child: Text("Close"),
  //               onPressed: () {
  //                 Get.back(result: null);
  //               },
  //             ),
  //             FlatButton(
  //               color: Colors.green,
  //               child: Text("OK"),
  //               onPressed: () {
  //                 Get.back(result: selectedDate);
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  Icon buildIcon(
          {@required IconData icon,
          Color color = const Color.fromRGBO(40, 134, 207, 1)}) =>
      Icon(
        icon,
        color: color,
      );

  // CircleAvatar buildCircleAvatar(
  //     {String url = "",
  //     double height = 0.35,
  //     double width = 0.35,
  //     bool isAddAvatar = false}) {
  //   return CircleAvatar(
  //     radius: Get.width * .16,
  //     child: ClipOval(
  //       child: CachedNetworkImage(
  //         imageUrl: url ?? "",
  //         imageBuilder: (context, imageProvider) => Container(
  //           decoration: BoxDecoration(
  //             image: DecorationImage(
  //               image: imageProvider,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //         ),
  //         placeholder: (context, _) => CircularProgressIndicator(),
  //         errorWidget: (context, _, __) => Image.asset(isAddAvatar
  //             ? "assets/images/add_avatar.png"
  //             : "assets/images/avatar.png"),
  //         height: Get.height * height,
  //         width: Get.width * width,
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }

  // /// design : https://www.figma.com/file/qWX7resrLnieiPIeJzjvJD/mCare?node-id=1982%3A999
  // /// circular avatar
  // /// how to use :
  // // WidgetComponents().buildCircularAvatar(size: 100)
  // CircleAvatar buildCircularAvatar({String url = "", double size = 100}) =>
  //     CircleAvatar(
  //       radius: size / 2,
  //       child: ClipOval(
  //         child: CachedNetworkImage(
  //           imageUrl: url ?? "",
  //           imageBuilder: (context, imageProvider) => Container(
  //             decoration: BoxDecoration(
  //               image: DecorationImage(
  //                 image: imageProvider,
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //           placeholder: (context, _) => CircularProgressIndicator(),
  //           errorWidget: (context, _, __) =>
  //               Image.asset("assets/images/avatar.png"),
  //           height: size,
  //           width: size,
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //     );

  double get buttonHeight => Get.height * 0.05;

  ButtonTheme buildRaisedButton(String buttonText, Function onPress,
      {ButtonType type,
      double width,
      EdgeInsetsGeometry padding = const EdgeInsets.all(18)}) {
    switch (type) {
      case ButtonType.primaryButton:
        return ButtonTheme(
          height: buttonHeight,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: _BUTTON_COLOR,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(_BUTTON_BORDER_RADIUS),
              ),
              width: (width != null && width > 0) ? width : Get.width * 0.85,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: APP_FONT_FAMILY,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ),
              padding: padding,
            ),
            onPressed: onPress,
          ),
        );
      case ButtonType.yesButton:
        return ButtonTheme(
          height: buttonHeight,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: yesButtonColors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(buttonBorderRadius),
              ),
              width: (width != null && width > 0) ? width : Get.width * 0.85,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: APP_FONT_FAMILY,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ),
              padding: padding,
            ),
            onPressed: onPress,
          ),
        );
      case ButtonType.secondaryButton:
        return ButtonTheme(
          height: buttonHeight,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(215, 215, 215, 1),
                borderRadius: BorderRadius.circular(_BUTTON_BORDER_RADIUS),
              ),
              width: (width != null && width > 0) ? width : Get.width * 0.85,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Color.fromRGBO(51, 51, 51, 1),
                    fontFamily: APP_FONT_FAMILY,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ),
              padding: padding,
            ),
            onPressed: onPress,
          ),
        );
      case ButtonType.textButton:
        return ButtonTheme(
          child: TextButton(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: PRIMARY_BUTTON_COLOR,
                    fontFamily: APP_FONT_FAMILY,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            onPressed: onPress,
          ),
        );
      default:
        return ButtonTheme(
          height: buttonHeight,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            padding: EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: _BUTTON_COLOR,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(_BUTTON_BORDER_RADIUS),
              ),
              width: (width != null && width > 0) ? width : Get.width * 0.85,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: APP_FONT_FAMILY,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ),
              padding: padding,
            ),
            onPressed: onPress,
          ),
        );
    }
  }

  // /// build empty data message widget
  // Widget buildEmptyDataWidget({String message}) => Center(
  //       child: Text(
  //         '${message != null && message.isNotEmpty ? message : "${Constant.EMPTY_DATA_MESSAGE}"}',
  //         style: Style().primaryTitleLabelTextStyle(),
  //       ),
  //     );
}
