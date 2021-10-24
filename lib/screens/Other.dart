import 'package:flutter/material.dart';
import 'package:poliglot_translater/dataAccess/repositories/TranslaterManager.dart';
import 'package:poliglot_translater/entities/Word.dart';
import 'package:poliglot_translater/widgets/ListWords.dart';
import 'package:poliglot_translater/widgets/WordCard.dart';

import 'SearchBar.dart';

class Other extends StatefulWidget {

  @override
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other> {
  var en = TextEditingController();
  var az = TextEditingController();

  Future<List<WordCard>> getWidgetList() async{
    var list = await TranslaterManager().getAllWords();
    var _actionItems = <WordCard>[];
    list.forEach((element) {
      _actionItems.add(WordCard(
        element.en,(){},element.az
      ));
    });
    return _actionItems;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text("English",style: Theme.of(context).textTheme.headline5,),
            ],
          ),
          TextFormField(
            controller: en,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("Azərbaycan dili",style: Theme.of(context).textTheme.headline5),
            ],
          ),
          TextFormField(
            controller: az,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(onPressed: (){
                    TranslaterManager().save(Word(az: az.text, en: en.text));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Row(
                        children: [
                          Icon(Icons.save,color: Theme.of(context).cardColor,),
                          Text(" Yeni söz əlavə edildi."),
                        ],
                      ),
                    ));
                  }, icon: Icon(Icons.add,size: 30,))),
              Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(onPressed: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>SearchBar()));
                  }, icon: Icon(Icons.search,size: 30,))),
              Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ListWords(function: getWidgetList())));
                  }, icon: Icon(Icons.list,size: 30,))),
              Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.delete,size: 30,color: Colors.redAccent,))),
            ],
          ),
        ],
      ),
    );
  }
}
