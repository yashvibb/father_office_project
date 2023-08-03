import 'dart:io';
import 'package:father_office_project/choose_option_card.dart';
import 'package:father_office_project/choose_photo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ChooseOptionsBottomSheet extends StatelessWidget {
  const ChooseOptionsBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose Option",
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 25),
            child: Divider(
              color:Color(0xffB5C0FF),
              thickness: 1,
            ),
          ),


          ChooseOptionCard(
            assetPath: "assets/Images/gallery.jpg",
            title: "Gallery",
            onTap: () async{
              File? file =   await gallery();
              Navigator.pop(context,file);
            },
          ),
          const SizedBox(height: 10),
          ChooseOptionCard(
            assetPath: "assets/Images/camera.jpg",
            title: "Camera",
            onTap: () async{
              File? file =   await   gallery(
                imageSource: ImageSource.camera,
              );
              Navigator.pop(context,file);
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}