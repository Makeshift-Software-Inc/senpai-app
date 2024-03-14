import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/screens/profile_fill/photos/bloc/photos_bloc.dart';

import 'package:senpai/screens/profile_fill/photos/upload_photos/gallery/bloc/upload_photos_bloc.dart';
import 'package:senpai/screens/profile_fill/photos/upload_photos/gallery/pages/gallery_albums_page.dart';
import 'package:senpai/screens/profile_fill/photos/upload_photos/gallery/pages/gallery_photos_page.dart';

import 'package:senpai/utils/constants.dart';

import 'photos_manager_content.dart';

class UploadPhotosManagerContent extends StatelessWidget {
  const UploadPhotosManagerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadPhotosBloc, UploadPhotosState>(
      listenWhen: (_, currState) => currState is ChangeStepSuccessfulState,
      listener: (context, state) {
        final bloc = BlocProvider.of<UploadPhotosBloc>(context);
        if (bloc.step == PhotoManagerStep.galleryAlbums &&
            bloc.albumList.isEmpty) {
          bloc.add(OnFetchAlbumsListEvent());
        }
        if (bloc.step == PhotoManagerStep.galleryPhotos) {}
      },
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              SizedBox(height: $constants.insets.sm),
              Expanded(
                child: _buildProfileFillContent(
                  context,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileFillContent(BuildContext context) {
    final bloc = BlocProvider.of<UploadPhotosBloc>(context);
    return BlocBuilder<PhotosBloc, PhotosState>(
      builder: (context, state) {
        if (bloc.step == PhotoManagerStep.galleryAlbums) {
          return const GalleryAlbumsPage();
        } else if (bloc.step == PhotoManagerStep.galleryPhotos) {
          return GalleryPhotosPage(onSelectPhotos: (photos) {
            final blocPhotos = BlocProvider.of<PhotosBloc>(context);
            blocPhotos
                .add(OnUploadPhotosEvent(photos: bloc.selectedAssetsList));
            context.router.pop();
          });
        } else {
          return PhotosManagerContent(onSelectPhoto: (photo) {
            final blocPhotos = BlocProvider.of<PhotosBloc>(context);
            blocPhotos.add(OnChangedPhotoByCameraEvent(photo: photo));
            context.router.pop();
          });
        }
      },
    );
  }
}
