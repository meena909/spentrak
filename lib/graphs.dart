import 'package:charts_flutter/flutter.dart' as charts;

class SubscriberSeries {
  final String month;
  final int subscribers1;
  final charts.Color barColor1;

  SubscriberSeries({
    required this.month,
    required this.subscribers1,
    required this.barColor1,
  });
}

class Line {
  final int month;
  final num subscribers1;
  final charts.Color barColor1;

  Line({
    required this.month,
    required this.subscribers1,
    required this.barColor1,
  });
}

class Line1 {
  final num month;
  final num subscribers1, subscribers2;
  //final double radius;
  final charts.Color barColor1, barColor2;

  Line1({
    required this.month,
    required this.subscribers1,
    required this.subscribers2,
    // required this.radius,
    required this.barColor1,
    required this.barColor2,
  });
}
