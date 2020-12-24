import 'package:flutter/material.dart';

class CustomAnimatedSwitch extends StatefulWidget {
  const CustomAnimatedSwitch({Key key}) : super(key: key);

  @override
  _CustomAnimatedSwitchState createState() => _CustomAnimatedSwitchState();
}

class _CustomAnimatedSwitchState extends State<CustomAnimatedSwitch> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: SizedBox(
        height: 100,
        width: 200,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: isChecked ? Colors.green : Colors.red,
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 30,
                    color: isChecked ? Colors.green : Colors.transparent,
                  ),
                ],
                color: Colors.white,
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.bounceOut,
              left: isChecked ? 116 : 24,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: isChecked ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) => ScaleTransition(
                    child: child,
                    scale: animation,
                  ),
                  child: isChecked
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 32,
                          key: UniqueKey(),
                        )
                      : Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 32,
                          key: UniqueKey(),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
