import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_using_bloc/sign_in/bloc/sign_in_bloc.dart';
import 'package:form_validation_using_bloc/sign_in/sign_in_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Welcome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                color: Colors.blue,
                child: Text('SignIn with Email'), onPressed: (){
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => 
                   BlocProvider(
                    create: (context) => SignInBloc(),
                    child: SignInPage()),),);
                }),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 50),
                color: Colors.blue,
                child: Text('SignIn with Google'), onPressed: (){}),
            ),
          ],
        ),
      ),
    );
  }
}