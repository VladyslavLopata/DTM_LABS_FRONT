import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MatrixInput extends StatelessWidget {
  final void Function(String) onInputChanged;
  final String columnHeader;
  final String rowHeader;

  const MatrixInput({
    Key key,
    @required this.onInputChanged,
    @required this.columnHeader,
    @required this.rowHeader,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              columnHeader,
              style: TextStyle(fontSize: 30),
            ),
            Icon(Icons.arrow_right)
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 220.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  rowHeader,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Icon(Icons.arrow_downward),
              SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                width: 300,
                child: TextField(
                  minLines: 1,
                  maxLines: 10,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9 \n]'))
                  ],
                  onChanged: onInputChanged,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
