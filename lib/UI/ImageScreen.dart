import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageScreen extends StatelessWidget {
  final int id;
  final String image;
  final String name;

  const ImageScreen({
    Key key,
    @required this.id,
    @required this.image,
    @required this.name,
  }) : super(key: key);

  _save() async {
    if (await Permission.storage.request().isGranted) {
      var response = await Dio()
          .get(image, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 60,
          name: name);
      print(result);
      _toastInfo("You have successfully added to your gallery.");
    }
  }

  _toastInfo(String info) {
    Fluttertoast.showToast(
        msg: info,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                _save();
              },
              child: Icon(
                Icons.save,
                size: 26.0,
              ),
            ),
          ),
        ],
        title: Text(name),
      ),
      body: Hero(
        tag: id,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
