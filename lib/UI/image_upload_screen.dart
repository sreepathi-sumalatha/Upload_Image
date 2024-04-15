import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _imageFile;
  bool _imageUploaded = false;
  bool _showImage = false;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        _imageUploaded = true;
        _showImage = false; // Reset showImage when a new image is uploaded
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Upload Image',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                if (_imageUploaded) {
                  setState(() {
                    _showImage = !_showImage;
                  });
                }
              },
              child: Container(
                width: 250,
                height: 380,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: _imageUploaded
                    ? _showImage
                        ? Image.file(
                            _imageFile!,
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          )
                       
                    :const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Image Uploaded',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ):  const Icon(
                            Icons.image,
                            size: 100,
                            color: Colors.grey,
                          )
              ),

              // child: _imageUploaded
              //    ? _showImage

              //       ? const Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Icon(
              //               Icons.check_circle,
              //               color: Colors.green,
              //               size: 100,
              //             ),
              //             SizedBox(height: 10),
              //             Text(
              //               'Image Uploaded',
              //               textAlign: TextAlign.center,
              //               style: TextStyle(
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //           ],
              //         )
              //       : const Icon(
              //           Icons.image,
              //           size: 100,
              //           color: Colors.grey,
              //         ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                  onPressed: getImage,
                  child: Text('Upload'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_imageUploaded) {
                      setState(() {
                        _showImage = !_showImage;
                      });
                    }
                  },
                  child: Text('View'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
