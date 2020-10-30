import 'package:flutter/material.dart';
import 'package:diz/widgets/departmentStyle.dart';
import 'package:diz/constants.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Diz',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              /*image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))*/
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Inicio'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Mi cuenta'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ExpansionTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Departamentos'),
            children: <Widget>[
              DepartmentWidget(
                icon: Icon(Icons.local_library),
                title: Text('Librería'),
                color: cLibreria,
                bckColor: kPrimaryLightColor,
              ),
              DepartmentWidget(
                icon: Icon(Icons.local_drink),
                title: Text('Vinos y licores'),
                color: cVinosLicores,
                bckColor: kPrimaryLightColor,
              ),
              DepartmentWidget(
                icon: Icon(Icons.event_seat),
                title: Text("Blancos y muebles"),
                color: Colors.black,
                bckColor: kPrimaryLightColor,
              ),
              DepartmentWidget(
                icon: Icon(Icons.face),
                title: Text("Ropa"),
                color: cRopa,
                bckColor: kPrimaryLightColor,
              ),
              DepartmentWidget(
                icon: Icon(Icons.videogame_asset),
                title: Text("Videojuegos"),
                color: cVideojuegos,
                bckColor: kPrimaryLightColor,
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Promociones'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}

