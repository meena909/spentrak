import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

lineC(s, series1, line, max, context) {
  return RawScrollbar(
      thumbColor: Colors.grey[800],
      radius: Radius.circular(0),
      isAlwaysShown: true,
      controller: s,
      thickness: 8,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: s,
          child: Container(
              padding: EdgeInsets.all(4),
              height: 250,
              width: (line.length <= 16)
                  ? MediaQuery.of(context).size.width - 20
                  : (MediaQuery.of(context).size.width * line.length) / 20,
              child: Padding(
                  padding: EdgeInsets.all(4),
                  child: charts.LineChart(series1,
                      customSeriesRenderers: [
                        charts.LineRendererConfig(
                            customRendererId: 'customLine',
                            includePoints: true,
                            layoutPaintOrder:
                                charts.LayoutViewPaintOrder.point + 1),
                        charts.LineRendererConfig(
                            customRendererId: 'customLine1',
                            includeLine: true,
                            includePoints: true,
                            includeArea: true,
                            layoutPaintOrder:
                                charts.LayoutViewPaintOrder.point + 1)
                      ],
                      defaultRenderer: charts.LineRendererConfig(
                        includePoints: true,
                        radiusPx: 3,
                      ),
                      domainAxis: charts.NumericAxisSpec(
                          showAxisLine: true,
                          renderSpec: charts.GridlineRendererSpec(
                            // Tick and Label styling here.
                            labelStyle: charts.TextStyleSpec(
                                // size in Pts.

                                fontFamily: "Poppins-Regular",
                                color: charts.ColorUtil.fromDartColor(
                                    Colors.black)),

                            lineStyle: charts.LineStyleSpec(
                                // size in Pts.
                                dashPattern: const [4, 4],
                                color: charts.ColorUtil.fromDartColor(
                                    Colors.transparent)),

                            axisLineStyle: charts.LineStyleSpec(
                                // size in Pts.

                                color: charts.ColorUtil.fromDartColor(
                                    Colors.black)),
                            tickLengthPx: 0,

                            // Change the line colors to match text color.
                          ),
                          tickProviderSpec: charts.BasicNumericTickProviderSpec(
                              desiredTickCount: line.length),
                          tickFormatterSpec:
                              charts.BasicNumericTickFormatterSpec(
                                  (num? value) {
                            if (value == 0) {
                              return '0';
                            } else {
                              return '${value!.toInt()}';
                            }
                            /*  else
                            return '${value ~/ 1000}K';*/
                          }),
                          viewport: charts.NumericExtents(0, line.length)),
                      primaryMeasureAxis: charts.NumericAxisSpec(
                          showAxisLine: true,
                          renderSpec: charts.GridlineRendererSpec(
                            // Tick and Label styling here.
                            labelStyle: charts.TextStyleSpec(
                                // size in Pts.

                                fontFamily: "Poppins-Regular",
                                color: charts.ColorUtil.fromDartColor(
                                    Colors.black)),

                            lineStyle: charts.LineStyleSpec(
                                // size in Pts.
                                dashPattern: const [4, 4],
                                color: charts.ColorUtil.fromDartColor(
                                    Colors.black)),

                            axisLineStyle: charts.LineStyleSpec(
                                // size in Pts.

                                color: charts.ColorUtil.fromDartColor(
                                    Colors.black)),
                            tickLengthPx: 0,

                            // Change the line colors to match text color.
                          ),
                          tickProviderSpec: charts.BasicNumericTickProviderSpec(
                              desiredTickCount: 11),
                          tickFormatterSpec:
                              charts.BasicNumericTickFormatterSpec(
                                  (num? value) {
                            if (value == 0) {
                              return '0';
                            } else {
                              return '${value!.toInt()}';
                            }
                            /*  else
                            return '${value ~/ 1000}K';*/
                          }),
                          viewport:
                              charts.NumericExtents(0, ((max ~/ 10) + 1) * 11)),
                      animate: true)))));
}

slineC(s, series1, line, max, context) {
  return RawScrollbar(
      thumbColor: Colors.grey,
      radius: Radius.circular(0),
      isAlwaysShown: true,
      controller: s,
      thickness: 8,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: s,
          child: Container(
              padding: EdgeInsets.all(4),
              height: 250,
              width: (line.length <= 16)
                  ? MediaQuery.of(context).size.width - 20
                  : (MediaQuery.of(context).size.width * line.length) / 20,
              child: Padding(
                  padding: EdgeInsets.all(4),
                  child: charts.ScatterPlotChart(series1,
                      customSeriesRenderers: [
                        charts.LineRendererConfig(
                            customRendererId: 'customLine',
                            includePoints: true,
                            layoutPaintOrder:
                                charts.LayoutViewPaintOrder.point + 1),
                        charts.LineRendererConfig(
                            customRendererId: 'customLine1',
                            includeLine: true,
                            includePoints: true,
                            includeArea: true,
                            layoutPaintOrder:
                                charts.LayoutViewPaintOrder.point + 1)
                      ],
                      domainAxis: charts.NumericAxisSpec(
                          showAxisLine: true,
                          renderSpec: charts.GridlineRendererSpec(
                            // Tick and Label styling here.
                            labelStyle: charts.TextStyleSpec(
                                // size in Pts.

                                fontFamily: "Poppins-Regular",
                                color: charts.ColorUtil.fromDartColor(
                                    Colors.black)),

                            lineStyle: charts.LineStyleSpec(
                                // size in Pts.
                                dashPattern: [4, 4],
                                color: charts.ColorUtil.fromDartColor(
                                    Colors.transparent)),

                            axisLineStyle: charts.LineStyleSpec(
                                // size in Pts.

                                color: charts.ColorUtil.fromDartColor(
                                    Colors.black)),
                            tickLengthPx: 0,

                            // Change the line colors to match text color.
                          ),
                          tickProviderSpec: charts.BasicNumericTickProviderSpec(
                              desiredTickCount: line.length),
                          tickFormatterSpec:
                              charts.BasicNumericTickFormatterSpec(
                                  (num? value) {
                            if (value == 0) {
                              return '0';
                            } else {
                              return '${value!.toInt()}';
                            }
                            /*  else
                            return '${value ~/ 1000}K';*/
                          }),
                          viewport: charts.NumericExtents(0, line.length)),
                      primaryMeasureAxis: charts.NumericAxisSpec(
                          showAxisLine: true,
                          renderSpec: charts.GridlineRendererSpec(
                            // Tick and Label styling here.
                            labelStyle: charts.TextStyleSpec(
                                // size in Pts.

                                fontFamily: "Poppins-Regular",
                                color: charts.ColorUtil.fromDartColor(
                                    Colors.black)),

                            lineStyle: charts.LineStyleSpec(
                                // size in Pts.
                                dashPattern: const [4, 4],
                                color: charts.ColorUtil.fromDartColor(
                                    Colors.black)),

                            axisLineStyle: charts.LineStyleSpec(
                                // size in Pts.

                                color: charts.ColorUtil.fromDartColor(
                                    Colors.black)),
                            tickLengthPx: 0,

                            // Change the line colors to match text color.
                          ),
                          tickProviderSpec: charts.BasicNumericTickProviderSpec(
                              desiredTickCount: 11),
                          tickFormatterSpec:
                              charts.BasicNumericTickFormatterSpec(
                                  (num? value) {
                            if (value == 0) {
                              return '0';
                            } else {
                              return '${value!.toInt()}';
                            }
                            /*  else
                            return '${value ~/ 1000}K';*/
                          }),
                          viewport:
                              charts.NumericExtents(0, ((max ~/ 10) + 1) * 11)),
                      animate: true)))));
}
