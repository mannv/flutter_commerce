import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_commerce/scenes/forgot-passowrd-page.dart';
import 'package:flutter_commerce/widgets/login-with-social-network.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

    _gotoForgotPassword() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ForgotPassword()));
    }

    _loginAction() {
      if (_fbKey.currentState.saveAndValidate()) {
        print('Login: Validate thanh cong');
      } else {
        print('Login: Nhap lieu khong dung');
      }
    }

    Widget _buildForm() {
      final borderColor = Theme.of(context).primaryColor;

      return Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FormBuilder(
              key: _fbKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    attribute: 'email',
                    maxLines: 1,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email address',
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.0, color: borderColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.0, color: borderColor)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.0, color: Colors.grey[350]))),
                    validators: [
                      FormBuilderValidators.required(
                          errorText: 'Please input your email address.'),
                      FormBuilderValidators.email(
                          errorText: 'Dia chi email khong dung dinh dang'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: FormBuilderTextField(
                      attribute: 'password',
                      maxLines: 1,
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1.0, color: borderColor)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1.0, color: borderColor)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.0, color: Colors.grey[350]))),
                      validators: [
                        FormBuilderValidators.required(
                            errorText: 'Please input password.'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 28.0, top: 16.0),
              child: GestureDetector(
                onTap: _gotoForgotPassword,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('Forgot your password?'),
                    Image.asset('images/icons/round_arrow_right.png')
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: _loginAction,
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(25.0)),
                  height: 48.0,
                  child: Center(
                    child: Text(
                      'LOGIN',
                      style: Theme.of(context).textTheme.button,
                    ),
                  )),
            )
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                    Text('Login', style: Theme.of(context).textTheme.headline),
                    _buildForm()
                  ],
                ),
              ),
              LoginWithSocialNetwork(),
            ],
          ),
        ),
      ),
    );
  }
}
