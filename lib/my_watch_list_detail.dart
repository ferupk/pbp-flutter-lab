import 'package:flutter/material.dart';
import 'package:counter_7/nav_drawer.dart';
import 'package:counter_7/my_watch_list.dart';
import 'package:intl/intl.dart';

class MyWatchListDetail extends StatefulWidget {
  const MyWatchListDetail({super.key, required this.myWatchList});
  final String title = 'Detail';
  final MyWatchList myWatchList;

  @override
  State<MyWatchListDetail> createState() => _MyWatchListDetailState();
}

class _MyWatchListDetailState extends State<MyWatchListDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 18),
            Center(
              child: Text(
                widget.myWatchList.fields.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 18),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 18),
                children: [
                  const TextSpan(text: "Release Date: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: DateFormat('MMM d, yyyy').format(widget.myWatchList.fields.releaseDate)),
                ]
              )
            ),
            const SizedBox(height: 6),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 18),
                children: [
                  const TextSpan(text: "Rating: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: widget.myWatchList.fields.rating.toString()),
                  const TextSpan(text: "/5"),
                ]
              )
            ),
            const SizedBox(height: 6),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 18),
                children: [
                  const TextSpan(text: "Status: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  (widget.myWatchList.fields.watched) ? const TextSpan(text: "Watched"): const TextSpan(text: "Not Watched"),
                ]
              )
            ),
            const SizedBox(height: 6),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 18),
                children: [
                  const TextSpan(text: "Review: ", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: widget.myWatchList.fields.review),
                ]
              )
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Back")
          ),
        )
      )
    );
  }
}