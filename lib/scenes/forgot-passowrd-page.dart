import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_commerce/mixins/form-style.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ForgotPassword extends StatelessWidget with FormStyle {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    _showSnackBar() {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Mật khẩu mới đã được gửi vào email của bạn!'),
        backgroundColor: Theme.of(context).snackBarTheme.backgroundColor,
        action: SnackBarAction(
          onPressed: () => print('ok'),
          label: 'Ok',
          textColor: Colors.white,
        ),
      ));
    }

    _forgotPasswordAction() {
      if (_fbKey.currentState.saveAndValidate()) {
        print('_forgotPasswordAction: Validate thanh cong');
        print(_fbKey.currentState.value);
        _showSnackBar();
      } else {
        print('_forgotPasswordAction: Nhap lieu khong dung');
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
                  Padding(
                    child: Text(
                        'Please, enter your email address. You will receive a link to create a new password via email.'),
                    padding: EdgeInsets.only(bottom: 16.0),
                  ),
                  FormBuilderTextField(
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
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: _forgotPasswordAction,
              child: Container(
                margin: EdgeInsets.only(top: 55.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(25.0)),
                height: 48.0,
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
      key: _scaffoldKey,
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
