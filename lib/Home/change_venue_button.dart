import 'package:flutter/material.dart';

class ChangeVenueButton extends StatefulWidget {
  @override
  _ChangeVenueButtonState createState() => _ChangeVenueButtonState();
}

class _ChangeVenueButtonState extends State<ChangeVenueButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.my_location),
      onPressed: () {
        openAlertDialog();
      },
    );
  }

  openAlertDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: 150.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(child: Text('Change Venue', style: TextStyle())),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FlatButton(child: Text('Phase 1', style: TextStyle(color: Colors.red),), onPressed: (){}, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0), side: BorderSide(color: Colors.red)),),
                    FlatButton(child: Text('Phase 2', style: TextStyle(color: Colors.white) ), color: Colors.red, onPressed: (){},),
                    FlatButton(child: Text('Tsing-Yi', style: TextStyle(color: Colors.white)), color: Colors.red, onPressed: (){},),
                  ],
                ),
                FlatButton(child: Text('Confirm'), onPressed: (){},)
              ],
            ),
          ),
        );
      }
    );
  }
}