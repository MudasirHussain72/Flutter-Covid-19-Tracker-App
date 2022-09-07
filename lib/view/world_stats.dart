import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({super.key});

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final colorList = <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              PieChart(
                dataMap: {"total": 100, "recovered": 90, "hs": 10},
                animationDuration: Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                colorList: colorList,
                legendOptions:
                    LegendOptions(legendPosition: LegendPosition.left),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .06),
                child: Card(
                  child: Column(
                    children: [
                      ReusableRow(title: "title", value: "value"),
                      ReusableRow(title: "title", value: "value"),
                      ReusableRow(title: "title", value: "value"),
                      ReusableRow(title: "title", value: "value")
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff1aa260)),
                child: Center(
                  child: Text("Track Countries"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, bottom: 5, left: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          SizedBox(
            height: 5,
          ),
          Divider()
        ],
      ),
    );
  }
}
