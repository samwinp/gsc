import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vac_app/pages/register_page.dart';
import '../helper/helper_function.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import '../widgets/widgets.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

}



class _LoginPageState extends State<LoginPage> {
  final _fromKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String fullname = '';
   
    AuthService authService  = AuthService();


    late bool _isLoading;

  login() async{
    if(_fromKey.currentState!.validate()){
      setState(() {
        _isLoading = true;
      });
      await authService.loginWithUserNameansPassword(email, password).then((value) async {
        if(value == true){
        QuerySnapshot snapshot =  await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).gettingUserData(email);
        await HelperFunctions.saveUserLoggedInStatus(true);
        await HelperFunctions.saveUserEmail(email);
        await HelperFunctions.saveUserName(snapshot.docs[0]['fullname']);
         
        nextScreenReplace(context, HomePage());
        }else{
          showSnackBar(context, Colors.red, value);
          setState(() {            
            _isLoading = false;
          });
        }
      });
    }
  }







  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Vaxi'),
      backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: _fromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,         
              children: [
                const SizedBox(height: 0,),
                const Center(
                child:Text("Vaxi",
                 style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                 ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Explore a whole new world',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,                
              ),
              ),
              const SizedBox(height: 40,),              
              const CircleAvatar(
                backgroundImage: AssetImage('assets/vaxi.gif'),
                radius: 50,
              ),
              const SizedBox(height: 50,),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.mail,
                  color: Colors.grey,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    email = value;
                    print(email);                  
                  });                  
                },// this line to validate the password
                validator: (value) {
                  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!) ? null : 'enter a valid email id';
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock,
                  color: Colors.grey,
                  ),                  
                ),
                onChanged: (value) {
                  password = value;
                  print(password);
                },// this line is is to tell to input passwor of greater lenght
                validator: (value) {
                  return value!.length < 6 ? "enter a password with length greater than six characters" : null; 
                },                
              ),
              SizedBox(height: 40,),
              SizedBox(height: 40,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                ),
                onPressed: (){
                   // add the sigin in function
                   login();
                  },
               child:const Text("Sign in", 
               style: TextStyle(
                // add style to the sigin in button
                fontSize: 16,
               ),
               )              
              ),
              ),
            const  SizedBox(height: 15,),
              Text.rich(
                TextSpan(
                  text: "Don't have an account?  ",                  
                  children: <TextSpan>[                                     
                    TextSpan(
                      text: "Register here",
                      style: const TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap  = () {
                        nextScreenReplace(context, RegisterPage());
                      },
                    )
                  ]
                )
              )
              ],
            ),
          ),
        ),
      ), 
    );

   

  }
}