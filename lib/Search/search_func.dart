import 'package:flutter/material.dart';
import 'package:isaac_pj/PassDetail/pass_detail_ui.dart';

class SearchFunc extends SearchDelegate<String> {

  final cities = [
    'Hong Kong',
    'Macau',
    'Tokyo',
    'Taipei'
  ];

  final recentCities = [
    'Hong Kong',
    'Taipei'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.gradient),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.cancel),
        onPressed: () => query = "",
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty 
                            ? recentCities 
                            : cities.where(
                                (p) => p.toLowerCase().contains(query.toLowerCase())
                              ).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
              final route = MaterialPageRoute(builder: (BuildContext context) => PassDetail());
    Navigator.push(context, route);
        },
        leading: Icon(Icons.location_city),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }


}