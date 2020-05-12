import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/providers/booking.provider.dart';
import 'package:rent_n_rooms/providers/place.provider.dart';

import '../providers/date_picker.provider.dart';
import 'modalBooking.dart';
import 'months.dart';

class Booking extends StatelessWidget {
  final String casaArrendamiento = "Metro Cuadrado";

  final Color mainColor = Color(0xFF006BB1);
  final Color mainColorMiddle = Color(0xFF2195C6);
  final Color mainColorLighter = Color(0xFF42BEBD);

  @override
  Widget build(BuildContext context) {
    final booking = Provider.of<BookingProvider>(context);
    final dates = Provider.of<DateProvider>(context, listen: false);
    final room = Provider.of<PlaceProvider>(context, listen: false);
    String price = room.formatPrice(room.getRoom().getNightPrice());
    String total = room.formatPrice(dates.getDates().checkout.difference(dates.getDates().checkin).inDays * room.getRoom().getNightPrice());
    
    final notBooking = false;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Información de reserva',
            style:
                TextStyle(fontFamily: 'Cocogoose', fontWeight: FontWeight.w200),
          ),
          backgroundColor: mainColorLighter,
        ),
        body: SafeArea(
            child: Column(children: <Widget>[
          Expanded(
              child: Container(
            child: ListView(
              padding: EdgeInsets.only(left: 20, right: 20),
              children: <Widget>[
                Container(
                    height: 110,
                    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      child: Text(
                                          '${room.getRoom().getPlaceName().toUpperCase()}',
                                          textAlign: TextAlign.left,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: mainColorLighter,
                                              fontSize: 15.0,
                                              fontFamily: 'Cocogoose',
                                              fontWeight: FontWeight.w300))),
                                  Container(
                                    padding: EdgeInsets.only(),
                                    child: Text(
                                      '\$$price COP',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromRGBO(0, 0, 0, 0.6)),
                                    ),
                                  ),
                                  Container(
                                    child: Row(children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow[500],
                                      ),
                                      Text(
                                          room.getRoom().getRating().toString(),
                                          style: TextStyle(
                                            fontSize: 13.0,
                                          )),
                                    ]),
                                  ),
                                ]),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              alignment: Alignment.center,
                              height: 220,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        room.getRoom().getPicture()),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                        ])),
                Divider(height: 10.0, thickness: 2),
                Container(
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Entrada',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Cocogoose',
                                        color: Color.fromRGBO(0, 0, 0, 0.6)),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${dates.getDates().checkin.day}/',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: mainColorLighter),
                                        ),
                                        Text(
                                            '${Months.monthsSpanish[dates.getDates().checkin.month]}',
                                            style: TextStyle(
                                                fontFamily: 'Cocogoose',
                                                color: mainColorLighter))
                                      ]),
                                  Text(
                                    dates.getDates().checkin.year.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.6)),
                                  )
                                ]),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Salida',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Cocogoose',
                                        color: Color.fromRGBO(0, 0, 0, 0.6)),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${dates.getDates().checkout.day}/',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: mainColorLighter),
                                        ),
                                        Text(
                                            '${Months.monthsSpanish[dates.getDates().checkout.month]}',
                                            style: TextStyle(
                                                fontFamily: 'Cocogoose',
                                                color: mainColorLighter))
                                      ]),
                                  Text(
                                      dates.getDates().checkout.year.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.6)))
                                ]),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.date_range,
                                    size: 35,
                                    color: Color.fromRGBO(0, 0, 0, 0.5)),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${dates.getDates().checkout.difference(dates.getDates().checkin).inDays.toString()} ',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text('días',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Cocogoose',
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.6)))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                notBooking ? Divider(height: 10.0, thickness: 2) : Container(),
                notBooking
                    ? Container(
                        child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 2,
                              child: Container(
                                alignment: Alignment.center,
                                child: Icon(Icons.book,
                                    size: 30,
                                    color: Color.fromRGBO(0, 0, 0, 0.6)),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('Código de reserva:',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Cocogoose',
                                          fontWeight: FontWeight.w200,
                                          color: Color.fromRGBO(0, 0, 0, 0.6))),
                                  Text('${booking.getBooking().getIdBooking()}')
                                ],
                              )))
                        ],
                      ))
                    : Container(),
                Divider(height: 10.0, thickness: 2),
                Container(
                    child: Column(
                  children: <Widget>[
                    SizedBox(height: 12.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${dates.getDates().checkout.difference(dates.getDates().checkin).inDays.toString()} X \$$price',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.6),
                                fontSize: 15),
                          ),
                          Text(
                              '\$$total',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                  fontSize: 15))
                        ]),
                    SizedBox(height: 15.0),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Otros servicios',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cocogoose',
                                color: Color.fromRGBO(0, 0, 0, 0.6)),
                          ),
                          Text('0.0',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                  fontSize: 15)),
                        ]),
                    SizedBox(height: 12.0),
                  ],
                )),
                Divider(height: 10.0, thickness: 2),
                SizedBox(height: 12.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total (COP)',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Cocogoose',
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(0, 0, 0, 0.6)),
                      ),
                      Text(
                          '\$$total',
                          style: TextStyle(
                              fontSize: 19,
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                              fontWeight: FontWeight.bold))
                    ]),
              ],
            ),
          )),
          Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: RaisedButton(
                color: mainColorLighter,
                child: Text(
                  'RESERVAR',
                  style: TextStyle(
                      fontFamily: 'Cocogoose',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
                onPressed: () async {
                  onBooking(context, booking, dates, room);
                },
              ))
        ])));
  }
}