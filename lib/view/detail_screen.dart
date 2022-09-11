import 'dart:html';

import 'package:covid_tracker/view/world_stats.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  String image;
  String name;
  int totalCases,
      // affectedCountries,
      population,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      todayDeaths,
      todayCases,
      test;
  DetailScreen({
    // required this.affectedCountries,
    required this.population,
    required this.todayCases,
    required this.todayDeaths,
    required this.image,
    required this.name,
    required this.totalCases,
    required this.active,
    required this.critical,
    required this.test,
    required this.todayRecovered,
    required this.totalDeaths,
    required this.totalRecovered,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .067),
                    child: Card(
                      child: Column(
                        children: [
                          ReusableRow(
                              title: "Cases",
                              value: widget.totalCases.toString()),
                          ReusableRow(
                              title: "name", value: widget.name.toString()),
                          ReusableRow(
                              title: "active", value: widget.active.toString()),
                          ReusableRow(
                              title: "critical",
                              value: widget.critical.toString()),
                          ReusableRow(
                              title: "test", value: widget.test.toString()),
                          ReusableRow(
                              title: "todayRecovered",
                              value: widget.todayRecovered.toString()),
                          ReusableRow(
                              title: "totalDeaths",
                              value: widget.totalDeaths.toString()),
                          ReusableRow(
                              title: "todayRecovered",
                              value: widget.totalRecovered.toString()),
                          ReusableRow(
                              title: "todayCases",
                              value: widget.todayCases.toString()),
                          ReusableRow(
                              title: "todayDeaths",
                              value: widget.todayDeaths.toString()),
                          ReusableRow(
                              title: "population",
                              value: widget.population.toString()),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
