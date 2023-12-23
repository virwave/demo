import 'package:flutter/material.dart';

class DurationSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Duration'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListWheelScrollView(
              itemExtent: 50.0,
              diameterRatio: 2.0,
              onSelectedItemChanged: (int index) {
                // Handle selected duration change
              },
              children: _buildDurationItems(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _selectDuration(context);
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }

  void _selectDuration(BuildContext context) {
    // Replace this logic with selecting the duration and passing it back
    final selectedDuration = Duration(seconds: 30);
    Navigator.pop(context, selectedDuration);
  }

  List<Widget> _buildDurationItems() {
    return [
      Text('30 Seconds'),
      Text('1 Minute'),
      Text('2 Minutes'),
      Text('3 Minutes'),
      Text('4 Minutes'),
      Text('5 Minutes'),
      Text('6 Minutes'),
      Text('7 Minutes'),
      Text('8 Minutes'),
    ];
  }

  String _formatDuration(Duration duration) {
    if (duration.inMinutes > 0) {
      return '${duration.inMinutes} Minutes';
    } else {
      return '${duration.inSeconds} Seconds';
    }
  }
}
