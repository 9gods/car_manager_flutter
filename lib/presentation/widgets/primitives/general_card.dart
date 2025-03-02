import 'package:flutter/material.dart';
import 'package:garage_manager_flutter/presentation/widgets/colors/app_colors.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final AppColors? backgroundGradient;
  final double? height;
  final double? width;
  final Axis orientation;

  const CustomCard({
    Key? key,
    required this.child,
    this.height,
    this.backgroundGradient,
    this.width,
    this.orientation = Axis.vertical, // default Column
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height, // if null it fills the parent
      width: width,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color:
            backgroundGradient == null
                ? Colors.transparent
                : null, // if null it gets transparent
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(color: AppColors.slate800, width: 1.0),
      ),
      // if orientation = vertical > uses Column; otherwise, Row.
      child:
          orientation == Axis.vertical
              ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [child],
              )
              : Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [child],
              ),
    );
  }
}
