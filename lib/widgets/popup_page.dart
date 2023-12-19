import 'package:flutter/material.dart';

class PopupPage extends StatefulWidget {
  final String imagePath;

  const PopupPage({
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  _PopupPageState createState() => _PopupPageState();
}

class _PopupPageState extends State<PopupPage> {
  bool _showPopup = true;

  @override
  void initState() {
    super.initState();
    _showPopupOnceDaily();
  }

  void _showPopupOnceDaily() async {
    // Check if the popup was already shown today
    // You can use shared preferences or another storage mechanism to track this
    // For demonstration purposes, always showing the popup the first time the app is opened in a day
    await Future.delayed(Duration.zero);
    setState(() {
      _showPopup = true;
    });
  }

  void _closePopup() {
    setState(() {
      _showPopup = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showPopup
        ? Scaffold(
            backgroundColor: Colors.black
                .withOpacity(0.8), // Add a semi-transparent black background
            body: Center(
              child: FractionallySizedBox(
                widthFactor: 0.75, // 75% width of the screen
                heightFactor: 0.75, // 75% height of the screen
                child: Stack(
                  children: [
                    // Background Image (Popup Image)
                    Image.asset(
                      widget.imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                    // Close button (X) in top right corner
                    Positioned(
                      top: 20,
                      right: 20,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          _closePopup(); // Close the popup
                          Navigator.pop(context); // Go back to previous screen
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Container(); // Empty container if _showPopup is false
  }
}
