import 'package:flutter/material.dart';
import 'package:taqs/core/presentation/resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonName;

  const CustomButton(
      {Key? key, required this.onPressed, required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: MediaQuery.of(context).size.width / 2,
      color: ColorManager.redColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          buttonName,
          style: const TextStyle(
            color: ColorManager.whiteColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
