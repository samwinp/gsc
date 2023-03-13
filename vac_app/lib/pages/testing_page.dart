
import 'package:flutter/material.dart';
import 'package:vac_app/pages/vaccine_info.dart';

import '../helper/helper_function.dart';
import '../services/auth_service.dart';
import '../widgets/widgets.dart';
import 'login_page.dart';


class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  final AuthService _authService = AuthService();
  String userName = "";
  String email = "";

  getUserData() async{
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
            children:  [
              const Icon(Icons.account_circle,
              size: 100,
              color: Colors.grey,
              ),
              const SizedBox(height: 10,),
              Center(
                child: Text(userName, 
                style: const TextStyle(                 
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold, 
                  fontSize: 20,                  
                ),                      
                ),             
              ),
            const SizedBox(height: 10,),
            const Divider(
              height: 2,
            ),
           
           
           
            const Divider(height: 2,),

            ListTile(
              onTap: (){
                showDialog(
                  context: context,
                   builder: (context){                  
                  return AlertDialog(                    
                    title:const Text("Logout"),
                    content:const Text("Are you sure you want to logout"),
                    actions: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);                        
                      }, 
                      icon:const Icon(
                      Icons.cancel,
                      color: Colors.red,
                      )
                      ),
                      IconButton(onPressed: (){
                        nextScreenReplace(context, LoginPage());
                      },
                      icon:const Icon(
                      Icons.done,
                      color: Colors.green,                      
                      )
                      )
                    ],          
                    
                  );
                }
                );               

                
              },
              selectedColor: Colors.amber,
              selected: false,
              leading:const Icon(Icons.logout),
              title:const Text("Logout", 
              style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              ),              
              ),  
                    

            ),
             
            const Divider(height: 2,), 
            const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings",
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
            icon: Icon(Icons.home,
            color: Colors.grey,
            
            ),
            label:"home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "maps"
            ),
         BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: "hospital",
            ),
                  
         ],
        ),
      

      body: Column(
        children: [
           const Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Text(
            "Welcome, To Vaxi",
            style: TextStyle(
             fontWeight: FontWeight.bold,
             color: Color.fromARGB(255, 255, 45, 45),
             fontSize: 50,
            ),
          ),
        ),
        const SizedBox(height: 15,),

        const Align(
          alignment: Alignment.topLeft,
          child: Text("     Vacination Articles",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                ),
        ),

        SizedBox(
          height: 10,
        ),
        
        Container(
     
        height: 350,
        child: Align(
          child: ListView(
    
          scrollDirection: Axis.horizontal,
          children:          
            const [                         
            VaccineInfo(),
            VaccineInfo(),
            VaccineInfo(),           
           ],
          ),
        ),      
       ),
        


        ],
      )
      
       
      
    );
  }
}