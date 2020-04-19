import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_commerce/mixins/form-style.dart';
import 'package:flutter_commerce/scenes/login-page.dart';
import 'package:flutter_commerce/widgets/login-with-social-network.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterPage extends StatelessWidget with FormStyle {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    _gotoLoginPage() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }

    _registerAction() {
      if (_fbKey.currentState.saveAndValidate()) {
        print('Validate thanh cong');
        print(_fbKey.currentState.value);
      } else {
        print('Nhap lieu khong dung');
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
                    attribute: 'name',
                    maxLines: 1,
                    autocorrect: false,
                    decoration: textFieldStyle('Your name'),
                    validators: [
                      FormBuilderValidators.required(
                          errorText: 'Please input your name.'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: FormBuilderTextField(
                      attribute: 'email',
                      maxLines: 1,
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: textFieldStyle('Email address'),
                      validators: [
                        FormBuilderValidators.required(
                            errorText: 'Please input your email address.'),
                        FormBuilderValidators.email(
                            errorText: 'Dia chi email khong dung dinh dang'),
                      ],
                    ),
                  ),
                  FormBuilderTextField(
                    attribute: 'password',
                    maxLines: 1,
                    autocorrect: false,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: textFieldStyle('Password'),
                    validators: [
                      FormBuilderValidators.required(
                          errorText: 'Please input password.'),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 28.0, top: 16.0),
              child: GestureDetector(
                  onTap: _gotoLoginPage,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text('Already have an account?'),
                      Image.asset('images/icons/round_arrow_right.png')
                    ],
                  )),
            ),
            GestureDetector(
              onTap: _registerAction,
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(25.0)),
                  height: 48.0,
                  child: Center(
                    child: Text(
                      'SIGN UP',
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
                    Text('Sign up',
                        style: Theme.of(context).textTheme.headline),
                    _buildForm()
                  ],
                ),
              ),
              LoginWithSocialNetwork()
            ],
          ),
        ),
      ),
    );
  }
}
