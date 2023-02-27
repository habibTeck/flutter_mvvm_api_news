import 'package:flutter/material.dart';

extension Ripple on Widget {
// used to add ripple to buttons
  Widget addRipple({required VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white.withOpacity(0.1),
        highlightColor: Colors.white.withOpacity(0.1),
        child: this,
      ),
    );
  }
}
