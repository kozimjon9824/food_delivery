import 'package:flutter/material.dart';
import 'package:food_delivery/components/loading.dart';
import 'package:food_delivery/providers/auth_provider.dart';
import 'package:food_delivery/screens/home_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<SignUpScreen> {
  final _key=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider=Provider.of<AuthProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: authProvider.status==Status.Authenticating ? Loading(): Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Text('Sign up',textAlign:TextAlign.center,style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.w700,color: Colors.red)),

                SizedBox(height: 60,),
                TextFormField(
                  controller: authProvider.nameCont,
                  decoration: InputDecoration(icon: Icon(Icons.person),hintText: 'username'),
                ),
                SizedBox(height: 20.0),

                TextFormField(
                  controller: authProvider.emailCont,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(icon: Icon(Icons.email),hintText: 'email'),
                ),
                SizedBox(height: 20.0),

                TextFormField(
                  controller: authProvider.passwordCont,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(icon: Icon(Icons.lock_outline),hintText: 'password'),
                ),

                SizedBox(height: 40.0),

                FlatButton(
                    padding: EdgeInsets.all(14.0),
                    color: Colors.red,
                    onPressed: () async {
                      if(!await authProvider.signUp()){
                        _key.currentState.showSnackBar(SnackBar(content: Text('Registration failed!')));
                        return;
                      }
                      authProvider.clearController();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    },
                    child:Text('Sign up',style: TextStyle(color: Colors.white,fontSize: 16.0),)
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
