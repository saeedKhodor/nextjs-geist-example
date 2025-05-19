import 'package:flutter/material.dart';

class BookSpotScreen extends StatefulWidget {
  @override
  _BookSpotScreenState createState() => _BookSpotScreenState();
}

class _BookSpotScreenState extends State<BookSpotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book a Spot'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  'Map Placeholder\n(Implement with flutter_map or Google Maps)',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Booking Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text('Location: Dubai Mall'),
                  SizedBox(height: 8),
                  Text('Date: 25 September 2024'),
                  SizedBox(height: 8),
                  Text('Time: 10:00 AM - 12:00 PM'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Confirm booking logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Booking Confirmed')),
                      );
                    },
                    child: Text('Confirm Booking'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
