import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int fabClickCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Productive",
        ),
      ),
      body: Center(
        child: Text(fabClickCount.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8.0,
        onPressed: () {
          setState(() {
            fabClickCount += 1;
          });
        },
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: BottomAppbarContainer(),
        notchMargin: 8.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class BottomAppbarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<AppbarMenuData> appBarMenuData = [
      AppbarMenuData(title: "Home", icon: Icons.home, index: 0),
      AppbarMenuData(title: "Stats", icon: Icons.pie_chart, index: 1),
      null,
      AppbarMenuData(title: "Social", icon: Icons.people, index: 2),
      AppbarMenuData(title: "More", icon: Icons.more_horiz, index: 3),
    ];
    return BottomAppbarRow(appBarMenuData);
  }
}

class AppbarMenuData {
  const AppbarMenuData({this.title, this.icon, this.index});

  final String title;
  final IconData icon;
  final int index;
}

class BottomAppbarRow extends StatefulWidget {
  const BottomAppbarRow(this.data);

  final List<AppbarMenuData> data;

  @override
  _BottomAppbarRowState createState() => _BottomAppbarRowState();
}

class _BottomAppbarRowState extends State<BottomAppbarRow> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget.data.map((AppbarMenuData data) {
        if (data == null) return Container(width: 20, height: 0);
        return AppbarMenu(
          title: data.title,
          icon: data.icon,
          isActive: data.index == currentIndex,
          callBack: () {
            setState(() {
              currentIndex = data.index;
            });
          },
        );
      }).toList(),
    );
  }
}

class AppbarMenu extends StatefulWidget {
  const AppbarMenu({
    this.title = "",
    this.icon,
    this.isActive,
    this.callBack,
  });

  final String title;
  final IconData icon;
  final bool isActive;
  final Function() callBack;

  @override
  _AppbarMenuState createState() => _AppbarMenuState();
}

class _AppbarMenuState extends State<AppbarMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
        height: 70,
        child: menuItemContent(),
      ),
    );
  }

  Column menuItemContent() {
    return Column(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 150),
            height: widget.isActive ? 42 : 36,
            child: IconButton(
              onPressed: () {
                widget.callBack();
              },
              icon: Container(
                height: widget.isActive ? 42 : 36,
                child: Icon(
                  widget.icon,
                  color: widget.isActive ? Colors.blue : Colors.black45,
                  size: widget.isActive ? 36 : 32,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              widget.title,
              style: TextStyle(
                color: widget.isActive ? Colors.blue : Colors.black45,
                fontSize: widget.isActive ? 16 : 14,
              ),
            ),
          ),
        ],
      );
  }
}
