import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/app_themes.dart';
import 'package:sample_app/theme_manager.dart';

class Home extends StatefulWidget {
  AppTheme theme;
  Home(ThemeData currTheme) {
    this.theme = (currTheme == appThemeData[AppTheme.White]) ? AppTheme.Dark : AppTheme.White;
  }
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome to Flutter App")
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Text(
          'Hello World',
          )
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
              color: Colors.blue,
              )
            ),
            ListTile(
              leading: Icon(
                Icons.bookmark
              ),
              title: Text("Item 1"),
              //onTap: 
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.brightness_4
              ),
              title: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "DarkMode",
                  )
              ),
              onTap: () {
                Provider.of<ThemeManager>(context).setTheme(widget.theme);
              },
              // trailing: Switch(
              //   value: widget.darkThemeEnabled,
              //   onChanged: (changedTheme){
              //     setState(() {
              //       print("ChangedValue: $changedTheme DarkThemeEnabled: ${widget.darkThemeEnabled}");
              //       widget.darkThemeEnabled = changedTheme;
              //       });
              //     }
              //   ),
            )
          ],
        )
      ),
    );
  }
}