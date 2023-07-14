import 'package:cheiwe_player/Model/genreData.dart';
import 'package:cheiwe_player/helper/pref.dart';

import '../Model/trendingData.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
//API Calling

  static Future<TrendingData?> fetchData() async {
    String token = await getToken();
    String link =
        "http://discoveryplus.herokuapp.com/genre/getMoviesSeasonsAndGenres?column=id";
    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return trendingDataFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }

  static Future<GenreFIlter?> genreFilter(id) async {
    String token = await getToken();
    String link =
        "https://discoveryplus.herokuapp.com/genre/getMoviesAndSeasonsByGenreId?column=id&genreId=$id";
    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return genreFIlterFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }

  static Future<TrendingData?> filterData() async {
    String token = await getToken();
    String link =
        "http://discoveryplus.herokuapp.com/genre/getMoviesAndSeasonsByGenreId?column=id&genreId=";
    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {
        "skip": "0",
        "take": "2",
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return trendingDataFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }

  static Future<TrendingData?> paginatedData() async {
    String token = await getToken();
    String link =
        "http://discoveryplus.herokuapp.com/genre/getMoviesSeasonsAndGenres?column=_id&skip=2&take=2";
    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return trendingDataFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }
}
