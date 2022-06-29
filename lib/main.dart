import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:yonima/screens/delivery.dart';
import 'package:yonima/screens/home.dart';
import 'package:yonima/screens/login.dart';
import 'package:yonima/screens/profile.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int pageIndex=0;
  final screens=[
    Home(),
    Delivery(),
    Profile()
  ];

  final bottomNavBarItems=<Widget>[
    Icon(Icons.home,size: 30, semanticLabel: 'Accueil',),
    Icon(Icons.delivery_dining,semanticLabel: 'Livraison',),
    Icon(Icons.person, size: 30,semanticLabel: 'Profil',)
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: screens[pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index: pageIndex,
        items: bottomNavBarItems,
        backgroundColor: Colors.blue,
        onTap: (index)=>setState(()=>this.pageIndex=index),
      ),
    );
  }
}
