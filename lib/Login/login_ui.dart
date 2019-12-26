import 'package:flutter/material.dart';
import 'package:isaac_pj/Home/home_ui.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String buttonText = '';
  double buttonWidth;
  double buttonHeight;
  double actualButtonWidth;
  double actualButtonHeight;
  bool _isPressed;

  @override
  void initState() {
    super.initState();
    buttonText = 'Login';
    buttonWidth = 0.4;
    buttonHeight = 0.05;
    _isPressed = false;
  }

  Widget usernameTextField(TextEditingController controller, double mediaWidth, double mediaHeight, Orientation orientation) {
    return Container(
      width: orientation == Orientation.portrait ? mediaWidth * 0.65 : mediaHeight * 0.65,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Username',
        ),
      ),
    );
  }

  Widget loginButton3(double mediaWidth, double mediaHeight, Orientation orientation) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: () {
          actualButtonHeight = mediaHeight * buttonHeight;
          actualButtonWidth = mediaWidth * buttonWidth;
          _isPressed
          ? loginButtonOnPressed(false, orientation)
          : loginButtonOnPressed(true, orientation);
        },
        child: AnimatedContainer(
          color: Colors.red,
          alignment: FractionalOffset.center,
          duration: Duration(milliseconds: 500),
          curve: Curves.linearToEaseOut,
          height: orientation == Orientation.portrait ? mediaHeight * buttonHeight : mediaWidth * buttonHeight,
          width: orientation == Orientation.portrait ? mediaWidth * buttonWidth : mediaHeight * buttonWidth,
          child: _isPressed
            ? Padding(padding: EdgeInsets.all(4.0), child:CircularProgressIndicator(strokeWidth: 2.0, valueColor: AlwaysStoppedAnimation<Color>(Colors.white),) 
            )
            : Text(buttonText),
        ),
      ),
    );
  }

  void loginButtonOnPressed(bool isPressed, Orientation orientation) {
    setState(() {
      if (isPressed) {
        buttonText = '';
        if (orientation == Orientation.portrait) {
          buttonWidth = buttonWidth * (actualButtonHeight / actualButtonWidth);
        } else {
          buttonWidth = buttonWidth * (actualButtonHeight / actualButtonWidth) * 4;
        }
        _isPressed = true;
      } else {
        buttonText = 'Login';
        buttonWidth = 0.4;
        _isPressed = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final double mediaWidth = MediaQuery.of(context).size.width;
    final double mediaHeight = MediaQuery.of(context).size.height;
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('eVehiclePass', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),),
            usernameTextField(controller, mediaWidth, mediaHeight, orientation),
            loginButton3(mediaWidth, mediaHeight, orientation),
            FlatButton(
              child: Text('Login'),
              onPressed: () {
                final route = MaterialPageRoute(builder: (BuildContext context) => Home());
                Navigator.push(context, route);
              },
            )

          ],
        ),
      ),
    );
  }
}



  // Widget loginButton(BuildContext context) {
  //   return InkWell(
  //     onTap: () {
  //       _isPressed
  //       ? loginButtonOnPressed(false)
  //       : loginButtonOnPressed(true);
  //     },
  //     child: AnimatedContainer(
        
  //       child: buttonWidth == 0.1 
  //         ? CircularProgressIndicator(strokeWidth: 2.0, valueColor: AlwaysStoppedAnimation<Color>(Colors.white),) 
  //         : Text(buttonText),
  //       alignment: FractionalOffset.center,
  //       duration: Duration(milliseconds: 500),
  //       curve: Curves.linearToEaseOut,
  //       width: MediaQuery.of(context).size.width * buttonWidth,
  //       height: MediaQuery.of(context).size.height * buttonHeight,
  //       decoration: BoxDecoration(
  //         color: Colors.amber,
  //         borderRadius: BorderRadius.circular(100.0)
  //       ),
  //     ),
  //   );
  // }