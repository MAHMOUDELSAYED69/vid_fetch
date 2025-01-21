import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:vid_fetch/core/utils/constants/colors.dart';
import 'package:vid_fetch/core/utils/extension/extension.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key,
    this.title,
    this.onPressed,
    this.widget,
    this.size,
    this.isDisabled,
    this.icon,
  });
  final bool? isDisabled;
  final String? title;
  final void Function()? onPressed;
  final Size? size;
  final Widget? widget;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: context.elevatedButtonTheme.style?.copyWith(
          fixedSize: WidgetStatePropertyAll(
            size ?? Size(context.width, 40.h),
          ),
          backgroundColor: WidgetStatePropertyAll(
              isDisabled == true ? ColorManager.red : null),
        ),
        onPressed: isDisabled == true ? null : onPressed,
        child: isDisabled == true
            ? const LoadingIndicator(
                indicatorType: Indicator.pacman,
                colors: [
                  ColorManager.black,
                  ColorManager.white,
                  ColorManager.black,
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title ?? "",
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    icon ?? Icons.download,
                    color: context.iconTheme.color,
                  ),
                ],
              ));
  }
}
