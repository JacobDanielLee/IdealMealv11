
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idealmealv11/DefaultMenu.dart';
import 'package:idealmealv11/Homepage5.dart';
import 'package:idealmealv11/dishes.dart';
import 'package:idealmealv11/dishes_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:idealmealv11/category.dart';
import 'package:idealmealv11/main.dart';

class MenuSearch extends SearchDelegate<String> {

  var tempList = [];
  MenuSearch({
    this.index
  });

  int index;

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
    for (int i = 0; i < restaurantSearch[index].categoryList.length; i++) {
      for (int j = 0; j < restaurantSearch[index].categoryList[i].dishes.length; j++) {
        if(!tempList.contains(restaurantSearch[index].categoryList[i].dishes[j].dish)) {
        tempList.add(restaurantSearch[index].categoryList[i].dishes[j].dish);
        }
      }
    }
    final suggestionList = query.isEmpty ? recentSearches : tempList.where((
        p) => p.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(itemBuilder: (context, index) =>
        ListTile(
            leading: Icon(Icons.restaurant),
            title: RichText(text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                children: [TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                )
                ])
            ),
            onTap: () {
            }
        ),
      itemCount: suggestionList.length,
    );
  }
}