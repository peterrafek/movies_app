
import 'package:flutter/material.dart';
import 'package:movies_app/utiles/commen_widgets/custom_elevated_button.dart';
import 'package:movies_app/utiles/commen_widgets/loading_circle.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    this.width,
    this.height,
    this.backgroundColor,
    this.loadingCircleWidth,
    this.loadingCircleHeight,
  });
  final double? width, height, loadingCircleWidth, loadingCircleHeight;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      height: height,
      width: width,
      onPressed: () {},
      buttonTitle: "",
      isText: false,
      backgroundColor: backgroundColor,
      child: LoadingCircle(
        height: loadingCircleHeight,
        width: loadingCircleWidth,
      ),
    );
  }
}