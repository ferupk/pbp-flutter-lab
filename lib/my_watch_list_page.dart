import 'package:counter_7/my_watch_list.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/nav_drawer.dart';
import 'package:counter_7/fetch_my_watch_list.dart';
import 'package:counter_7/my_watch_list_detail.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});
  final String title = 'My Watch List';

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  Future<List<MyWatchList>> futureMyWatchList = fetchMyWatchList();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const NavDrawer(),
      body: FutureBuilder(
        future: futureMyWatchList,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: (snapshot.data![index].fields.watched ? Colors.green : Colors.red),
                    width: 2
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: ListTile(
                  title: Text(snapshot.data![index].fields.title),
                  leading: Checkbox(
                    value: snapshot.data![index].fields.watched,
                    onChanged: (value) {
                      setState(() {
                        snapshot.data![index].fields.watched = value!;
                      }); 
                    }
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyWatchListDetail(myWatchList: snapshot.data![index])),
                    );
                  },
                )
              )
            );
          }
        },
      ),
    );
  }
}