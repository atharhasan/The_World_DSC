import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_world/add_fav.dart';
import 'package:the_world/bloc/theme.dart';
import 'home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider <ThemeChanger>(
        create: (_) => new ThemeChanger(ThemeData.light()),
        child: new MaterialAppWithTheme(
      ),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // to make dark mode.
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DSC World',
      home: HomePage(),
      theme: theme.getTheme(),
    );
  }
}
