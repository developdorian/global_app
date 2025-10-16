import 'package:flutter/material.dart';
import 'package:global_app/app/theme/app_theme.dart';

class SecondaryButtonWidget extends StatelessWidget {
  const SecondaryButtonWidget({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          foregroundColor: AppColors.textPrimary,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          minimumSize: const Size(double.infinity, 58),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          elevation: 1,
          shadowColor: Colors.black,
        ),
        child: Text(
          text,
          style: AppTheme.textTheme.titleLarge!.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
