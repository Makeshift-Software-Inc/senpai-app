import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senpai/core/widgets/loading.dart';
import 'package:senpai/screens/new_event/bloc/new_event_bloc.dart';
import 'package:senpai/screens/new_event/new_event_image/widgets/gallery_photos_content.dart';
import 'package:senpai/screens/profile_fill/photos/upload_photos/gallery/bloc/upload_photos_bloc.dart';

import 'package:senpai/utils/constants.dart';

@RoutePage()
class NewEventPhotoManagerPage extends StatelessWidget {
  final NewEventBloc bloc;

  const NewEventPhotoManagerPage({
    super.key,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: bloc),
        BlocProvider<UploadPhotosBloc>(
          create: (context) => UploadPhotosBloc()
            ..add(OnInitAssetsListLengthEvent(
              count: 5,
            )),
        ),
      ],
      child: Scaffold(
        backgroundColor: $constants.palette.darkBlue,
        body: Stack(
          children: [
            const NewEventPhotoManagerContent(),
            _buildGalleryLoadingListeners()
          ],
        ),
      ),
    );
  }

  Widget _buildGalleryLoadingListeners() {
    return BlocBuilder<UploadPhotosBloc, UploadPhotosState>(
      builder: (context, state) {
        return state is LoadingUploadPhotosState
            ? const SenpaiLoading()
            : const SizedBox.shrink();
      },
    );
  }
}
