
import 'dart:math' as math; // import this
import 'package:flutter/material.dart';
import '../class/CustomChatShape.dart';

final Color DEFAULT_COLOR = Colors.grey.shade300;

class ReceivedMessage extends StatelessWidget {
  final String? message;
  const ReceivedMessage({
    Key? key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: CustomPaint(
                painter: CustomShape(DEFAULT_COLOR),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: DEFAULT_COLOR,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Text(
                  message!,
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
          ],
        ));

    return Padding(
      padding: EdgeInsets.only(right: 50.0, left: 18, top: 10, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 30),
          messageTextGroup,
        ],
      ),
    );
  }
}