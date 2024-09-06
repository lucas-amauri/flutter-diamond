
import 'package:flutter/material.dart';
import '../class/custom_chat_shape.dart';

final Color DEFAULT_COLOR = Colors.cyan.shade900;

class SentMessage extends StatelessWidget {
  final String? message;
  const SentMessage({
    Key? key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageTextGroup = Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: DEFAULT_COLOR,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18),
                  ),
                ),
                child: Text(
                  message!,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            CustomPaint(
              painter: CustomShape(DEFAULT_COLOR)
            ),
          ],
        ));

    return Padding(
      padding: EdgeInsets.only(right: 18.0, left: 50, top: 15, bottom: 5),
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