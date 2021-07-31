import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:taskproject/models/movies_models.dart';
import 'package:connectivity/connectivity.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late Connectivity connectivity;
  late StreamSubscription<ConnectivityResult> subscription;

  Future<List<Result>> makePostRequest() async {
    final uri = Uri.parse('https://hoblist.com/movieList');
    final headers = {'Content-Type': 'application/json'};
    Map<String, String> body = {
      "category": "movies",
      "language": "kannada",
      "genre": "all",
      "sort": "voting"
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    Response response = await post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    if (response.statusCode == 200) {
      final movies = hoblistFromJson(response.body);
      return movies.result;
    } else {
      throw Exception('Failed to load movies list!');
    }
  }

  // @override
  // void initState() {
  //   super.initState();

  //   connectivity = new Connectivity();
  //   subscription =
  //       connectivity.onConnectivityChanged.listen((ConnectivityResult event) {
  //     if (event == ConnectivityResult.wifi ||
  //         event == ConnectivityResult.mobile) {
  //       setState(() {});
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   subscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Block-Busters'),
      ),
      body: Center(
        child: FutureBuilder(
          future: makePostRequest(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            final data = snapshot.data;
            if (data == null) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.arrow_drop_up,
                                    size: 30.0,
                                  ),
                                  Text(data[index].voting.toString()),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    size: 30.0,
                                  ),
                                  Text('Votes'),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.all(10.0),
                                width: 70.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    data[index].poster,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].title,
                                      overflow: TextOverflow.ellipsis,
                                      style: new TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: 'Roboto',
                                        color: new Color(0xFF212121),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Genre: ${data[index].genre.toString()}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.5,
                                    ),
                                    Text(
                                      "Director: ${data[index].director[0]}",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 2.5,
                                    ),
                                    Text(
                                      "Starring: ${data[index].stars[0].toString()}",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 2.5,
                                    ),
                                    Text(
                                      "Mins | English | 1 Apr",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.5,
                                    ),
                                    Text(
                                      "${data[index].pageViews.toString()} views | Voted by ${data[index].totalVoted.toString()}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.blue.shade500,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          OutlinedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                return Colors.blue;
                              }),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Watch Trailer',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
