import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/l10n/resources.dart';

import 'package:senpai/screens/profile_fill/photos/upload_photos/gallery/bloc/upload_photos_bloc.dart';
import 'package:senpai/screens/profile_fill/photos/upload_photos/widgets/photos_button.dart';
import 'package:image_picker/image_picker.dart';

import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/helpers/snack_bar_helpers.dart';
import 'package:senpai/utils/methods/utils.dart';

class PhotosManagerContent extends StatelessWidget {
  final ValueChanged<File> onSelectPhoto;
  const PhotosManagerContent({
    super.key,
    required this.onSelectPhoto,
  });

  _pickImagefromGallery(BuildContext context) async {
    final bloc = BlocProvider.of<UploadPhotosBloc>(context);
    bloc.add(OnChangePhotoManagerStepEvent(
      step: PhotoManagerStep.galleryAlbums,
    ));
  }

  _pickImageFromCamera(BuildContext context) async {
    try {
      await ImagePicker()
          .pickImage(source: ImageSource.camera)
          .then((pickedImage) {
        if (pickedImage != null) {
          onSelectPhoto(File(pickedImage.path));
        }
      });
    } catch (e) {
      showSnackBarError(context, R.strings.cameraError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._buildHeader(context),
            SizedBox(
              height: $constants.insets.xl,
            ),
            PhotosButton(
              onPressed: () => _pickImagefromGallery(context),
              title: R.strings.uploadText,
              text: R.strings.yourPhotosText,
            ),
            SizedBox(
              height: $constants.insets.sm,
            ),
            PhotosButton(
              onPressed: () => _pickImageFromCamera(context),
              title: R.strings.openText,
              text: R.strings.cameraText,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildHeader(BuildContext context) {
    return [
      SizedBox(
        height: $constants.insets.xl,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () => context.router.pop(),
          child: Text(
            R.strings.cancelText,
            style: getTextTheme(context).titleSmall,
          ),
        ),
      ),
      SizedBox(
        height: $constants.insets.lg,
      ),
      Text(
        R.strings.choosePhotosText,
        style: getTextTheme(context).headlineLarge?.copyWith(),
        textAlign: TextAlign.left,
      ),
    ];
  }
}
