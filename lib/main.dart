import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(Advertising());
}

class Advertising extends StatefulWidget {
  const Advertising({super.key});

  @override
  State<Advertising> createState() => _AdvertisingState();
}

class _AdvertisingState extends State<Advertising> {
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
        backgroundColor: Colors.black,
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
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
                  items: const [
                    BottomNavigationBarItem(
                      label: "صفحه اصلی",
                      icon: Icon(Icons.home_work),
                    ),
                    BottomNavigationBarItem(
                      label: "درخواست ها",
                      icon: Icon(Icons.request_page),
                    ),
                    BottomNavigationBarItem(
                      label: "حساب کاربری",
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
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 60,
            color: Colors.red,
            child: Row(
              children: [
                SizedBox(width: 10),
                IconButton(onPressed: () {}, icon: Icon(Icons.menu, size: 30)),
                Text(
                  "اگهی ها",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Spacer(),

                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_alt_outlined),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
