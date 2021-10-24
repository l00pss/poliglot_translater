import 'package:flutter/material.dart';
import 'package:poliglot_translater/screens/export_screens.dart';


class SearchBar extends StatefulWidget {
  Future function;
  SearchBar({
    required this.function,
  });

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
              IconButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex)=>HomePanel()));
              }, icon: Icon(Icons.translate))
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
                  height: MediaQuery.of(context).size.height/2.5,
                  child: FutureBuilder(
                    future: widget.function,
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                      if(!snapshot.hasData){
                        return Center(child: CircularProgressIndicator());
                      }else{
                        return ListView.builder(
                            itemCount: (snapshot.data as List).length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Card(
                                  child: SizedBox(
                                    height: 50,
                                    child: Row(
                                      children: [
                                        snapshot.data[index]
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    },
                  )
                ),
                Container(
                  height: 1000,
                  color: Theme.of(context).cardColor,
                )
              ]
          ))
        ],
      ),
    );
  }
}
