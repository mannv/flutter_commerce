import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_commerce/scenes/home-page.dart';
import 'package:flutter_commerce/widgets/login-with-social-network.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _forgotPasswordAction() {
      print('forgot password action');
    }

    Widget _buildForm() {
      return Container(
        height: 300.0,
        margin: EdgeInsets.only(top: 50.0),
        decoration: BoxDecoration(color: Colors.blueAccent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name'),
            Text('Email'),
            Text('Password'),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25.0)),
              height: 48.0,
              child: GestureDetector(
                onTap: _forgotPasswordAction,
                child: Center(
                  child: Text(
                    'SEND',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(height: 35.0),
                    Text('Forgot password',
                        style: Theme.of(context).textTheme.headline),
                    _buildForm()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
