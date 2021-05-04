import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(
    String email,
    String username,
    String password,
    bool isLogin,
    BuildContext ctx,    
  ) submitFn;
  final bool isLoading;
  AuthForm(this.submitFn,this.isLoading);
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';

  var _isLogin = true;
  void _trySubmit() {
    final isValid = _formKey.currentState
        .validate(); //currentstate validates all the validators si,ultaneously
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      print(_userName + " " + _userEmail + " " + _userPassword);
       //Update auth request later using this saved data
      widget.submitFn(_userEmail.trim(),_userName.trim(),_userPassword.trim(),_isLogin,context);//.trim() removes extra whitespace
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      } else
                        return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      // labelStyle:
                    ),
                    onSaved: (value) {
                      _userEmail = value;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('UserName'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'Username too short';
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Username",
                      ),
                      onSaved: (value) {
                        _userName = value;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password length too short';
                      } else
                        return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "PassWord",
                    ),
                    onSaved: (value) {
                      _userPassword = value;
                    },
                  ),
                  SizedBox(),
                  if(widget.isLoading) CircularProgressIndicator(),
                  if(!widget.isLoading)RaisedButton(
                    child: Text(_isLogin ? 'LogUn' : 'SignUp'),
                    onPressed: _trySubmit,
                  ),
                  if(!widget.isLoading)FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(_isLogin
                        ? 'Create New Account'
                        : 'Already Have an account? Please Login.'),
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
