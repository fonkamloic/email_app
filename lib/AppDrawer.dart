import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://avatars1.githubusercontent.com/u/23703424?s=460&v=4"),
            ),
            accountEmail: Text("fonkamloic@gmail.com"),
            accountName: Text("Fonkam Loic"),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Adding new account..."),
                        );
                      });
                },
                child: CircleAvatar(
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.inbox),
            title: Text("Inbox"),
            trailing: Chip(
              label: Text("2", style: TextStyle(fontWeight: FontWeight.bold)),
              backgroundColor: Colors.blue[100],
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.edit),
            title: Text("Draft"),
            trailing: Chip(
              label: Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
              backgroundColor: Colors.red[100],
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.archive),
            title: Text("Archive"),
            trailing: Chip(
              label: Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
              backgroundColor: Colors.red[100],
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.paperPlane),
            title: Text("Sent"),
            trailing: Opacity(
              opacity: 0,
              child: Chip(
                label:
                Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.red[100],
              ),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.trash),
            title: Text("Trash"),
            trailing: Chip(
              label: Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
              backgroundColor: Colors.red[100],
            ),
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(FontAwesomeIcons.toolbox),
                title: Text("Settings"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
