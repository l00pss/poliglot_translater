

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poliglot_translater/utilities/ScreenUtility.dart';

enum Language{ EN, AZ, RU,}
extension LanguageExtension on Language{
  String get name => describeEnum(this);
  String get displayTitle {
    switch (this) {
      case Language.AZ:
        return 'Azərbaycan';
      case Language.EN:
        return 'English';
      case Language.RU:
        return 'Русский';
    }
  }
}

class Translate extends StatefulWidget {
  var fromLang = Language.EN.displayTitle;
  var toLang = Language.AZ.displayTitle;


  @override
  _TranslateState createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  var controller = TextEditingController();
  var output = "";
  var endLetterLimit = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final String text = controller.text.toLowerCase();
      controller.value = controller.value.copyWith(
        text: text,
        selection: TextSelection(
            baseOffset: text.length,
            extentOffset: text.length
        ),
        composing: TextRange.empty
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: TextButton(onPressed: (){}, child: Text(widget.fromLang))),
              Expanded(
                child: IconButton(onPressed: (){
                  var cup;
                  setState(() {
                    cup = widget.fromLang;
                    widget.fromLang = widget.toLang;
                    widget.toLang = cup;
                  });
                }, icon: Icon(Icons.translate)),
              ),
              Expanded(child: TextButton(onPressed: (){}, child: Text(widget.toLang)))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.send_rounded)),
                    Text("${endLetterLimit}/200")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: ScreenUtility.getMediaQuerySizes(context).width/1.05,
                    height: ScreenUtility.getMediaQuerySizes(context).height/4,
                    decoration: BoxDecoration(
                      color: Color(0xFF34635d),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(output,style: Theme.of(context).textTheme.headline6,),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.white,))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
