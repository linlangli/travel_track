import 'package:flutter/cupertino.dart';

class TravelInfoWidget extends StatelessWidget{
  const TravelInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Travel Info Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}