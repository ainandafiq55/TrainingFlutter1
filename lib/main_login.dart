import 'package:flutter/material.dart';

class Main_Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log In',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Log In'),
        ),
        body: FormLogin(),
      ),
    );
  }
}

class FormLogin extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<FormLogin> {
  bool _validasi = false;
  final _formkey = GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
        margin: EdgeInsets.all(30),
        child: Form(
          key: _formkey,
          autovalidate: _validasi,
          child: FormUI(),
        ),        
      ),
    );
  }

  Widget FormUI(){
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset('gambar/plant.png', width: 100, height: 100),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('Welcome Back',
                  style: TextStyle(
                    fontSize: 25,
                  )),
            ),
            Text('sign in to continue',
                style: TextStyle(fontSize: 15, color: Colors.blue)),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                'E-mail',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'yourname@gmail.com'),
              validator: validateEmail,
              onSaved: (String val){
                email = val;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
              decoration: InputDecoration(hintText: '********'),
              validator: validatePassword,
              onSaved: (String val){
                password = val;
              },
              obscureText: true,
            ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'forgot password?',
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RaisedButton(
                  onPressed: validateInput,
                  child: Text('Log In', style: TextStyle(color: Colors.white),),
                  color: Colors.green,
                ),
              ),
            ),
          ],
        );
  }
  
  void validateInput(){
  if (_formkey.currentState.validate()) {
    _formkey.currentState.save();
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('data complete'),));
  } else {
    setState(() {
     _validasi=true; 
    });
  }
  }
  String validatePassword(String value) {
    if (value.length < 6) {
      return 'Password min 5 karakter';
    } else {
      return null;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}