import 'package:ckcstudent/pages/home.dart';
import 'package:ckcstudent/pages/student_guide.dart';
import 'package:flutter/material.dart';

class BottomBarContainer extends StatefulWidget {
  BottomBarContainer({Key key}) : super(key: key);

  @override
  _BottomBarContainerState createState() => _BottomBarContainerState();
}

class _BottomBarContainerState extends State<BottomBarContainer> {
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
      StudentGuidePage(),
    ];
    originalDic = {0: true, 1: false, 2: false};
    listScreens = [originalList.first];
    listScreensIndex = [0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: tabIndex, children: listScreens),
      bottomNavigationBar: _buildTabBar(),
    );
  }

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

  Widget _buildTabBar() {
    var listItems = [
      BottomAppBarItem(iconData: Icons.home, text: 'Trang chủ'),
      BottomAppBarItem(
          iconData: Icons.insert_chart, text: 'Hướng dẫn sinh viên'),
    ];

    var items = List.generate(listItems.length, (int index) {
      return _buildTabItem(
        item: listItems[index],
        index: index,
        onPressed: _selectedTab,
      );
    });

    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: Colors.white,
    );
  }

  Widget _buildTabItem({
    BottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    var color =
        tabIndex == index ? Theme.of(context).primaryColor : Colors.grey;
    return Expanded(
      child: SizedBox(
        height: 60,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: 24),
                Text(
                  item.text,
                  style: TextStyle(color: color, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomAppBarItem {
  BottomAppBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}
