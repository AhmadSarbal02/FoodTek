import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final Widget? leading;
  final VoidCallback onTap;

  ProfileOption(this.title, {this.trailing, this.leading, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: leading ?? Icon(Icons.arrow_forward_ios, size: 16),
        title: Text(title),
        trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
