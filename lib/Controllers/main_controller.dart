import 'package:flutter/material.dart';
import 'package:sleepy_bear/Controllers/Menu%20controllers/settings_controller.dart';
import 'package:sleepy_bear/UI/background.dart';
import 'package:sleepy_bear/Values/Assets.dart';
import 'package:sleepy_bear/Values/strings.dart';

class MainController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {
  int _selectedIndex = 0;
  bool _showBar = true;

  Theme? get _getBottomBar {
    if (!_showBar) {
      return null;
    }
    return Theme(
      data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Assets.listenIcon,
            label: Strings.sleep,
          ),
          BottomNavigationBarItem(
            icon: Assets.storiesIcon,
            label: Strings.stories,
          ),
          BottomNavigationBarItem(
            icon: Assets.soundsIcon,
            label: Strings.sounds,
          ),
          BottomNavigationBarItem(
            icon: Assets.moreIcon,
            label: Strings.more,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: [
              Center(child: Text("Sleep")),
              Center(child: Text("Stories")),
              Center(child: Text("Sounds")),
              SettingsController(),
            ],
          ),
          bottomNavigationBar: _getBottomBar
        ),
      ),
    );
  }
}
