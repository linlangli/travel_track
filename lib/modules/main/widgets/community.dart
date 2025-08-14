import 'package:flutter/widgets.dart';

class CommunityWidget extends StatelessWidget{
  const CommunityWidget({super.key});

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