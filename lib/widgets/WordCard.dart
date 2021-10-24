import 'package:flutter/material.dart';



class WordCard extends StatelessWidget {
  String from;
  String to;
  Function onPressed;

  WordCard(this.from, this.onPressed,this.to);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.circle_notifications,size: 15,),
          Text(
            from,
            style: Theme.of(context).textTheme.headline5,
          ),
          Text(
            " => "
          ),
          Text(
            to,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
