import 'package:flutter/material.dart';
import 'package:flutter_commerce/scenes/home-page.dart';
import 'package:flutter_commerce/scenes/register-page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _gotoLoginPage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterPage()));
    }

    _gotoHomePage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: _gotoLoginPage,
            child: Text('Register Page',
                style: Theme.of(context).textTheme.headline),
          ),
          SizedBox(height: 20.0,),
          GestureDetector(
            onTap: _gotoHomePage,
            child:
                Text('Home Page', style: Theme.of(context).textTheme.headline),
          )
        ],
      ),
    );
  }
}
