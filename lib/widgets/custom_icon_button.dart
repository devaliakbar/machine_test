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

  CustomIconButton({
    @required this.text,
    @required this.onPressed,
    this.icon,
    this.imageIconPath,
    this.backgroundGradient,
    this.backgroundColor,
  });

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
        onPressed: onPressed,
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
                  child: NormalText(
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
