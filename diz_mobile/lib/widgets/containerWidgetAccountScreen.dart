import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class containerWidgetMyAccount extends StatelessWidget {
  final String value;
  containerWidgetMyAccount({this.value }) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(50.0, 15.0, 30.0, 15.0),
        child: Text(value,
          textAlign: TextAlign.left,
          style: GoogleFonts.lato(
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
