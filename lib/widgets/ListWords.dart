import 'package:flutter/material.dart';



class ListWords extends StatefulWidget {

  Future function;
  ListWords({
    required this.function,
  });

  @override
  _ListWordsState createState() => _ListWordsState();


}

class _ListWordsState extends State<ListWords> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.function,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }else{
            return SafeArea(
              child: Container(
                color: Theme.of(context).primaryColor,
                child: ListView.builder(
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
                    }),
              ),
            );
          }
        },
      );

  }
}

