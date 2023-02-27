import 'package:auto_animated/auto_animated.dart';

class Helper {
  static LiveOptions get options => const LiveOptions(
        // Start animation after (default zero)
        delay: Duration(seconds: 0),

        // Show each item through (default 250)
        showItemInterval: Duration(milliseconds: 10),

        // Animation duration (default 250)
        showItemDuration: Duration(milliseconds: 100),

        // Animations starts at 0.05 visible
        // item fraction in sight (default 0.025)
        visibleFraction: 0.05,

        // Repeat the animation of the appearance
        // when scrolling in the opposite direction (default false)
        // To get the effect as in a showcase for ListView, set true
        reAnimateOnVisibility: false,
      );
}
