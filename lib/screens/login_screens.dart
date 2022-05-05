import 'package:flutter/material.dart';
import 'package:partner_flutter_app/screens/home_Screens.dart';
import 'package:partner_flutter_app/screens/register_screens.dart';
import 'package:partner_flutter_app/state/user_state.dart';
import 'package:provider/provider.dart';

class LoginScrrens extends StatefulWidget {
  static const routeName = '/login-screens';

  @override
  _LoginScrrensState createState() => _LoginScrrensState();
}

class _LoginScrrensState extends State<LoginScrrens> {
  String _username = '';
  String _password = '';
  final _form = GlobalKey<FormState>();

  void _loginNew() async {
    var isvalid = _form.currentState.validate();
    if (!isvalid) {
      return;
    }
    _form.currentState.save();
    bool istoken = await Provider.of<UserState>(
      context,
      listen: false,
    ).loginNow(_username, _password);
    if (istoken) {
      Navigator.of(context).pushNamed(HomeScreens.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Something is wrong.Try Again"),
              actions: [
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Now"),
      ),
      body: Padding(
        //padding: EdgeInsets.all(12),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
        child: loginBody(),
      ),
    );
  }

  loginBody() => SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                alignment: Alignment.topCenter,
                icon: Image.network(
                  "https://www.cadandcart.com/static/img/logo/cad-and-cart.png",
                  scale: 12,
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Welcome to",
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Sign in to continue",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                validator: (v) {
                  if (v.isEmpty) {
                    return 'Enter Your Username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter Username",
                  labelText: "Username",
                ),
                onSaved: (v) {
                  _username = v;
                },
              ),
              TextFormField(
                validator: (v) {
                  if (v.isEmpty) {
                    return 'Enter Your password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Password",
                ),
                onSaved: (v) {
                  _password = v;
                },
                obscureText: true,
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
                      _loginNew();
                    },
                    child: Text("Login"),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(RegisterScreens.routeName);
                    },
                    child: Text(
                      "Register New",
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );

  loginBody1() => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[loginHeader(), loginFields()],
        ),
      );

  loginHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlutterLogo(
            textColor: Colors.green,
            size: 80.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Welcome to",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Sign in to continue",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  loginFields() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextFormField(
                validator: (v) {
                  if (v.isEmpty) {
                    return 'Enter Your Username';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Username",
                ),
                onSaved: (v) {
                  _username = v;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextFormField(
                validator: (v) {
                  if (v.isEmpty) {
                    return 'Enter Your password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                onSaved: (v) {
                  _password = v;
                },
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                shape: StadiumBorder(),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {
                  _loginNew();
                },
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "SIGN UP FOR AN ACCOUNT",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
}
