import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/providers/place.provider.dart';

class ErrorMessage extends StatelessWidget {

  const ErrorMessage({Key key}) : super(key: key);

  static Color mainColor = Color(0xFF006BB1);
  static Color mainColorMiddle = Color(0xFF2195C6);
  static Color mainColorLighter = Color(0xFF42BEBD);

  @override
  Widget build(BuildContext context) {
    final room = Provider.of<PlaceProvider>(context, listen: false);

    return Container(
        height: 200,
        child: Column(children: <Widget>[
          Text("¡Ocurrió un error!",
              style: TextStyle(
                  color: mainColorLighter,
                  fontFamily: 'Cocogoose',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700)),
          SizedBox(height: 15),
          Text(
              'Lo sentimos, hubo un problema reservando a la agencia ${room.getRoom().getAgency()}, pero puedes intentar con otra.',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Cocogoose',
                  fontWeight: FontWeight.w200,
                  color: Color.fromRGBO(0, 0, 0, 0.6))),
          Icon(Icons.error_outline, size: 60, color: mainColorLighter)
        ]));
  }
}
