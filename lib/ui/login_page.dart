import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState(); //ini harusnya dah otomtatis kebuat kalau bikin stateful widget
}

class _LoginPageState extends State<LoginPage> { //ini harusnya dah otomtatis kebuat kalau bikin stateful widget
  String username = '';
  String password = '';
  bool isLoginSuccess = true; // Awalnya true agar tombol berwarna pink

  @override
  Widget build(BuildContext context) { 
    return SafeArea( //agar gak ke ketutupan notch gunanya safe area
      child: Scaffold( //scaffold itu layout dasar dari flutter gunanya buat nampung widget-widget lain. child itu isinya scaffold
        appBar: AppBar(  //appbar itu semacam header 
          title: const Text('Login Page'),
          backgroundColor: Colors.pink, 
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, //biar di tengah
          children: [ //widget-widget yang mau ditampilin di body
            _image(),
            const SizedBox(height: 16),
            _informasi(),
            _usernameField(),
            _passwordField(),
            _loginButton(context),
          ],
        ),
      ));
  }

  Widget _image() {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Image.asset(
        'assets/images/logo.png',
        width: 150,
        height: 150,
      ),
    );
  }
  Widget _informasi() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Kuis Praktikum\nUsername: Rio\nPassword: 088',
        style: TextStyle(fontSize: 16),
      ),
    );
  }
  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          labelText: 'Username',
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
              ),
            ),
            // const SizedBox(height: 16),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          labelText: 'Password',
          
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          if (username == 'Rio' && password == '088') {
            setState(() {
              text = 'Login Berhasil';
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {return Homepage(username: username,);})
            );
          } else {
            setState(() {
              text = 'Login Gagal';
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
        style: ElevatedButton.styleFrom(
          backgroundColor: (isLoginSuccess) ? Colors.pink : Colors.grey,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 15),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )
        ),
      ),
    );
  }
}