import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_app/home_old.dart';
import 'package:sample_app/theme_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      builder: (_) => ThemeManager(),

      // Consumer will call builder each time theme changes
      child: Consumer<ThemeManager>(builder: (context, manager, _){
        return MaterialApp(
          title: 'Welcome Flutter',
          theme: manager.themeData,
          home: Home(manager.themeData)
        );
      }),
    );
  }  
}