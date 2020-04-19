import 'package:flutter/material.dart';

class LoginWithSocialNetwork extends StatelessWidget {
  _loginGoogle() {
    print('login with google account');
  }

  _loginFacebook() {
    print('login with facebook account');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text('Or sign up with social account'),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: _loginGoogle,
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.0)),
                    height: 64.0,
                    width: 92.0,
                    child: Center(
                      child: Image.asset('images/icons/google.png'),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _loginFacebook,
                  child: Container(
                    margin: EdgeInsets.only(left: 8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.0)),
                    height: 64.0,
                    width: 92.0,
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
    );
  }
}
