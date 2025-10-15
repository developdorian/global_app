import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:global_app/app/theme/app_theme.dart';

class ElementWidget extends StatelessWidget {
  const ElementWidget({
    super.key,
    required this.color,
    required this.logo,
    required this.element,
  });
  final Color color;
  final String logo, element;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      height: 24,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SvgPicture.asset(
                logo,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
            ),
          ),
          SizedBox(width: 4),
          Text(
            element,
            style: AppTheme.textTheme.bodySmall?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
