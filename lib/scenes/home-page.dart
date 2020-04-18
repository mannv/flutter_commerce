import 'package:flutter/material.dart';
import 'package:flutter_commerce/scenes/register-page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    _gotoLoginPage() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
    }

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: Center(
        child: GestureDetector(
          onTap: _gotoLoginPage,
          child:
              Text('Register Page', style: Theme.of(context).textTheme.headline),
        ),
      ),
    );
  }
}
