import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/screens/new_event/bloc/new_event_bloc.dart';

import 'package:senpai/screens/profile_fill/photos/upload_photos/gallery/bloc/upload_photos_bloc.dart';
import 'package:senpai/screens/profile_fill/photos/upload_photos/gallery/pages/gallery_albums_page.dart';
import 'package:senpai/screens/profile_fill/photos/upload_photos/gallery/pages/gallery_photos_page.dart';
import 'package:senpai/screens/profile_fill/photos/upload_photos/widgets/photos_manager_content.dart';

import 'package:senpai/utils/constants.dart';

class NewEventPhotoManagerContent extends StatelessWidget {
  const NewEventPhotoManagerContent({super.key});

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
                child: _buildProfileFillContent(context),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProfileFillContent(BuildContext context) {
    final bloc = BlocProvider.of<UploadPhotosBloc>(context);
    return BlocBuilder<NewEventBloc, NewEventState>(
      builder: (context, state) {
        if (bloc.step == PhotoManagerStep.galleryAlbums) {
          return const GalleryAlbumsPage();
        } else if (bloc.step == PhotoManagerStep.galleryPhotos) {
          return GalleryPhotosPage(onSelectPhotos: (photos) async {
            final blocPhotos = BlocProvider.of<NewEventBloc>(context);
            await bloc.selectedAssetsList.first.file.then((photo) {
              if (photo != null) {
                blocPhotos.add(OnChangeImageEvent(photo));
              }
              context.router.pop();
            });
            ;
          });
        } else {
          return PhotosManagerContent(onSelectPhoto: (photo) {
            final blocPhotos = BlocProvider.of<NewEventBloc>(context);
            blocPhotos.add(OnChangeImageEvent(photo));
            context.router.pop();
          });
        }
      },
    );
  }
}
