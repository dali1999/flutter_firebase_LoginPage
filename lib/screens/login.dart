import 'package:candid/data/join_or_login.dart';
import 'package:candid/helper/login_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authpage extends StatelessWidget {
  // const Authpage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CustomPaint(
          size: size,
          painter: LoginBackground(isJoin: Provider.of<JoinOrLogin>(context).isJoin),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _logoImage,
            Stack(
              children: <Widget>[_inputForm(size), _authButton(size)],
            ),
            Container(
              height: size.height * 0.1,
            ),
            GestureDetector(
                onTap: (){
                  JoinOrLogin joinOrLogin = Provider.of<JoinOrLogin>(context);
                  joinOrLogin.toggle();
                },
                child: Text("Don't Have an Account? Create One")),
            Container(
              height: size.height * 0.05,
            )
          ],
        )
      ],
    ));
  }

  Widget get _logoImage {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/250/250"),
          ),
        ),
      ),
    );
  }

  Widget _authButton(Size size) {
    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              print(_emailController.text.toString());
              print(_passwordController.text.toString());
              if (_formkey.currentState!.validate()) {
                print(_emailController.value.toString());
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25))),
            child: Text(
              "Login",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
      ),
    );
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 5,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 16, top: 12, bottom: 32),
          child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle), labelText: "Email"),
                    validator: (String? value) {
                      if (value == null) {
                        return "Please input correct Email";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key), labelText: "Password"),
                    validator: (String? value) {
                      if (value == null) {
                        return "Please input correct Password";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 10,
                  ),
                  Text("Forgot Password"),
                ],
              )),
        ),
      ),
    );
  }
}
