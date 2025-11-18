import 'package:flutter/material.dart';

class AnotherButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool loading;
  final Color onBackground;

  const AnotherButton({super.key, required this.onPressed, this.loading = false, required this.onBackground});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: onBackground.withOpacity(0.12),
          foregroundColor: onBackground,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: loading ? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Another'),
        ),
      ),
    );
  }
}
