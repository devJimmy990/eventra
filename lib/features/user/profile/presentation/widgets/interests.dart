 import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InterestsWidget extends StatefulWidget {
  @override
  _InterestsWidgetState createState() => _InterestsWidgetState();
}

class _InterestsWidgetState extends State<InterestsWidget> {
  List<String> interests = [];
  List<Color> interestColors = [];
  final int maxInterests = 10;
  final String _interestsKey = 'user_interests';

  @override
  void initState() {
    super.initState();
    _loadInterests();
  }

  Future<void> _loadInterests() async {
    final prefs = await SharedPreferences.getInstance();
    final savedInterests = prefs.getString(_interestsKey);

    if (savedInterests != null) {
      setState(() {
        interests =
            (jsonDecode(savedInterests) as List<dynamic>).cast<String>();
        interestColors =
            List.generate(interests.length, (index) => _getRandomColor());
      });
    }
  }

  Future<void> _saveInterests() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_interestsKey, jsonEncode(interests));
  }

  Color _getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      220,
      random.nextInt(250),
      random.nextInt(256),
      random.nextInt(250),
    );
  }

  void _addInterest(String interest, BuildContext context) {
    if (interests.length >= maxInterests) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You can only add up to $maxInterests interests.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (interest.isNotEmpty && !interests.contains(interest)) {
      setState(() {
        interests.add(interest);
        interestColors.add(_getRandomColor());
      });
      _saveInterests(); 
    }
  }

  void _removeInterest(int index) {
    setState(() {
      interests.removeAt(index);
      interestColors.removeAt(index);
    });
    _saveInterests();
  }

  void _showAddInterestDialog(BuildContext context) {
    TextEditingController _textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Add New Interest',
            style: TextStyle(color: Colors.black),
          ),
          content: TextField(
            maxLines: 1,
            cursorColor: Colors.deepPurpleAccent,
            style: TextStyle(color: Colors.black),
            controller: _textController,
            decoration: InputDecoration(
                hintText: 'Enter new interest',
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurpleAccent),
                )),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.deepPurpleAccent),
              ),
            ),
            TextButton(
              onPressed: () {
                _addInterest(_textController.text, context);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.deepPurpleAccent),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Interest',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                icon: Icon(
                  Icons.add,
                  color: Colors.deepPurpleAccent,
                ),
                onPressed: () => _showAddInterestDialog(context),
                label: Text(
                  'Change',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: List.generate(interests.length, (index) {
              return Chip(
                label: Text(
                  interests[index],
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: interestColors[index],
                onDeleted: () => _removeInterest(index),
              );
            }),
          ),
        ],
      ),
    );
  }
}
