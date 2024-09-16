import 'package:dartz/dartz.dart';
import 'package:senpai/core/profile_fill/api/spotify/spotify_profile_info_api.dart';
import 'package:senpai/domain/profile_fill/spotify/spotify_failure.dart';

import 'package:senpai/domain/profile_fill/spotify/spotify_fetch_user_info_usecase.dart';
import 'package:senpai/models/profile_fill/spotify/spotify_artist/spotify_artist_model.dart';
import 'package:senpai/models/profile_fill/spotify/spotify_track/spotify_track_model.dart';
import 'package:senpai/models/spotify_auth/spotify_auth_model.dart';

class SpotifyFetchUserInfoRepository implements SpotifyFetchUserInfoUseCase {
  final SpotifyFetchUserInfoApi api;

  SpotifyFetchUserInfoRepository(this.api);

  @override
  Future<Either<SpotifyFailure, List<SpotifyArtistModel>>> getTopArtists(
      SpotifyAuthModel? spotifyAuthModel) async {
    try {
      final artists = await api.getTopArtists(spotifyAuthModel);
      return right(artists);
    } catch (e) {
      return left(
        const ServerError(),
      );
    }
  }

  @override
  Future<Either<SpotifyFailure, List<SpotifyTrackModel>>> getTopTracks() async {
    try {
      final tracks = await api.getTopTracks();
      return right(tracks);
    } catch (e) {
      return left(
        const ServerError(),
      );
    }
  }
}
