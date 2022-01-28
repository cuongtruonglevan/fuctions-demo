import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// CUONG.TRUONG on January/27/2022: A button that can show loading indicator.
class AppLoadingButton extends StatelessWidget {
  final String title;
  final Widget leading;
  final Widget trailing;
  final Color backgroundColor;
  final Color borderColor;
  final Color titleColor;
  final bool disabled;
  final bool showLoading;
  final VoidCallback? onPressed;

  const AppLoadingButton({
    Key? key,
    this.title = 'Title',
    this.leading = const SizedBox(),
    this.trailing = const SizedBox(),
    this.backgroundColor = Colors.blueGrey,
    this.borderColor = Colors.transparent,
    this.titleColor = Colors.white,
    this.disabled = false,
    this.showLoading = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: backgroundColor,
      disabledColor: backgroundColor.withOpacity(0.4),
      elevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      focusElevation: 0,
      splashColor: Colors.white12,
      highlightColor: Colors.white12,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27.0),
          side: BorderSide(color: borderColor)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        width: double.infinity,
        child: disabled && showLoading
            ? const Center(
                child: SpinKitThreeBounce(
                  size: 16.0,
                  color: Colors.white,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  leading,
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: titleColor, fontSize: 16.0),
                  ),
                  trailing,
                ],
              ),
      ),
      onPressed: disabled ? null : onPressed,
    );
  }
}
