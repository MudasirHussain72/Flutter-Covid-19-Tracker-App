import 'package:covid_tracker/services/utilities/states-services.dart';
import 'package:flutter/material.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: "Search"),
          ),
        ),
        Expanded(
            child: FutureBuilder(
          future: statesServices.countriesListApi(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (!snapshot.hasData) {
              return Text("loading");
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Image(
                            image: NetworkImage(
                                snapshot.data![index]['countryInfo']['flag'])),
                      )
                    ],
                  );
                },
              );
            }
          },
        )),
      ]),
    );
  }
}
