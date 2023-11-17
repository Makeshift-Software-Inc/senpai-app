import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/data/text_constants.dart';

import 'package:senpai/screens/profile_fill/photos/bloc/photos_bloc.dart';
import 'package:senpai/screens/profile_fill/photos/upload_photos/gallery/bloc/upload_photos_bloc.dart';
import 'package:senpai/screens/profile_fill/photos/upload_photos/widgets/photos_button.dart';
import 'package:image_picker/image_picker.dart';

import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class PhotosManagerContent extends StatelessWidget {
  const PhotosManagerContent({super.key});

  _pickImagefromGallery(BuildContext context) async {
    final bloc = BlocProvider.of<UploadPhotosBloc>(context);
    bloc.add(OnChangePhotoManagerStepEvent(
      step: PhotoManagerStep.galleryAlbums,
    ));
  }

  _pickImagefromCamera(BuildContext context) async {
    final bloc = BlocProvider.of<PhotosBloc>(context);
    try {
      await ImagePicker()
          .pickImage(source: ImageSource.camera)
          .then((pickedImage) {
        if (pickedImage != null) {
          bloc.add(OnChangedPhotoByCameraEvent(photo: File(pickedImage.path)));
          context.router.pop();
        }
      });
    } catch (e) {
      _showSnackBarError(context, TextConstants.cameraError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosBloc, PhotosState>(
      builder: (context, state) {
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
                  title: TextConstants.uploadText,
                  text: TextConstants.yourPhotosText,
                ),
                SizedBox(
                  height: $constants.insets.sm,
                ),
                PhotosButton(
                  onPressed: () => _pickImagefromCamera(context),
                  title: TextConstants.openText,
                  text: TextConstants.cameraText,
                ),
              ],
            ),
          ),
        );
      },
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
            TextConstants.cancelText,
            style: getTextTheme(context).titleSmall,
          ),
        ),
      ),
      SizedBox(
        height: $constants.insets.lg,
      ),
      Text(
        TextConstants.choosePhotosText,
        style: getTextTheme(context).headlineLarge?.copyWith(),
        textAlign: TextAlign.left,
      ),
    ];
  }

  _showSnackBarError(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'On Snap!',
                message: message,
                contentType: ContentType.failure,
              ),
            ),
          );
      },
    );
  }
}
