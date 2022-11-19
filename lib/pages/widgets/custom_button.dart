import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  //return types
  final String text;
  final Color? txtColor;
  final Color? bgColor;
  final Color? shadowColor;
  final void Function()? onTap;

  const CustomButton(
      {Key? key,
      required this.text,
      this.txtColor,
      this.bgColor,
      this.shadowColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: PhysicalModel(
          color: Colors.grey.withOpacity(.4),
          elevation: 2,
          borderRadius: BorderRadius.circular(20),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bgColor ?? Colors.black,
              ),
              child: Container(
                margin: EdgeInsets.all(14),
                alignment: Alignment.center,
                child: CustomText(
                  text: text,
                  color: txtColor ?? Colors.white,
                  size: 22,
                  weight: FontWeight.normal,
                ),
              )),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  const CustomText({Key? key, this.text, this.size, this.color, this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          fontSize: size ?? 16,
          color: color ?? Colors.black,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}
