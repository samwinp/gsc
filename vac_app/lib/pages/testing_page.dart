import 'package:flutter/material.dart';
import 'package:vac_app/pages/Bcg.dart';
import 'package:vac_app/pages/landin_page.dart';
import 'package:vac_app/pages/map_page.dart';
import 'package:vac_app/pages/vaccine_info.dart';
import '../helper/helper_function.dart';
import '../services/auth_service.dart';
import '../widgets/widgets.dart';
import 'home_page.dart';
import 'login_page.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  // this keeps track of the index on the bottom nav bar
  int _selectedIndex = 0;

  static const List<Widget> _widgetOption = <Widget>[   
    LandingPage(),// this is perfect no need to change
    MapPage(),// this is done temp it has to changed to map soon
    LoginPage()// this has to be changes to list of hospital            
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final AuthService _authService = AuthService();
  String userName = "";
  String email = "";

  getUserData() async {
    await HelperFunctions.getUserEmail().then((value) => {
          setState(() {
            email = value!;
          }),
        });

    await HelperFunctions.getUserName().then((value) => {
          setState(() {
            userName = value!;
          }),
        });
  }


  @override
  void initState() {
    // TODO: implement initState
    getUserData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Vaxi'),
          elevation: 0,
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[900],
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 50),
            children: [
              const Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  userName,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 2,
              ),
              const Divider(
                height: 2,
              ),
              ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Logout"),
                          content:
                              const Text("Are you sure you want to logout"),
                          actions: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                )),
                            IconButton(
                                onPressed: () {
                                  nextScreenReplace(context, LoginPage());
                                },
                                icon: const Icon(
                                  Icons.done,
                                  color: Colors.green,
                                ))
                          ],
                        );
                      });
                },
                selectedColor: Colors.amber,
                selected: false,
                leading: const Icon(Icons.logout),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              const Divider(
                height: 2,
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              )
            ],
          ),
        ),
        // this is the bottom nav bar
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              label: "home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.map), label: "maps"),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              label: "hospital",
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          elevation: 0,
        ),

        

        //Home page body
        body: Container(
          child: _widgetOption.elementAt(_selectedIndex),
        )
        ,
        
        );
  }
}
