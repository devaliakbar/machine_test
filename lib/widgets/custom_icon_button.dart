import 'package:flutter/material.dart';
import 'package:machine_test/services/settings/app_theme.dart';
import 'package:machine_test/widgets/normal_text.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final String imageIconPath;
  final Gradient backgroundGradient;
  final Color backgroundColor;
  final Function onPressed;
  final bool isLoading;

  CustomIconButton(
      {@required this.text,
      @required this.onPressed,
      this.icon,
      this.imageIconPath,
      this.backgroundGradient,
      this.backgroundColor,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(31)),
          gradient: backgroundGradient,
          color: backgroundColor),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(31.0),
        ),
        onPressed: isLoading ? null : onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              imageIconPath == null
                  ? Icon(
                      icon,
                      size: AppTheme.iconSizeL,
                      color: Colors.white,
                    )
                  : Image.asset(
                      imageIconPath,
                      height: AppTheme.iconSizeL,
                    ),
              Expanded(
                child: Center(
                  child: isLoading
                      ? CircularProgressIndicator()
                      : NormalText(
                          text,
                          size: AppTheme.fontSizeL,
                          boldText: true,
                          color: Colors.white,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
