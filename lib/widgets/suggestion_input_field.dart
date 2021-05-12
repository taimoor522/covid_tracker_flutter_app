import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:covid_tracker/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class SuggestionInputfield extends StatelessWidget {
  var _suggestionTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AutoCompleteTextField(
      controller: _suggestionTextFieldController,
      suggestions: kLocations,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      decoration: kInputDecoration,
      itemFilter: (locationName, query) {
        return locationName.toLowerCase().contains(query.toLowerCase()) ||
            locationName.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (a, b) {
        return a.compareTo(b);
      },
      itemBuilder: (context, locationName) {
        return GestureDetector(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("locName", locationName);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return DashBoardScreen(
                locationName: locationName,
              );
            }));
          },
          child: ListTile(
            leading: Icon(Icons.location_on),
            title: Text(locationName),
          ),
        );
      },
      clearOnSubmit: false,
    );
  }
}
