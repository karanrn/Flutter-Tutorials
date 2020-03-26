import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
        alignment: Alignment.center,
        child: Text(
          'Know me?',
           style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 40
              )
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
                MdiIcons.postOutline//Icons.bookmark
              ),
              title: Text("Blog"),
              onTap: () async{
                const url = 'https://karanrn.wordpress.com';
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true, enableJavaScript: true);
                }else {
                  throw 'Could not launch $url';
                }
              } 
            ),
            ListTile(
              leading: Icon(
                MdiIcons.twitter
              ),
              title: Text("Tweet me"),
              onTap: () async{
                const url = 'https://twitter.com/knadagoudar';
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true, enableJavaScript: true);
                }else {
                  throw 'Could not launch $url';
                }
              } 
            ),
            ListTile(
              leading: Icon(
                MdiIcons.instagram
              ),
              title: Text("Instagram"),
              onTap: () async{
                const url = 'https://www.instagram.com/karan.nadagoudar/';
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true, enableJavaScript: true);
                }else {
                  throw 'Could not launch $url';
                }
              } 
            ),
            ListTile(
              leading: Icon(
                MdiIcons.linkedin
              ),
              title: Text("LinkedIn"),
              onTap: () async{
                const url = 'https://www.linkedin.com/in/knadagoudar/';
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true, enableJavaScript: true);
                }else {
                  throw 'Could not launch $url';
                }
              } 
            ),
            ListTile(
              leading: Icon(
                MdiIcons.github
              ),
              title: Text("Github"),
              onTap: () async{
                const url = 'https://github.com/karanrn';
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true, enableJavaScript: true);
                }else {
                  throw 'Could not launch $url';
                }
              } 
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