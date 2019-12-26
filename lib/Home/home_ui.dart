import 'package:flutter/material.dart';
import 'package:isaac_pj/Search/search_func.dart';
import 'change_venue_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final items = List<String>.generate(30, (i) => "Item $i");

  Widget appBar(BuildContext context) {
    return AppBar(
      title: Text('Phase 1'),
      centerTitle: true,
      
      actions: <Widget>[
        ChangeVenueButton(),
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
    return Scaffold(
      appBar: appBar(context),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
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
      ),
      body: Column(
        children: <Widget>[Expanded(child: passList())],
      ),
    );
  }
}
