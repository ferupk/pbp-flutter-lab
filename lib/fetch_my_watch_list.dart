import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:counter_7/my_watch_list.dart';

Future<List<MyWatchList>> fetchMyWatchList() async {
  Uri url = Uri.parse('https://django-pbp-ferupk.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<MyWatchList> myWatchList = [];
  for (var watch in data) {
    myWatchList.add(MyWatchList.fromJson(watch));
  }

  return myWatchList;
}