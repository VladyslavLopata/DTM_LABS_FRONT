import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final void Function() onSubmit;
  const SubmitButton({
    Key key,
    @required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        onPressed: onSubmit,
        child: Text('Розрахувати'),
      ),
    );
  }
}
