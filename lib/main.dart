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
        drawer: SafeArea(
          child: Drawer(
            backgroundColor: Colors.redAccent,
            child: Column(
              children: [
                SizedBox(height: 20),
                Icon(Icons.add_sharp, size: 80),
                Text(
                  "با ما تبلیغات خود را گسترده کنید",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.black,
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.redAccent),
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
                  unselectedItemColor: Colors.white,
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
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu, size: 30),
                ),
                Text(
                  "اگهی ها",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Spacer(),

                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.redAccent,
                      context: context,
                      builder: (context) {
                        return Container(
                          width: double.infinity,
                          child: Filter(),
                        );
                      },
                    );
                  },
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

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> jobs = [
      "توسعه دهنده بک اند",
      "توسعه دهنده فرانت",
      "توسعه دهنده آندروید",
      "وردپرس",
    ];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "عنوان شغلی خود را انتخاب کنید",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(jobs.length, (index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: BoxBorder.all(color: Colors.black, width: 3),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Text(jobs[index], style: TextStyle(fontSize: 20)),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
