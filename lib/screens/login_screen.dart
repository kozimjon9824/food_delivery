import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/loading.dart';
import 'package:food_delivery/providers/auth_provider.dart';
import 'package:food_delivery/screens/home_screen.dart';
import 'package:food_delivery/screens/registeretion.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider=Provider.of<AuthProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: authProvider.status==Status.Authenticating?Loading(): Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Login',textAlign:TextAlign.center,style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.w700,color: Colors.red)),
                SizedBox(height: 60.0,),

                TextFormField(
                  controller: authProvider.emailCont,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(icon: Icon(Icons.email)),
                ),
                SizedBox(height: 20.0),

                TextFormField(
                  controller: authProvider.passwordCont,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(icon: Icon(Icons.lock_outline)),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text('Forgot password?',textAlign: TextAlign.end,style: TextStyle(color: Colors.red,fontSize: 14.0),),
                ),

                Material(
                  borderRadius:BorderRadius.circular(10.0),
                  child: FlatButton(
                      padding: EdgeInsets.all(14.0),
                      color: Colors.red,
                      onPressed: () async {
                          if(!await authProvider.signIn()){
                            _key.currentState.showSnackBar(SnackBar(content: Text('Login failed!')));
                            return;
                          }
                          authProvider.clearController();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                      },
                      child:Text('LOGIN',style: TextStyle(color: Colors.white,fontSize: 16.0),)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          style: TextStyle(fontSize: 14.0),
                          children: [
                            TextSpan(text: 'Dont have an account? ',style: TextStyle(color: Colors.black)),
                            TextSpan(text: 'Sign up here',style: TextStyle(color: Colors.red))
                          ]
                      ),),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }


}
