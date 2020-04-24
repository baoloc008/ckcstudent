import 'package:ckcstudent/guide_page/guide.dart';
import 'package:ckcstudent/home_page/home.dart';
import 'package:ckcstudent/setting_page/setting.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  BottomNavigator({Key key}) : super(key: key);

  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  List<Widget> originalList;
  Map<int, bool> originalDic;
  List<Widget> listScreens;
  List<int> listScreensIndex;

  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    originalList = [
      HomePage(),
      GuidePage(),
      SettingPage(),
    ];
    originalDic = {0: true, 1: false, 2: false};
    listScreens = [originalList.first];
    listScreensIndex = [0];
  }

//  @override
//  bool get wantKeepAlive =>
//      true; //by default it will be null, change it to true.

  void _selectedTab(int index) {
    if (originalDic[index] == false) {
      listScreensIndex.add(index);
      originalDic[index] = true;
      listScreensIndex.sort();
      listScreens = listScreensIndex.map((index) {
        return originalList[index];
      }).toList();
    }

    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: tabIndex, children: listScreens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        onTap: _selectedTab,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Trang chủ'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            title: Text('Hướng dẫn'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Cài đặt'),
          ),
        ],
      ),
    );
  }
}
