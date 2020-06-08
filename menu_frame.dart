import 'package:flutter/material.dart';
import 'package:pets_ui/adoption_screen.dart';
import 'package:pets_ui/menu_screen.dart';

class MenuFrame extends StatefulWidget {
  @override
  _MenuFrameState createState() => _MenuFrameState();
}

class _MenuFrameState extends State<MenuFrame>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> scaleAnimation, smallerScaleAnimation;
  Duration duration = Duration(milliseconds: 200);
  bool menuOpen = true;
  List<Animation> scaleAnimations;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: duration);
    scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.7).animate(_animationController);
    smallerScaleAnimation =
        Tween<double>(begin: 1.0, end: 0.6).animate(_animationController);

    scaleAnimations = [
      Tween<double>(begin: 1.0, end: 0.7).animate(_animationController),
      Tween<double>(begin: 1.0, end: 0.6).animate(_animationController),
      Tween<double>(begin: 1.0, end: 0.5).animate(_animationController),
    ];
    _animationController.forward();
    screenSnapshot = screens.values.toList();
  }

  Map<int, Widget> screens = {
    0: Container(
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(
            40.0,
          )),
    ),
    1: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            40.0,
          )),
    ),
    2: Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(
            40.0,
          )),
    ),
  };
  List<Widget> screenSnapshot;

  List<Widget> finalStack() {
    List<Widget> stackToReturn = [];
    stackToReturn.add(MenuScreen(
      menuCallback: (selectedIndex) {
        setState(() {
          screenSnapshot = screens.values.toList();
          final selectedWidget = screenSnapshot.removeAt(selectedIndex);
          screenSnapshot.insert(0, selectedWidget);
        });
      },
    ));

    screenSnapshot
        .asMap()
        .entries
        .map((screenEntry) => buildScreenStack(screenEntry.key))
        .toList()
        .reversed
      ..forEach((screen) {
        stackToReturn.add(screen);
      });

    return stackToReturn;
  }

  Widget buildScreenStack(int position) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: menuOpen ? deviceWidth * 0.55 - (position * 50) : 0.0,
      right: menuOpen ? deviceWidth * -0.45 + (position * 50) : 0.0,
      child: ScaleTransition(
        scale: scaleAnimations[position],
        child: GestureDetector(
          onTap: () {
            if (menuOpen) {
              setState(() {
                menuOpen = false;
                _animationController.reverse();
              });
            }
          },
          child: AbsorbPointer(
            absorbing: menuOpen,
            child: Stack(
              children: <Widget>[
                Material(
                  animationDuration: duration,
                  borderRadius: BorderRadius.circular(menuOpen ? 40.0 : 0.0),
                  child: screenSnapshot[position],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: finalStack(),
    );
  }
}
