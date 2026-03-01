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
        body: IndexedStack(children: [MainPage()]),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ADS> ads = [
      ADS(
        title: "استخدام برنامه نویس فلاتر",
        abilities: "تسلط به دارت و فلاتر و استیت منیجمنت ها",
        isconditional: true,
        salary: "توافقی",
      ),
      ADS(
        title: "استخدام برنامه نویس فرانت",
        abilities: "تسلط به (html , css ,js)",
        isconditional: false,
        salary: "بین 20 تا 30 میلیون ",
      ),
      ADS(
        title: "استخدام برنامه نویس backEnd",
        abilities: "تسلط بر یکی از فریمورک های جنگو یا Node,js",
        isconditional: true && true,
        salary: "توافقی",
      ),
      ADS(
        title: "استخدام وردپرس",
        abilities: "تسلط و تجربه کار با وردپرس و اشنایی با php(laravel)",
        isconditional: true,
        salary: "توافقی",
      ),
      ADS(
        title: "استخدام برنامه نویس اندروید",
        abilities: "تسلط به کاتلین و jetpack compose",
        isconditional: true,
        salary: "55 میلیون ",
      ),
    ];
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
                        return SizedBox(
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
                  child: PopupMenuButton(
                    position: PopupMenuPosition.under,
                    color: Colors.deepOrangeAccent,
                    icon: Icon(Icons.sort),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                          child: Text(
                            'جدیدترین ها',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        PopupMenuItem(
                          child: Divider(color: Colors.black, thickness: 2),
                        ),
                        PopupMenuItem(
                          child: Text(
                            'قدیمی ترین ها',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ];
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: ads.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 230,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: BoxBorder.all(color: Colors.red, width: 3),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 70,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      ads[index].isconditional
                                          ? "حضوری"
                                          : "ریموت",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "مهارت ها : ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ads[index].abilities,
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "حقوق پیشنهادی :  ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    ads[index].salary!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 30),
                          padding: EdgeInsets.only(left: 15, right: 15),
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: BoxBorder.all(
                              color: Colors.black,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            ads[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: EdgeInsets.only(right: 30),
                          padding: EdgeInsets.only(left: 15, right: 15),
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: BoxBorder.all(
                              color: Colors.deepOrange,
                              width: 5,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            "مشاهده",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
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

class ADS {
  String title;
  String abilities;
  bool isconditional;
  String? salary;
  ADS({
    required this.title,
    required this.abilities,
    required this.isconditional,
    required this.salary,
  });
}
