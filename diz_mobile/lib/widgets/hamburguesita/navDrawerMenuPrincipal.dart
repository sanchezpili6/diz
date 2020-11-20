import 'package:diz/constants.dart';
import 'package:diz/screens/department/department.dart';
import 'package:diz/screens/home/main_page.dart';
import 'package:diz/screens/myAccount/myAccountScreen.dart';
import 'package:diz/services/registro.dart';
import 'package:flutter/material.dart';
import 'package:diz/screens/welcome/welcome_screen.dart';

class NavDrawer extends StatelessWidget {
  /*makeGetRequestUserInfo(id) async {
    // make GET request
    print(id);
    //String url = 'http://35.239.19.77:8000/clients/$id';
    Response response = await get('http://35.239.19.77:8000/clients/63');
    // sample info available in response
    //int statusCode = response.statusCode;
    print(response.statusCode);
    //302 bueno
    /*if(response.statusCode==302){
      String json = response.body;
      Map<String, dynamic> user = jsonDecode(json);
      print(user);
      return user;
    }
    else{
      return null;
    }*/
  }*/


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
            onTap: () => {Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MainPage();
                },
              ),
            ),},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Mi cuenta'),
              //SI NO HA INICIADO SESION
              onTap:()async {
              if(logged==false||logged==null){
                Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
              }
              //SI YA INICIO SESION
              else{
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccountScreen()),);
              }
            }
          ),
          ExpansionTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Departamentos'),
            children: <Widget>[
              DepartmentWidget(
                icon: Icon(Icons.local_library),
                title: Text('Librería'),
                color: cLibreria,
                bckColor: Color(0xFF101820),
                dep: 2,
              ),
              DepartmentWidget(
                icon: Icon(Icons.local_drink),
                title: Text('Vinos y licores'),
                color: cVinosLicores,
                bckColor: Color(0xFF2D2926),
                dep: 3,
              ),
              DepartmentWidget(
                icon: Icon(Icons.event_seat),
                title: Text("Blancos y muebles"),
                color: Color(0xFFFFFFFF),
                bckColor: Color(0xFF000000),
                dep: 5,
              ),
              DepartmentWidget(
                icon: Icon(Icons.face),
                title: Text("Ropa"),
                color: cRopa,
                bckColor: Color(0xFF101820),
                dep: 1,
              ),
              DepartmentWidget(
                icon: Icon(Icons.videogame_asset),
                title: Text("Videojuegos"),
                color: cVideojuegos,
                bckColor: Color(0xFF101820),
                dep: 4,
              ),
            ],
          ),
          /*ListTile(
            leading: Icon(Icons.star),
            title: Text('Promociones'),
            onTap: () => {Navigator.of(context).pop()},
          ),*/
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {
              logged=false, correo='', contrasena='', telefono='', nombrePila='', apellidoP='', apellidoM='', genero='', uid='',cumple=null,
              Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) {
            return WelcomeScreen();
            },
            ),
            ),},
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
  final int dep;
  DepartmentWidget({this.icon, this.title, this.color, this.bckColor, @required this.dep});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: title,
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Department(department: title, colour: color,bckColour: bckColor, dep: dep,),
          ),
        ),
      },
    );
  }
}
