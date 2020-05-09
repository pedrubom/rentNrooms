import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rent_n_rooms/models/search_card.model.dart';

class SearchCardRepository {
  final String url =
     // 'http://ec2-34-195-214-219.compute-1.amazonaws.com:8000/rooms/search?location=MDE&checkin=2020-05-10&checkout=2020-06-02';
'http://ec2-13-58-217-208.us-east-2.compute.amazonaws.com/api/rooms/search?location=MDE&checkin=2020-05-10&checkout=2020-06-10';

  Future<int> getLength() async {
    http.Response response = await http.get(url);
    List data = json.decode(response.body);
    List searchCards = data;
    return searchCards.length;
  }

  Future<List<SearchCard>> fetchSearchCards() async {
    http.Response response = await http.get(url);
    List data = json.decode(response.body);
    List searchCards = data;
    return searchCards.map((obj) {
      String imgURL = obj['thumbnail'];
      String location = obj['location']['name'];
      String rating = obj['rating'].toString();
      String property = obj['property_name'];
      num price = obj['price'];
      String idRoom = obj['id'];
      String agency = obj['agency']['name'];
      return SearchCard(imgURL, location, rating, property, price, idRoom, agency);
    }).toList();
  }
}
