import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poliglot_translater/screens/Camera.dart';
import 'package:poliglot_translater/screens/Other.dart';
import 'package:poliglot_translater/screens/Settings.dart';
import 'package:poliglot_translater/screens/Translate.dart';
import 'package:poliglot_translater/utilities/ThemeFormat.dart';
import 'package:provider/provider.dart';


enum _SelectedTab { translate, camera, other, settings }

class HomePanel extends StatefulWidget {

  @override
  _HomePanelState createState() => _HomePanelState();
}

class _HomePanelState extends State<HomePanel> {

  var _selectedTab = _SelectedTab.translate;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }
  Widget getScreen(){
    switch(_selectedTab){
      case _SelectedTab.translate:
        return Translate();
      case _SelectedTab.camera:
        return Camera();
      case _SelectedTab.other:
        return Other();
      case _SelectedTab.settings:
        return Settings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poliglot"),
        leading: IconButton(
          icon: Icon(Icons.list),
          iconSize: 30,
          onPressed: () {  },
        ),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  Provider.of<ThemeFormat>(context,listen: false).toggleTheme();
                });
              },
              icon: Icon(FontAwesomeIcons.solidLightbulb))
        ],
      ),
      body: getScreen(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: EdgeInsets.only(left: 10, right: 10),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          dotIndicatorColor: Colors.white,
          unselectedItemColor: Colors.grey[300],
          enableFloatingNavBar: true,
          onTap: _handleIndexChanged,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: Icon(Icons.translate),
              selectedColor: Color(0xff73544C),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Icon(Icons.add_a_photo),
              selectedColor: Color(0xff73544C),
            ),

            /// Search
            DotNavigationBarItem(
              icon: Icon(Icons.devices_other),
              selectedColor: Color(0xff73544C),
            ),

            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.settings),
              selectedColor: Color(0xff73544C),
            ),
          ],
        ),
      ),
    );
  }
}

