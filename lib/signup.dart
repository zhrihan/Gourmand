import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'Profile.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _collegeMailController = TextEditingController();
  final TextEditingController _aboutMeController = TextEditingController();
  final TextEditingController _languagesController = TextEditingController();
  final TextEditingController _cuisinesController = TextEditingController();
  final TextEditingController _eatOutFrequencyController = TextEditingController();

  // Variables for dropdown and file picker
  String? _selectedSchool;
  String? _selectedFilePath;
  final List<String> _schools = [
    'Harvard University',
    'Stanford University',
    'Massachusetts Institute of Technology',
    'University of California, Berkeley',
    // Add more schools as needed
  ];

  // Method to simulate file picking
  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFilePath = result.files.single.path;
      });
    } else {
      // User canceled the picker
      print("No file selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _collegeMailController,
              decoration: InputDecoration(labelText: 'College Mail'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'School',
              ),
              value: _selectedSchool,
              items: _schools.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSchool = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _pickFile,
              child: Text(_selectedFilePath != null ? 'Change College ID' : 'Upload College ID'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => CreatingProfilePage()),);
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _collegeMailController.dispose();
    _aboutMeController.dispose();
    _languagesController.dispose();
    _cuisinesController.dispose();
    _eatOutFrequencyController.dispose();
    super.dispose();
  }
}
