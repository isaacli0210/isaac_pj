import 'package:flutter/material.dart';
import 'package:isaac_pj/Search/search_func.dart';
//import 'package:isaac_pj/Home/change_venue_button.dart';
import 'package:isaac_pj/Drawer/custom_drawer.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  void initState() {
    super.initState();
    
  }

  final items = List<String>.generate(30, (i) => "Item $i");

  Widget appBar(BuildContext context) {
    return AppBar(
      title: Text('Phase 1'),
      centerTitle: true,
      actions: <Widget>[
        //ChangeVenueButton(),
        IconButton(
          icon: Icon(Icons.my_location),
          tooltip: 'Venue',
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => Container(

                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: const Radius.circular(20.0), topRight: const Radius.circular(20.0)),
                  color: Colors.red,
                ),
              )
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'Search',
          onPressed: () {
            showSearch(context: context, delegate: SearchFunc());
          },
        )
      ],
      backgroundColor: Colors.blue,
      elevation: 0,
    );
  }

  Widget drawer(Orientation orientation) {
    return CustomDrawer(
      widthPercentage: orientation == Orientation.portrait ? 0.4 : 0.2,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 90.0,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: CircleAvatar(
                    child: Text('eVP'),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('進場', style: TextStyle(fontWeight: FontWeight.bold),),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }

  Widget passList() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${items[index]}'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: appBar(context), 
      //drawer: drawer(orientation),
      body: Column(
        children: <Widget>[Expanded(child: passList())],
      ),
    );
  }
}
