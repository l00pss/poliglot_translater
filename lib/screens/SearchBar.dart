import 'package:flutter/material.dart';


class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            title: Text("Poliglot"),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.translate))
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "buraya yaz...",
                        prefixIcon: Icon(Icons.search)
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
              [
                Container(
                  height: 400,
                  child: Center(child: Text("BODY"),),
                ),
                Container(
                  height: 1000,
                  color: Colors.yellow,
                )
              ]
          ))
        ],
      ),
    );
  }
}
