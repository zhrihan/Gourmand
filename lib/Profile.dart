import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class CreatingProfilePage extends StatefulWidget {
  @override
  _CreatingProfilePageState createState() => _CreatingProfilePageState();
}

class _CreatingProfilePageState extends State<CreatingProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _aboutMeController = TextEditingController();
  final TextEditingController _favoriteCuisineController = TextEditingController();
  final TextEditingController _dietaryRestrictionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  String? _frequencyOfDiningOut;
  String? _selectedFilePath; // For the uploaded picture

  // Method to simulate file picking for uploading pictures
  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      setState(() {
        _selectedFilePath = result.files.single.path; // Assuming one picture for simplicity
      });
    } else {
      print("No image selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dropdownItems = List.generate(10, (index) => DropdownMenuItem(
      value: (index + 1).toString(),
      child: Text((index + 1).toString()),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Creating Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Upload Picture'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _aboutMeController,
              decoration: InputDecoration(labelText: 'About Me'),
              maxLines: 3,
            ),
            TextField(
              controller: _favoriteCuisineController,
              decoration: InputDecoration(labelText: 'Favorite Cuisine'),
            ),
            TextField(
              controller: _dietaryRestrictionController,
              decoration: InputDecoration(labelText: 'Dietary Restriction'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(labelText: 'Frequency of Dining Out'),
              value: _frequencyOfDiningOut,
              items: dropdownItems,
              onChanged: (String? newValue) {
                setState(() {
                  _frequencyOfDiningOut = newValue;
                });
              },
            ),
            // Add a button or other logic to submit the profile data
          ],
        ),
      ),
    );
  }
}
