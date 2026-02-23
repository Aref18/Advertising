import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(locali());
}

class locali extends StatefulWidget {
  const locali({super.key});

  @override
  State<locali> createState() => _localiState();
}

class _localiState extends State<locali> {
  int currectindex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale("fa")],
      home: Scaffold(
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            child: BottomNavigationBar(
              currentIndex: currectindex,
              onTap: (value) {
                setState(() {
                  currectindex = value;
                });
              },
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.blue,
              items: [
                BottomNavigationBarItem(
                  label: "صفحه اصلی",
                  icon: Icon(Icons.home_work),
                ),
                BottomNavigationBarItem(
                  label: "درخواست ها",
                  icon: Icon(Icons.request_page),
                ),
                BottomNavigationBarItem(
                  label: "جساب کاربری",
                  icon: Icon(Icons.person),
                ),
                BottomNavigationBarItem(
                  label: "خروج از حساب",
                  icon: Icon(Icons.logout),
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(children: [MainPage()]),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("صفحه اصلی"));
  }
}
