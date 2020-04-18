import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_commerce/scenes/home-page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _backToHomePage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    _loginAction() {
      print('login action');
    }

    _loginGoogle() {
      print('login with google account');
    }

    _loginFacebook() {
      print('login with facebook account');
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
              margin: EdgeInsets.only(bottom: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Already have an account?'),
                  Image.asset('images/icons/round_arrow_right.png')
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25.0)),
              height: 48.0,
              child: GestureDetector(
                onTap: _loginAction,
                child: Center(
                  child: Text(
                    'SIGN UP',
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
                      onTap: _backToHomePage,
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(height: 35.0),
                    Text('Sign up',
                        style: Theme.of(context).textTheme.headline),
                    _buildForm()
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text('Or sign up with social account'),
                      SizedBox(height: 12.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24.0)),
                            height: 64.0,
                            width: 92.0,
                            child: GestureDetector(
                              onTap: _loginGoogle,
                              child: Center(
                                child: Image.asset('images/icons/google.png'),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24.0)),
                            height: 64.0,
                            width: 92.0,
                            child: GestureDetector(
                              onTap: _loginFacebook,
                              child: Center(
                                child: Image.asset('images/icons/facebook.png'),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
