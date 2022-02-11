import 'Dialog.dart';
import 'package:flutter/material.dart';

class DiamondDrawer {
  static create(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: CircleAvatar()
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Item 1"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Item 2"),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Sair"),
            onTap: () {
              DiamondDialog.create(
                context,
                text: "Deseja realmente sair do aplicativo?",
                actions: <Widget>[
                  TextButton(
                    child : Text("Não"),
                    onPressed : () {
                      Navigator.of(context).pop();
                    }
                  ),
                  TextButton(
                    child : Text("Sim"),
                    onPressed : () async {
                      Navigator.of(context).pop();
                    }
                  )
                ],
              );
            },
          )          
        ],
      ),
    );
  }
}