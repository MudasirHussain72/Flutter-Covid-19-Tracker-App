import 'dart:async';

import 'package:covid_tracker/view/world_stats.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
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

  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: ((context) => WorldStatsScreen()))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Center(
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/virus.png"),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Covid-19\nTracker App',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ))
          ]),
    );
  }
}
