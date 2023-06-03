import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_using_bloc/sign_in/bloc/sign_in_bloc.dart';
import 'package:form_validation_using_bloc/sign_in/bloc/sign_in_event.dart';
import 'package:form_validation_using_bloc/sign_in/bloc/sign_in_state.dart';

class SignInPage extends StatelessWidget {
   SignInPage({super.key});
  final emailController= TextEditingController();
   final passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if(state is SignInErrorState){
                    return Text(state.errorMessage,
              style: TextStyle(
                color: Colors.red
              ),
              );
                }
                else{
                  return Container();
                }
                
              },
             
            ),
            SizedBox(height: 10,),
            TextField(
              controller: emailController,
              onChanged: (value){
                 BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(emailController.text, passwordController.text));
              },
              decoration: InputDecoration(
                hintText: 'Enter Email'
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
               onChanged: (value){
                 BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(emailController.text, passwordController.text));
              },
              decoration: InputDecoration(
                hintText: 'Enter Password'
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child:  BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if(state is SignInLoadingState){
                    return Center(child: CircularProgressIndicator());
                  }
                   return CupertinoButton(
                  color:(state is SignInValidState)? Colors.blue: Colors.grey,
                  child: Text('Sign In'), onPressed: (){
                    if(state is SignInValidState){
                      BlocProvider.of<SignInBloc>(context).add(SignInSubmittedEvent(emailController.text, passwordController.text));
                    }
                  });
                },
              
              ),
            )
          ],
        ),
      ),
    );
  }
}