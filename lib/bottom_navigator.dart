import 'package:ckcstudent/guide_page/guide.dart';
import 'package:ckcstudent/home_page/home.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> tabList = [
  {
    'child': HomePage(),
    'mounted': true,
    'itemIcon': Icons.home,
    'itemTitle': 'Trang chủ',
    'index': 0,
  },
  {
    'child': GuidePage(),
    'mounted': false,
    'itemIcon': Icons.event_note,
    'itemTitle': 'Hướng dẫn',
    'index': 1,
  },
];

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
    originalList = List<Widget>.from(tabList.map((item) => item['child']));
    originalDic = Map.fromIterable(
      tabList,
      key: (item) => item['index'],
      value: (item) => item['mounted'],
    );
    listScreens = [originalList.first];
    listScreensIndex = [0];
  }

  void _selectedTab(int index) {
    if (originalDic[index] == false) {
      listScreensIndex.add(index);
      originalDic[index] = true;
      listScreensIndex.sort();
      listScreens =
          listScreensIndex.map((index) => originalList[index]).toList();
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
        items: tabList
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item['itemIcon']),
                title: Text(item['itemTitle']),
              ),
            )
            .toList(),
      ),
    );
  }
}
