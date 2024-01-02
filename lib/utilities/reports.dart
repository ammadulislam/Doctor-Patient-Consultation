import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {

  String _selectedFileName = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 755,
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/signupbackground.png'),
          fit: BoxFit.cover),),
      child:  Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.purple.shade300,
            title: Text('Patient', style: TextStyle(fontFamily: 'fontMAIN',)),

          ),
      body: Padding(padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(height:11 ,),
            Center(
              child: Text(
                'Upload Report',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                    fontFamily: 'fontMAIN'
                ),
              ),
            ),
            SizedBox(height: 150),
            ElevatedButton(
              onPressed: () async {
                final filePickerResult = await FilePicker.platform.pickFiles();
                if (filePickerResult != null) {
                  setState(() {
                    _selectedFileName = filePickerResult.files.single.name;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple.shade300, // Change the color to red
              ),
              child: Text('Choose File',style: TextStyle( fontFamily: 'fontMAIN',),),
            ),
            SizedBox(height: 16),
            Text(
              _selectedFileName.isNotEmpty ? 'Selected file: $_selectedFileName' : '',
            ),
            SizedBox(height: 16),
            ElevatedButton(

              onPressed: () {
                },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple.shade300, // Change the color to red
              ),
              child: Text('Upload Report',style: TextStyle( fontFamily: 'fontMAIN'),),
            ),

          ],
        ),
      ) )
    );
  }
}
