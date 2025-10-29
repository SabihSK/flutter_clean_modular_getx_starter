import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  Responsive(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;

  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 1024;
  bool get isDesktop => width >= 1024;

  /// Adaptive padding
  EdgeInsets get screenPadding =>
      EdgeInsets.symmetric(horizontal: isMobile ? 16 : 32, vertical: 16);

  /// Adaptive font size scaling
  double scaleFont(double size) {
    if (isTablet) return size * 1.1;
    if (isDesktop) return size * 1.2;
    return size;
  }

  /// Example usage:
  /// final responsive = Responsive(context);
  /// Text('Hello', style: TextStyle(fontSize: responsive.scaleFont(14)));
}
