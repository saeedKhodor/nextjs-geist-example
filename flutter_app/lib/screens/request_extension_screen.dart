import 'package:flutter/material.dart';

class RequestExtensionScreen extends StatefulWidget {
  @override
  _RequestExtensionScreenState createState() => _RequestExtensionScreenState();
}

class _RequestExtensionScreenState extends State<RequestExtensionScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _newEndDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Extension'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Booking Extension',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text(_newEndDate == null
                    ? 'Select new end date'
                    : 'New end date: ${_newEndDate!.toLocal()}'.split(' ')[0]),
                trailing: Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _newEndDate ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 30)),
                  );
                  if (picked != null && picked != _newEndDate) {
                    setState(() {
                      _newEndDate = picked;
                    });
                  }
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_newEndDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a new end date')),
                    );
                    return;
                  }
                  // Handle extension request logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Extension Requested')),
                  );
                },
                child: Text('Request Extension'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
