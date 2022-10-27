import 'package:flutter/material.dart';

class DiamondRating extends StatefulWidget {
  DiamondRating(
    {
      Key? key, 
      this.rate,
      this.onSelect
    }
  ) : super(key: key);

  final int? rate;
  final Function(int index)? onSelect;

  @override
  _DiamondRatingState createState() => _DiamondRatingState();
}

class _DiamondRatingState extends State<DiamondRating> {
  int? rate;

  @override
  void initState() {
    super.initState();

    if (widget.rate!=null)
    rate = widget.rate;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new FittedBox(
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) => star(index)),
      ),
    );
  }

  Widget star(int index) {
    int _index = index+1;
    return IconButton(
      icon: Icon(
        Icons.star,
        color: rate == null ? Colors.grey[300] : (
          _index <= rate! ? Colors.yellow : Colors.grey[300]
        ),
      ),
      onPressed: () {
        widget.onSelect!.call(_index);

        setState(() {
          rate = _index;
        });
      },
    );
  }
}