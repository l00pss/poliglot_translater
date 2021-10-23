import 'package:flutter/material.dart';

class Other extends StatefulWidget {
  const Other({Key? key}) : super(key: key);

  @override
  _OtherState createState() => _OtherState();
}

class _OtherState extends State<Other> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Other",style: Theme.of(context).textTheme.subtitle1,),
    );
  }
}
