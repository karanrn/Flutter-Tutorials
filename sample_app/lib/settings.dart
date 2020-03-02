import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/app_themes.dart';
import 'package:sample_app/theme_manager.dart';

class Settings extends StatelessWidget {

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Settings'),
     ),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: ListView.builder(
         itemCount: AppTheme.values.length,
         itemBuilder: (BuildContext context, int index) {
           // Get theme enum for the current item index
           final theme = AppTheme.values[index];
           return Card(
             // Style the item with corresponding theme color
             color: appThemeData[theme].primaryColor,
             child: ListTile(
               onTap: () {
                 // This will trigger notifyListeners and rebuild UI
                 // because of ChangeNotifierProvider in ThemeApp
                 Provider.of<ThemeManager>(context).setTheme(theme);
               },
               title: Text(
                 enumName(theme),
                 style: appThemeData[theme].textTheme.body1,
               ),
             ),
           );
         },
       ),
     ),
   );
 }
}