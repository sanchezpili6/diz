import 'package:flutter/material.dart';
import 'package:diz/screens/menu/department.dart';
import 'package:diz/screens/welcome/welcome_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.grey, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                    image: AssetImage('assets/images/dizblack.png')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Inicio'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Mi cuenta'),
              onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()),)}
          ),
          ExpansionTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Departamentos'),
            children: <Widget>[
              DepartmentWidget(
                icon: Icon(Icons.local_library),
                title: Text('Librería'),
                color: Color(0xFFF2AA4C),
                bckColor: Color(0xFF101820),
              ),
              DepartmentWidget(
                icon: Icon(Icons.local_drink),
                title: Text('Vinos y licores'),
                color: Color(0xFFE94B3C),
                bckColor: Color(0xFF2D2926),
              ),
              DepartmentWidget(
                icon: Icon(Icons.event_seat),
                title: Text("Blancos y muebles"),
                color: Color(0xFFFFFFFF),
                bckColor: Color(0xFF000000),
              ),
              DepartmentWidget(
                icon: Icon(Icons.face),
                title: Text("Ropa"),
                color: Color(0xFF8C004B),
                bckColor: Color(0xFF101820),
              ),
              DepartmentWidget(
                icon: Icon(Icons.videogame_asset),
                title: Text("Videojuegos"),
                color: Color(0xFF006b38),
                bckColor: Color(0xFF101820),
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

class DepartmentWidget extends StatelessWidget {
  final Icon icon;
  final Text title;
  final Color color;
  final Color bckColor;

  DepartmentWidget({this.icon, this.title, this.color, this.bckColor});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: title,
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Department(department: title, colour: color,bckColour: bckColor,),
          ),
        ),
      },
    );
  }
}
