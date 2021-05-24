import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:get/get.dart';

import 'WidgetComponents.dart';

const String APP_FONT_FAMILY = "Poppins";

typedef OnTapConfirmationButtonCallback<T> = Future Function(T value);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FocusNode _note_text1 = FocusNode();

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [KeyboardActionsItem(focusNode: _note_text1)]);
  }

  @override
  Widget build(BuildContext context) {
    Widget imageView = Image.asset(
      'images/lake.jpg',
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );

    Widget firstRow = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Oeschinen Lake Campground",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Kandersteg, Switzerland"),
            ],
          )),
          FavoriteWidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;
    Widget secondRow = Container(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _columnButton(color, Icons.call, "Call"),
          _columnButton(color, Icons.near_me, "ROUTE"),
          _columnButton(color, Icons.share, "SHARE")
        ],
      ),
    );

    Widget blockText = Container(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Thao Nguyen"),
          ),
          body: ListView(children: [imageView, firstRow, secondRow, blockText]),
        ));
  }

  Column _columnButton(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(label),
        )
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = true;
  int _favoriteCount = 41;

  void _toogleFavorite() {
    setState(() {
      if (_isFavorite) {
        _favoriteCount -= 1;
        _isFavorite = false;
      } else {
        _favoriteCount += 1;
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var dialog = CustomAlertDialog(
        title: "Logout",
        message: "Are you sure, do you want to logout?",
        onPostivePressed: () {},
        positiveBtnText: 'Yes',
        negativeBtnText: 'No');

    return Row(
      children: [
        IconButton(
            icon: (_isFavorite ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => SaveDataPopup())
                }),
        Text("$_favoriteCount")
      ],
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String message;
  final String positiveBtnText;
  final String negativeBtnText;
  final Function onPostivePressed;
  final Function onNegativePressed;
  final double circularBorderRadius;

  CustomAlertDialog({
    this.title,
    this.message,
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.white,
    this.positiveBtnText,
    this.negativeBtnText,
    this.onPostivePressed,
    this.onNegativePressed,
  })  : assert(bgColor != null),
        assert(circularBorderRadius != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title) : null,
      content: message != null ? Text(message) : null,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[
        negativeBtnText != null
            ? FlatButton(
                child: Text(negativeBtnText),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onNegativePressed != null) {
                    onNegativePressed();
                  }
                },
              )
            : null,
        positiveBtnText != null
            ? FlatButton(
                child: Text(positiveBtnText),
                textColor: Theme.of(context).accentColor,
                onPressed: () {
                  if (onPostivePressed != null) {
                    onPostivePressed();
                  }
                },
              )
            : null,
      ],
    );
  }
}

class SaveDataPopup extends StatefulWidget {
  SaveDataPopup({
    Key key,
    this.titleLabel,
    this.contentLabel,
    this.hint,
    this.buttonYesTitleLabel,
    this.buttonNoTitleLabel,
    this.imagePath,
    this.imageWidth,
    this.imageHeight,
    this.imageRatio,
    this.titleWidget,
    this.onTapCancelButton,
    this.onTapSaveButton,
    this.invalidateInputMessage,
  }) : super(key: key);

  final String titleLabel;
  final String contentLabel;
  final String hint;
  final String buttonYesTitleLabel;
  final String buttonNoTitleLabel;
  final String imagePath;
  final double imageWidth;
  final double imageHeight;
  final double imageRatio;
  final Widget titleWidget;
  final VoidCallback onTapCancelButton;
  final OnTapConfirmationButtonCallback<String> onTapSaveButton;
  final String invalidateInputMessage;

  @override
  State<StatefulWidget> createState() => _SaveDataPopupState();
}

class _SaveDataPopupState extends State<SaveDataPopup> {
  // local data
  String get titleLabel => widget.titleLabel ?? "Test Completed";
  String get contentLabel =>
      widget.contentLabel ?? "Would you like to save the data?";
  String get hint => widget.hint ?? "Enter Name of the Record";
  String get buttonYesTitleLabel => widget.buttonYesTitleLabel ?? "Save";
  String get buttonNoTitleLabel => widget.buttonNoTitleLabel ?? "Cancel";

  String get imagePath => widget.imagePath ?? "images/img_success_alert.png";
  double get imageWidth => widget.imageWidth ?? 60;
  double get imageHeight => widget.imageHeight ?? 60;
  double get imageRatio => widget.imageRatio ?? imageWidth / imageHeight;

  Widget get titleWidget =>
      widget.titleWidget ??
      Text(
        "$titleLabel",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Color.fromRGBO(51, 51, 51, 1),
        ),
        textAlign: TextAlign.center,
      );

  VoidCallback get onTapCancelButton => widget.onTapCancelButton ?? () => {};
  OnTapConfirmationButtonCallback<String> get onTapSaveButton =>
      widget.onTapSaveButton ?? (_) async => {};

  String get invalidateInputMessage =>
      widget.invalidateInputMessage ?? "Please input record name";

  int get inputMaxLength => 100;
  TextEditingController controller;

  // local widgets
  Widget get textFieldWidget => TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Color.fromRGBO(196, 196, 196, 1),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        ),
        controller: controller,
        keyboardType: TextInputType.text,
        inputFormatters: [
          LengthLimitingTextInputFormatter(inputMaxLength),
        ],
        onChanged: (value) {
          setState(() {
            inputRecordName = value;
          });
        },
        style: TextStyle(
          fontFamily: APP_FONT_FAMILY,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.black,
        ),
        maxLines: 1,
      );

  // local states
  String inputRecordName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: titleWidget,
      content: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: imageWidth,
              height: imageHeight,
              child: AspectRatio(
                aspectRatio: imageRatio,
                child: Image.asset(
                  "$imagePath",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "$contentLabel",
              style: TextStyle(
                fontFamily: APP_FONT_FAMILY,
                fontWeight: FontWeight.normal,
                fontSize: Get.width == 375 ? 15 : 16,
                color: Color.fromRGBO(51, 51, 51, 1),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.0),
            textFieldWidget,
            Divider(
              indent: 0,
              endIndent: 0,
              thickness: 1.5,
              color: Color.fromRGBO(235, 235, 235, 1),
            ),
            SizedBox(height: 40.0),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: WidgetComponents().buildRaisedButton(
                    "$buttonNoTitleLabel",
                    () {
                      onTapCancelButton();
                      // Get.back(result: true);
                    },
                    type: ButtonType.secondaryButton,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  flex: 1,
                  child: WidgetComponents().buildRaisedButton(
                    "$buttonYesTitleLabel",
                    () async {
                      if (inputRecordName != null &&
                          inputRecordName.isNotEmpty) {
                        onTapSaveButton(inputRecordName);
                        // Get.back(result: true);
                      } else {
                        /// user do not input record name so we show toast
                        // await showToast(invalidateInputMessage);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
