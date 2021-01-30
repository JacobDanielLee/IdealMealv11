
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idealmealv11/DefaultMenu.dart';
import 'package:idealmealv11/Homepage5.dart';
import 'package:idealmealv11/dishes.dart';
import 'package:idealmealv11/dishes_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idealmealv11/category.dart';
import 'package:idealmealv11/main.dart';

class DataSearch extends SearchDelegate<String> {

  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: () {
        query = "";
      })
    ];
  }

  Widget buildLeading(BuildContext context) {
    return IconButton(icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ), onPressed: () {
      close(context, null);
    });
  }

  Widget buildResults(BuildContext context) {
    return Container(
      height: 50.0,
      child: Card(
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentSearches : restaurantSearch.where((
        p) => p.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(itemBuilder: (context, index) =>
        ListTile(
            leading: Icon(Icons.restaurant),
            title: RichText(text: TextSpan(
                text: suggestionList[index].name.substring(0, query.length),
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                children: [TextSpan(
                  text: suggestionList[index].name.substring(query.length),
                  style: TextStyle(color: Colors.grey),
                )
                ])
            ),
            onTap: () {
                  clickedIndex = suggestionList[index].priKey - 1;
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => CoreLifeMenu1()));
            }
        ),
      itemCount: suggestionList.length,
    );
  }
}