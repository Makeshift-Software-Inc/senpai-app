// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:senpai/core/graphql/scalars/datetime_scalar.dart';
import 'package:http/http.dart';
import 'package:senpai/core/graphql/scalars/upload_scalar.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class DeleteFavoriteAnime$Mutation$DeleteFavoriteAnime extends JsonSerializable
    with EquatableMixin {
  DeleteFavoriteAnime$Mutation$DeleteFavoriteAnime();

  factory DeleteFavoriteAnime$Mutation$DeleteFavoriteAnime.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteFavoriteAnime$Mutation$DeleteFavoriteAnimeFromJson(json);

  late bool deleted;

  @override
  List<Object?> get props => [deleted];
  @override
  Map<String, dynamic> toJson() =>
      _$DeleteFavoriteAnime$Mutation$DeleteFavoriteAnimeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteFavoriteAnime$Mutation extends JsonSerializable
    with EquatableMixin {
  DeleteFavoriteAnime$Mutation();

  factory DeleteFavoriteAnime$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteFavoriteAnime$MutationFromJson(json);

  DeleteFavoriteAnime$Mutation$DeleteFavoriteAnime? deleteFavoriteAnime;

  @override
  List<Object?> get props => [deleteFavoriteAnime];
  @override
  Map<String, dynamic> toJson() => _$DeleteFavoriteAnime$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteFavoriteAnimeInput extends JsonSerializable with EquatableMixin {
  DeleteFavoriteAnimeInput({
    required this.animeIds,
    this.clientMutationId,
    required this.userId,
  });

  factory DeleteFavoriteAnimeInput.fromJson(Map<String, dynamic> json) =>
      _$DeleteFavoriteAnimeInputFromJson(json);

  late List<String> animeIds;

  String? clientMutationId;

  late String userId;

  @override
  List<Object?> get props => [animeIds, clientMutationId, userId];
  @override
  Map<String, dynamic> toJson() => _$DeleteFavoriteAnimeInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateUser$Mutation$CreateUser$User extends JsonSerializable
    with EquatableMixin {
  CreateUser$Mutation$CreateUser$User();

  factory CreateUser$Mutation$CreateUser$User.fromJson(
          Map<String, dynamic> json) =>
      _$CreateUser$Mutation$CreateUser$UserFromJson(json);

  late String id;

  late String phone;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeToDartDateTime,
      toJson: fromDartDateTimeToGraphQLISO8601DateTime)
  late DateTime createdAt;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeToDartDateTime,
      toJson: fromDartDateTimeToGraphQLISO8601DateTime)
  late DateTime updatedAt;

  @override
  List<Object?> get props => [id, phone, createdAt, updatedAt];
  @override
  Map<String, dynamic> toJson() =>
      _$CreateUser$Mutation$CreateUser$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateUser$Mutation$CreateUser extends JsonSerializable
    with EquatableMixin {
  CreateUser$Mutation$CreateUser();

  factory CreateUser$Mutation$CreateUser.fromJson(Map<String, dynamic> json) =>
      _$CreateUser$Mutation$CreateUserFromJson(json);

  late CreateUser$Mutation$CreateUser$User user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$CreateUser$Mutation$CreateUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateUser$Mutation extends JsonSerializable with EquatableMixin {
  CreateUser$Mutation();

  factory CreateUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateUser$MutationFromJson(json);

  CreateUser$Mutation$CreateUser? createUser;

  @override
  List<Object?> get props => [createUser];
  @override
  Map<String, dynamic> toJson() => _$CreateUser$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateUserInput extends JsonSerializable with EquatableMixin {
  CreateUserInput({
    this.clientMutationId,
    required this.params,
  });

  factory CreateUserInput.fromJson(Map<String, dynamic> json) =>
      _$CreateUserInputFromJson(json);

  String? clientMutationId;

  late UserInput params;

  @override
  List<Object?> get props => [clientMutationId, params];
  @override
  Map<String, dynamic> toJson() => _$CreateUserInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserInput extends JsonSerializable with EquatableMixin {
  UserInput({required this.phone});

  factory UserInput.fromJson(Map<String, dynamic> json) =>
      _$UserInputFromJson(json);

  late String phone;

  @override
  List<Object?> get props => [phone];
  @override
  Map<String, dynamic> toJson() => _$UserInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmitVerifyRequest$Mutation$SubmitVerifyRequest$User
    extends JsonSerializable with EquatableMixin {
  SubmitVerifyRequest$Mutation$SubmitVerifyRequest$User();

  factory SubmitVerifyRequest$Mutation$SubmitVerifyRequest$User.fromJson(
          Map<String, dynamic> json) =>
      _$SubmitVerifyRequest$Mutation$SubmitVerifyRequest$UserFromJson(json);

  late String id;

  late String phone;

  @override
  List<Object?> get props => [id, phone];
  @override
  Map<String, dynamic> toJson() =>
      _$SubmitVerifyRequest$Mutation$SubmitVerifyRequest$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmitVerifyRequest$Mutation$SubmitVerifyRequest extends JsonSerializable
    with EquatableMixin {
  SubmitVerifyRequest$Mutation$SubmitVerifyRequest();

  factory SubmitVerifyRequest$Mutation$SubmitVerifyRequest.fromJson(
          Map<String, dynamic> json) =>
      _$SubmitVerifyRequest$Mutation$SubmitVerifyRequestFromJson(json);

  late SubmitVerifyRequest$Mutation$SubmitVerifyRequest$User user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() =>
      _$SubmitVerifyRequest$Mutation$SubmitVerifyRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmitVerifyRequest$Mutation extends JsonSerializable
    with EquatableMixin {
  SubmitVerifyRequest$Mutation();

  factory SubmitVerifyRequest$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SubmitVerifyRequest$MutationFromJson(json);

  SubmitVerifyRequest$Mutation$SubmitVerifyRequest? submitVerifyRequest;

  @override
  List<Object?> get props => [submitVerifyRequest];
  @override
  Map<String, dynamic> toJson() => _$SubmitVerifyRequest$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmitVerifyRequestInput extends JsonSerializable with EquatableMixin {
  SubmitVerifyRequestInput({
    this.clientMutationId,
    required this.params,
  });

  factory SubmitVerifyRequestInput.fromJson(Map<String, dynamic> json) =>
      _$SubmitVerifyRequestInputFromJson(json);

  String? clientMutationId;

  late VerifyRequestInput params;

  @override
  List<Object?> get props => [clientMutationId, params];
  @override
  Map<String, dynamic> toJson() => _$SubmitVerifyRequestInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VerifyRequestInput extends JsonSerializable with EquatableMixin {
  VerifyRequestInput({
    required this.image,
    required this.userId,
  });

  factory VerifyRequestInput.fromJson(Map<String, dynamic> json) =>
      _$VerifyRequestInputFromJson(json);

  @JsonKey(
      fromJson: fromGraphQLUploadToDartMultipartFile,
      toJson: fromDartMultipartFileToGraphQLUpload)
  late MultipartFile image;

  late int userId;

  @override
  List<Object?> get props => [image, userId];
  @override
  Map<String, dynamic> toJson() => _$VerifyRequestInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddFavoriteAnime$Mutation$AddFavoriteAnime$User$Animes
    extends JsonSerializable with EquatableMixin {
  AddFavoriteAnime$Mutation$AddFavoriteAnime$User$Animes();

  factory AddFavoriteAnime$Mutation$AddFavoriteAnime$User$Animes.fromJson(
          Map<String, dynamic> json) =>
      _$AddFavoriteAnime$Mutation$AddFavoriteAnime$User$AnimesFromJson(json);

  late String id;

  String? title;

  String? cover;

  @override
  List<Object?> get props => [id, title, cover];
  @override
  Map<String, dynamic> toJson() =>
      _$AddFavoriteAnime$Mutation$AddFavoriteAnime$User$AnimesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddFavoriteAnime$Mutation$AddFavoriteAnime$User extends JsonSerializable
    with EquatableMixin {
  AddFavoriteAnime$Mutation$AddFavoriteAnime$User();

  factory AddFavoriteAnime$Mutation$AddFavoriteAnime$User.fromJson(
          Map<String, dynamic> json) =>
      _$AddFavoriteAnime$Mutation$AddFavoriteAnime$UserFromJson(json);

  List<AddFavoriteAnime$Mutation$AddFavoriteAnime$User$Animes>? animes;

  @override
  List<Object?> get props => [animes];
  @override
  Map<String, dynamic> toJson() =>
      _$AddFavoriteAnime$Mutation$AddFavoriteAnime$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddFavoriteAnime$Mutation$AddFavoriteAnime extends JsonSerializable
    with EquatableMixin {
  AddFavoriteAnime$Mutation$AddFavoriteAnime();

  factory AddFavoriteAnime$Mutation$AddFavoriteAnime.fromJson(
          Map<String, dynamic> json) =>
      _$AddFavoriteAnime$Mutation$AddFavoriteAnimeFromJson(json);

  late AddFavoriteAnime$Mutation$AddFavoriteAnime$User user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() =>
      _$AddFavoriteAnime$Mutation$AddFavoriteAnimeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddFavoriteAnime$Mutation extends JsonSerializable with EquatableMixin {
  AddFavoriteAnime$Mutation();

  factory AddFavoriteAnime$Mutation.fromJson(Map<String, dynamic> json) =>
      _$AddFavoriteAnime$MutationFromJson(json);

  AddFavoriteAnime$Mutation$AddFavoriteAnime? addFavoriteAnime;

  @override
  List<Object?> get props => [addFavoriteAnime];
  @override
  Map<String, dynamic> toJson() => _$AddFavoriteAnime$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddFavoriteAnimeInput extends JsonSerializable with EquatableMixin {
  AddFavoriteAnimeInput({
    required this.animeIds,
    this.clientMutationId,
    required this.userId,
  });

  factory AddFavoriteAnimeInput.fromJson(Map<String, dynamic> json) =>
      _$AddFavoriteAnimeInputFromJson(json);

  late List<String> animeIds;

  String? clientMutationId;

  late String userId;

  @override
  List<Object?> get props => [animeIds, clientMutationId, userId];
  @override
  Map<String, dynamic> toJson() => _$AddFavoriteAnimeInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$Mutation$UpdateUser$User extends JsonSerializable
    with EquatableMixin {
  UpdateUser$Mutation$UpdateUser$User();

  factory UpdateUser$Mutation$UpdateUser$User.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateUser$Mutation$UpdateUser$UserFromJson(json);

  late String id;

  late String phone;

  late String role;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLISO8601DateTimeNullable)
  DateTime? birthday;

  String? bio;

  String? gender;

  String? desiredGender;

  late bool verified;

  String? school;

  String? occupation;

  bool? hasLocationHidden;

  @override
  List<Object?> get props => [
        id,
        phone,
        role,
        birthday,
        bio,
        gender,
        desiredGender,
        verified,
        school,
        occupation,
        hasLocationHidden
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateUser$Mutation$UpdateUser$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$Mutation$UpdateUser extends JsonSerializable
    with EquatableMixin {
  UpdateUser$Mutation$UpdateUser();

  factory UpdateUser$Mutation$UpdateUser.fromJson(Map<String, dynamic> json) =>
      _$UpdateUser$Mutation$UpdateUserFromJson(json);

  late UpdateUser$Mutation$UpdateUser$User user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$UpdateUser$Mutation$UpdateUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUser$Mutation extends JsonSerializable with EquatableMixin {
  UpdateUser$Mutation();

  factory UpdateUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateUser$MutationFromJson(json);

  UpdateUser$Mutation$UpdateUser? updateUser;

  @override
  List<Object?> get props => [updateUser];
  @override
  Map<String, dynamic> toJson() => _$UpdateUser$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateUserInput extends JsonSerializable with EquatableMixin {
  UpdateUserInput({
    this.clientMutationId,
    required this.params,
  });

  factory UpdateUserInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInputFromJson(json);

  String? clientMutationId;

  late UserUpdateInput params;

  @override
  List<Object?> get props => [clientMutationId, params];
  @override
  Map<String, dynamic> toJson() => _$UpdateUserInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserUpdateInput extends JsonSerializable with EquatableMixin {
  UserUpdateInput({
    this.bio,
    this.birthday,
    this.desiredGender,
    this.firstName,
    this.gender,
    this.hasLocationHidden,
    this.occupation,
    this.phone,
    this.school,
    required this.userId,
    this.verified,
  });

  factory UserUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateInputFromJson(json);

  String? bio;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLISO8601DateTimeNullable)
  DateTime? birthday;

  int? desiredGender;

  String? firstName;

  int? gender;

  bool? hasLocationHidden;

  String? occupation;

  String? phone;

  String? school;

  late String userId;

  bool? verified;

  @override
  List<Object?> get props => [
        bio,
        birthday,
        desiredGender,
        firstName,
        gender,
        hasLocationHidden,
        occupation,
        phone,
        school,
        userId,
        verified
      ];
  @override
  Map<String, dynamic> toJson() => _$UserUpdateInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendMessage$Mutation$SendMessage$Message extends JsonSerializable
    with EquatableMixin {
  SendMessage$Mutation$SendMessage$Message();

  factory SendMessage$Mutation$SendMessage$Message.fromJson(
          Map<String, dynamic> json) =>
      _$SendMessage$Mutation$SendMessage$MessageFromJson(json);

  String? content;

  int? senderId;

  String? conversationId;

  String? reaction;

  @override
  List<Object?> get props => [content, senderId, conversationId, reaction];
  @override
  Map<String, dynamic> toJson() =>
      _$SendMessage$Mutation$SendMessage$MessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendMessage$Mutation$SendMessage extends JsonSerializable
    with EquatableMixin {
  SendMessage$Mutation$SendMessage();

  factory SendMessage$Mutation$SendMessage.fromJson(
          Map<String, dynamic> json) =>
      _$SendMessage$Mutation$SendMessageFromJson(json);

  late SendMessage$Mutation$SendMessage$Message message;

  @override
  List<Object?> get props => [message];
  @override
  Map<String, dynamic> toJson() =>
      _$SendMessage$Mutation$SendMessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendMessage$Mutation extends JsonSerializable with EquatableMixin {
  SendMessage$Mutation();

  factory SendMessage$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SendMessage$MutationFromJson(json);

  SendMessage$Mutation$SendMessage? sendMessage;

  @override
  List<Object?> get props => [sendMessage];
  @override
  Map<String, dynamic> toJson() => _$SendMessage$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendMessageInput extends JsonSerializable with EquatableMixin {
  SendMessageInput({
    this.clientMutationId,
    required this.params,
  });

  factory SendMessageInput.fromJson(Map<String, dynamic> json) =>
      _$SendMessageInputFromJson(json);

  String? clientMutationId;

  late MessageInput params;

  @override
  List<Object?> get props => [clientMutationId, params];
  @override
  Map<String, dynamic> toJson() => _$SendMessageInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MessageInput extends JsonSerializable with EquatableMixin {
  MessageInput({
    this.attachment,
    required this.content,
    required this.conversationId,
    this.recommendedAnimeId,
    required this.senderId,
    this.stickerId,
  });

  factory MessageInput.fromJson(Map<String, dynamic> json) =>
      _$MessageInputFromJson(json);

  @JsonKey(
      fromJson: fromGraphQLUploadNullableToDartMultipartFileNullable,
      toJson: fromDartMultipartFileNullableToGraphQLUploadNullable)
  MultipartFile? attachment;

  late String content;

  late String conversationId;

  String? recommendedAnimeId;

  late int senderId;

  String? stickerId;

  @override
  List<Object?> get props => [
        attachment,
        content,
        conversationId,
        recommendedAnimeId,
        senderId,
        stickerId
      ];
  @override
  Map<String, dynamic> toJson() => _$MessageInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeletePhoto$Mutation$DeletePhoto$Gallery$Photos extends JsonSerializable
    with EquatableMixin {
  DeletePhoto$Mutation$DeletePhoto$Gallery$Photos();

  factory DeletePhoto$Mutation$DeletePhoto$Gallery$Photos.fromJson(
          Map<String, dynamic> json) =>
      _$DeletePhoto$Mutation$DeletePhoto$Gallery$PhotosFromJson(json);

  int? order;

  late String url;

  late String id;

  @override
  List<Object?> get props => [order, url, id];
  @override
  Map<String, dynamic> toJson() =>
      _$DeletePhoto$Mutation$DeletePhoto$Gallery$PhotosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeletePhoto$Mutation$DeletePhoto$Gallery extends JsonSerializable
    with EquatableMixin {
  DeletePhoto$Mutation$DeletePhoto$Gallery();

  factory DeletePhoto$Mutation$DeletePhoto$Gallery.fromJson(
          Map<String, dynamic> json) =>
      _$DeletePhoto$Mutation$DeletePhoto$GalleryFromJson(json);

  List<DeletePhoto$Mutation$DeletePhoto$Gallery$Photos>? photos;

  @override
  List<Object?> get props => [photos];
  @override
  Map<String, dynamic> toJson() =>
      _$DeletePhoto$Mutation$DeletePhoto$GalleryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeletePhoto$Mutation$DeletePhoto extends JsonSerializable
    with EquatableMixin {
  DeletePhoto$Mutation$DeletePhoto();

  factory DeletePhoto$Mutation$DeletePhoto.fromJson(
          Map<String, dynamic> json) =>
      _$DeletePhoto$Mutation$DeletePhotoFromJson(json);

  late bool deleted;

  DeletePhoto$Mutation$DeletePhoto$Gallery? gallery;

  @override
  List<Object?> get props => [deleted, gallery];
  @override
  Map<String, dynamic> toJson() =>
      _$DeletePhoto$Mutation$DeletePhotoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeletePhoto$Mutation extends JsonSerializable with EquatableMixin {
  DeletePhoto$Mutation();

  factory DeletePhoto$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeletePhoto$MutationFromJson(json);

  DeletePhoto$Mutation$DeletePhoto? deletePhoto;

  @override
  List<Object?> get props => [deletePhoto];
  @override
  Map<String, dynamic> toJson() => _$DeletePhoto$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeletePhotoInput extends JsonSerializable with EquatableMixin {
  DeletePhotoInput({
    this.clientMutationId,
    required this.photoId,
    required this.userId,
  });

  factory DeletePhotoInput.fromJson(Map<String, dynamic> json) =>
      _$DeletePhotoInputFromJson(json);

  String? clientMutationId;

  late String photoId;

  late String userId;

  @override
  List<Object?> get props => [clientMutationId, photoId, userId];
  @override
  Map<String, dynamic> toJson() => _$DeletePhotoInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateMessage$Mutation$UpdateMessage$Message extends JsonSerializable
    with EquatableMixin {
  UpdateMessage$Mutation$UpdateMessage$Message();

  factory UpdateMessage$Mutation$UpdateMessage$Message.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateMessage$Mutation$UpdateMessage$MessageFromJson(json);

  late String id;

  String? reaction;

  @override
  List<Object?> get props => [id, reaction];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateMessage$Mutation$UpdateMessage$MessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateMessage$Mutation$UpdateMessage extends JsonSerializable
    with EquatableMixin {
  UpdateMessage$Mutation$UpdateMessage();

  factory UpdateMessage$Mutation$UpdateMessage.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateMessage$Mutation$UpdateMessageFromJson(json);

  late UpdateMessage$Mutation$UpdateMessage$Message message;

  @override
  List<Object?> get props => [message];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateMessage$Mutation$UpdateMessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateMessage$Mutation extends JsonSerializable with EquatableMixin {
  UpdateMessage$Mutation();

  factory UpdateMessage$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateMessage$MutationFromJson(json);

  UpdateMessage$Mutation$UpdateMessage? updateMessage;

  @override
  List<Object?> get props => [updateMessage];
  @override
  Map<String, dynamic> toJson() => _$UpdateMessage$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateMessageInput extends JsonSerializable with EquatableMixin {
  UpdateMessageInput({
    this.clientMutationId,
    required this.params,
  });

  factory UpdateMessageInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateMessageInputFromJson(json);

  String? clientMutationId;

  late MessageUpdateInput params;

  @override
  List<Object?> get props => [clientMutationId, params];
  @override
  Map<String, dynamic> toJson() => _$UpdateMessageInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MessageUpdateInput extends JsonSerializable with EquatableMixin {
  MessageUpdateInput({
    this.content,
    required this.messageId,
    this.reaction,
  });

  factory MessageUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$MessageUpdateInputFromJson(json);

  String? content;

  late String messageId;

  String? reaction;

  @override
  List<Object?> get props => [content, messageId, reaction];
  @override
  Map<String, dynamic> toJson() => _$MessageUpdateInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ValidatePhone$Mutation$ValidatePhone$User extends JsonSerializable
    with EquatableMixin {
  ValidatePhone$Mutation$ValidatePhone$User();

  factory ValidatePhone$Mutation$ValidatePhone$User.fromJson(
          Map<String, dynamic> json) =>
      _$ValidatePhone$Mutation$ValidatePhone$UserFromJson(json);

  late String id;

  late String phone;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeToDartDateTime,
      toJson: fromDartDateTimeToGraphQLISO8601DateTime)
  late DateTime createdAt;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeToDartDateTime,
      toJson: fromDartDateTimeToGraphQLISO8601DateTime)
  late DateTime updatedAt;

  @override
  List<Object?> get props => [id, phone, createdAt, updatedAt];
  @override
  Map<String, dynamic> toJson() =>
      _$ValidatePhone$Mutation$ValidatePhone$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ValidatePhone$Mutation$ValidatePhone extends JsonSerializable
    with EquatableMixin {
  ValidatePhone$Mutation$ValidatePhone();

  factory ValidatePhone$Mutation$ValidatePhone.fromJson(
          Map<String, dynamic> json) =>
      _$ValidatePhone$Mutation$ValidatePhoneFromJson(json);

  late ValidatePhone$Mutation$ValidatePhone$User user;

  late String token;

  late bool profileFilled;

  @override
  List<Object?> get props => [user, token, profileFilled];
  @override
  Map<String, dynamic> toJson() =>
      _$ValidatePhone$Mutation$ValidatePhoneToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ValidatePhone$Mutation extends JsonSerializable with EquatableMixin {
  ValidatePhone$Mutation();

  factory ValidatePhone$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ValidatePhone$MutationFromJson(json);

  ValidatePhone$Mutation$ValidatePhone? validatePhone;

  @override
  List<Object?> get props => [validatePhone];
  @override
  Map<String, dynamic> toJson() => _$ValidatePhone$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ValidatePhoneInput extends JsonSerializable with EquatableMixin {
  ValidatePhoneInput({
    this.clientMutationId,
    required this.code,
    required this.userId,
  });

  factory ValidatePhoneInput.fromJson(Map<String, dynamic> json) =>
      _$ValidatePhoneInputFromJson(json);

  String? clientMutationId;

  late int code;

  late String userId;

  @override
  List<Object?> get props => [clientMutationId, code, userId];
  @override
  Map<String, dynamic> toJson() => _$ValidatePhoneInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDistanceBetweenUsers$Mutation$GetDistanceBetweenUsers
    extends JsonSerializable with EquatableMixin {
  GetDistanceBetweenUsers$Mutation$GetDistanceBetweenUsers();

  factory GetDistanceBetweenUsers$Mutation$GetDistanceBetweenUsers.fromJson(
          Map<String, dynamic> json) =>
      _$GetDistanceBetweenUsers$Mutation$GetDistanceBetweenUsersFromJson(json);

  late int mi;

  @override
  List<Object?> get props => [mi];
  @override
  Map<String, dynamic> toJson() =>
      _$GetDistanceBetweenUsers$Mutation$GetDistanceBetweenUsersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDistanceBetweenUsers$Mutation extends JsonSerializable
    with EquatableMixin {
  GetDistanceBetweenUsers$Mutation();

  factory GetDistanceBetweenUsers$Mutation.fromJson(
          Map<String, dynamic> json) =>
      _$GetDistanceBetweenUsers$MutationFromJson(json);

  GetDistanceBetweenUsers$Mutation$GetDistanceBetweenUsers?
      getDistanceBetweenUsers;

  @override
  List<Object?> get props => [getDistanceBetweenUsers];
  @override
  Map<String, dynamic> toJson() =>
      _$GetDistanceBetweenUsers$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDistanceBetweenUsersInput extends JsonSerializable
    with EquatableMixin {
  GetDistanceBetweenUsersInput({
    this.clientMutationId,
    required this.userId,
    required this.vieweeId,
  });

  factory GetDistanceBetweenUsersInput.fromJson(Map<String, dynamic> json) =>
      _$GetDistanceBetweenUsersInputFromJson(json);

  String? clientMutationId;

  late int userId;

  late int vieweeId;

  @override
  List<Object?> get props => [clientMutationId, userId, vieweeId];
  @override
  Map<String, dynamic> toJson() => _$GetDistanceBetweenUsersInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddFavoriteMusic$Mutation$AddFavoriteMusic$User$FavoriteMusic
    extends JsonSerializable with EquatableMixin {
  AddFavoriteMusic$Mutation$AddFavoriteMusic$User$FavoriteMusic();

  factory AddFavoriteMusic$Mutation$AddFavoriteMusic$User$FavoriteMusic.fromJson(
          Map<String, dynamic> json) =>
      _$AddFavoriteMusic$Mutation$AddFavoriteMusic$User$FavoriteMusicFromJson(
          json);

  late String id;

  String? musicType;

  String? trackName;

  String? artistName;

  String? coverUrl;

  String? spotifyId;

  @override
  List<Object?> get props =>
      [id, musicType, trackName, artistName, coverUrl, spotifyId];
  @override
  Map<String, dynamic> toJson() =>
      _$AddFavoriteMusic$Mutation$AddFavoriteMusic$User$FavoriteMusicToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class AddFavoriteMusic$Mutation$AddFavoriteMusic$User extends JsonSerializable
    with EquatableMixin {
  AddFavoriteMusic$Mutation$AddFavoriteMusic$User();

  factory AddFavoriteMusic$Mutation$AddFavoriteMusic$User.fromJson(
          Map<String, dynamic> json) =>
      _$AddFavoriteMusic$Mutation$AddFavoriteMusic$UserFromJson(json);

  late String id;

  List<AddFavoriteMusic$Mutation$AddFavoriteMusic$User$FavoriteMusic>?
      favoriteMusic;

  @override
  List<Object?> get props => [id, favoriteMusic];
  @override
  Map<String, dynamic> toJson() =>
      _$AddFavoriteMusic$Mutation$AddFavoriteMusic$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddFavoriteMusic$Mutation$AddFavoriteMusic extends JsonSerializable
    with EquatableMixin {
  AddFavoriteMusic$Mutation$AddFavoriteMusic();

  factory AddFavoriteMusic$Mutation$AddFavoriteMusic.fromJson(
          Map<String, dynamic> json) =>
      _$AddFavoriteMusic$Mutation$AddFavoriteMusicFromJson(json);

  late AddFavoriteMusic$Mutation$AddFavoriteMusic$User user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() =>
      _$AddFavoriteMusic$Mutation$AddFavoriteMusicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddFavoriteMusic$Mutation extends JsonSerializable with EquatableMixin {
  AddFavoriteMusic$Mutation();

  factory AddFavoriteMusic$Mutation.fromJson(Map<String, dynamic> json) =>
      _$AddFavoriteMusic$MutationFromJson(json);

  AddFavoriteMusic$Mutation$AddFavoriteMusic? addFavoriteMusic;

  @override
  List<Object?> get props => [addFavoriteMusic];
  @override
  Map<String, dynamic> toJson() => _$AddFavoriteMusic$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddFavoriteMusicInput extends JsonSerializable with EquatableMixin {
  AddFavoriteMusicInput({
    this.clientMutationId,
    required this.params,
  });

  factory AddFavoriteMusicInput.fromJson(Map<String, dynamic> json) =>
      _$AddFavoriteMusicInputFromJson(json);

  String? clientMutationId;

  late List<FavoriteMusicInput> params;

  @override
  List<Object?> get props => [clientMutationId, params];
  @override
  Map<String, dynamic> toJson() => _$AddFavoriteMusicInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FavoriteMusicInput extends JsonSerializable with EquatableMixin {
  FavoriteMusicInput({
    this.artistName,
    required this.coverUrl,
    this.hidden,
    required this.musicType,
    required this.spotifyId,
    this.trackName,
    required this.userId,
  });

  factory FavoriteMusicInput.fromJson(Map<String, dynamic> json) =>
      _$FavoriteMusicInputFromJson(json);

  String? artistName;

  late String coverUrl;

  bool? hidden;

  late String musicType;

  late String spotifyId;

  String? trackName;

  late String userId;

  @override
  List<Object?> get props =>
      [artistName, coverUrl, hidden, musicType, spotifyId, trackName, userId];
  @override
  Map<String, dynamic> toJson() => _$FavoriteMusicInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResendVerifyCode$Mutation$ResendVerifyText$User extends JsonSerializable
    with EquatableMixin {
  ResendVerifyCode$Mutation$ResendVerifyText$User();

  factory ResendVerifyCode$Mutation$ResendVerifyText$User.fromJson(
          Map<String, dynamic> json) =>
      _$ResendVerifyCode$Mutation$ResendVerifyText$UserFromJson(json);

  late String id;

  late String phone;

  @override
  List<Object?> get props => [id, phone];
  @override
  Map<String, dynamic> toJson() =>
      _$ResendVerifyCode$Mutation$ResendVerifyText$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResendVerifyCode$Mutation$ResendVerifyText extends JsonSerializable
    with EquatableMixin {
  ResendVerifyCode$Mutation$ResendVerifyText();

  factory ResendVerifyCode$Mutation$ResendVerifyText.fromJson(
          Map<String, dynamic> json) =>
      _$ResendVerifyCode$Mutation$ResendVerifyTextFromJson(json);

  ResendVerifyCode$Mutation$ResendVerifyText$User? user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() =>
      _$ResendVerifyCode$Mutation$ResendVerifyTextToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResendVerifyCode$Mutation extends JsonSerializable with EquatableMixin {
  ResendVerifyCode$Mutation();

  factory ResendVerifyCode$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ResendVerifyCode$MutationFromJson(json);

  ResendVerifyCode$Mutation$ResendVerifyText? resendVerifyText;

  @override
  List<Object?> get props => [resendVerifyText];
  @override
  Map<String, dynamic> toJson() => _$ResendVerifyCode$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResendVerifyTextInput extends JsonSerializable with EquatableMixin {
  ResendVerifyTextInput({
    this.clientMutationId,
    required this.phone,
  });

  factory ResendVerifyTextInput.fromJson(Map<String, dynamic> json) =>
      _$ResendVerifyTextInputFromJson(json);

  String? clientMutationId;

  late String phone;

  @override
  List<Object?> get props => [clientMutationId, phone];
  @override
  Map<String, dynamic> toJson() => _$ResendVerifyTextInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeUser$Mutation$LikeUser$Like extends JsonSerializable
    with EquatableMixin {
  LikeUser$Mutation$LikeUser$Like();

  factory LikeUser$Mutation$LikeUser$Like.fromJson(Map<String, dynamic> json) =>
      _$LikeUser$Mutation$LikeUser$LikeFromJson(json);

  late int userId;

  int? likeeId;

  String? likeType;

  @override
  List<Object?> get props => [userId, likeeId, likeType];
  @override
  Map<String, dynamic> toJson() =>
      _$LikeUser$Mutation$LikeUser$LikeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeUser$Mutation$LikeUser$Match$Conversation extends JsonSerializable
    with EquatableMixin {
  LikeUser$Mutation$LikeUser$Match$Conversation();

  factory LikeUser$Mutation$LikeUser$Match$Conversation.fromJson(
          Map<String, dynamic> json) =>
      _$LikeUser$Mutation$LikeUser$Match$ConversationFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$LikeUser$Mutation$LikeUser$Match$ConversationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeUser$Mutation$LikeUser$Match$Matchee$Gallery$Photos
    extends JsonSerializable with EquatableMixin {
  LikeUser$Mutation$LikeUser$Match$Matchee$Gallery$Photos();

  factory LikeUser$Mutation$LikeUser$Match$Matchee$Gallery$Photos.fromJson(
          Map<String, dynamic> json) =>
      _$LikeUser$Mutation$LikeUser$Match$Matchee$Gallery$PhotosFromJson(json);

  int? order;

  late String url;

  late String id;

  @override
  List<Object?> get props => [order, url, id];
  @override
  Map<String, dynamic> toJson() =>
      _$LikeUser$Mutation$LikeUser$Match$Matchee$Gallery$PhotosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeUser$Mutation$LikeUser$Match$Matchee$Gallery extends JsonSerializable
    with EquatableMixin {
  LikeUser$Mutation$LikeUser$Match$Matchee$Gallery();

  factory LikeUser$Mutation$LikeUser$Match$Matchee$Gallery.fromJson(
          Map<String, dynamic> json) =>
      _$LikeUser$Mutation$LikeUser$Match$Matchee$GalleryFromJson(json);

  List<LikeUser$Mutation$LikeUser$Match$Matchee$Gallery$Photos>? photos;

  @override
  List<Object?> get props => [photos];
  @override
  Map<String, dynamic> toJson() =>
      _$LikeUser$Mutation$LikeUser$Match$Matchee$GalleryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeUser$Mutation$LikeUser$Match$Matchee extends JsonSerializable
    with EquatableMixin {
  LikeUser$Mutation$LikeUser$Match$Matchee();

  factory LikeUser$Mutation$LikeUser$Match$Matchee.fromJson(
          Map<String, dynamic> json) =>
      _$LikeUser$Mutation$LikeUser$Match$MatcheeFromJson(json);

  late String id;

  late String phone;

  late String firstName;

  late bool verified;

  LikeUser$Mutation$LikeUser$Match$Matchee$Gallery? gallery;

  @override
  List<Object?> get props => [id, phone, firstName, verified, gallery];
  @override
  Map<String, dynamic> toJson() =>
      _$LikeUser$Mutation$LikeUser$Match$MatcheeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeUser$Mutation$LikeUser$Match$User$Gallery$Photos
    extends JsonSerializable with EquatableMixin {
  LikeUser$Mutation$LikeUser$Match$User$Gallery$Photos();

  factory LikeUser$Mutation$LikeUser$Match$User$Gallery$Photos.fromJson(
          Map<String, dynamic> json) =>
      _$LikeUser$Mutation$LikeUser$Match$User$Gallery$PhotosFromJson(json);

  int? order;

  late String url;

  late String id;

  @override
  List<Object?> get props => [order, url, id];
  @override
  Map<String, dynamic> toJson() =>
      _$LikeUser$Mutation$LikeUser$Match$User$Gallery$PhotosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeUser$Mutation$LikeUser$Match$User$Gallery extends JsonSerializable
    with EquatableMixin {
  LikeUser$Mutation$LikeUser$Match$User$Gallery();

  factory LikeUser$Mutation$LikeUser$Match$User$Gallery.fromJson(
          Map<String, dynamic> json) =>
      _$LikeUser$Mutation$LikeUser$Match$User$GalleryFromJson(json);

  List<LikeUser$Mutation$LikeUser$Match$User$Gallery$Photos>? photos;

  @override
  List<Object?> get props => [photos];
  @override
  Map<String, dynamic> toJson() =>
      _$LikeUser$Mutation$LikeUser$Match$User$GalleryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeUser$Mutation$LikeUser$Match$User extends JsonSerializable
    with EquatableMixin {
  LikeUser$Mutation$LikeUser$Match$User();

  factory LikeUser$Mutation$LikeUser$Match$User.fromJson(
          Map<String, dynamic> json) =>
      _$LikeUser$Mutation$LikeUser$Match$UserFromJson(json);

  late String id;

  late String phone;

  late String firstName;

  late bool verified;

  LikeUser$Mutation$LikeUser$Match$User$Gallery? gallery;

  @override
  List<Object?> get props => [id, phone, firstName, verified, gallery];
  @override
  Map<String, dynamic> toJson() =>
      _$LikeUser$Mutation$LikeUser$Match$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeUser$Mutation$LikeUser$Match extends JsonSerializable
    with EquatableMixin {
  LikeUser$Mutation$LikeUser$Match();

  factory LikeUser$Mutation$LikeUser$Match.fromJson(
          Map<String, dynamic> json) =>
      _$LikeUser$Mutation$LikeUser$MatchFromJson(json);

  late LikeUser$Mutation$LikeUser$Match$Conversation conversation;

  late LikeUser$Mutation$LikeUser$Match$Matchee matchee;

  late LikeUser$Mutation$LikeUser$Match$User user;

  @override
  List<Object?> get props => [conversation, matchee, user];
  @override
  Map<String, dynamic> toJson() =>
      _$LikeUser$Mutation$LikeUser$MatchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeUser$Mutation$LikeUser extends JsonSerializable with EquatableMixin {
  LikeUser$Mutation$LikeUser();

  factory LikeUser$Mutation$LikeUser.fromJson(Map<String, dynamic> json) =>
      _$LikeUser$Mutation$LikeUserFromJson(json);

  late LikeUser$Mutation$LikeUser$Like like;

  LikeUser$Mutation$LikeUser$Match? match;

  @override
  List<Object?> get props => [like, match];
  @override
  Map<String, dynamic> toJson() => _$LikeUser$Mutation$LikeUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeUser$Mutation extends JsonSerializable with EquatableMixin {
  LikeUser$Mutation();

  factory LikeUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$LikeUser$MutationFromJson(json);

  LikeUser$Mutation$LikeUser? likeUser;

  @override
  List<Object?> get props => [likeUser];
  @override
  Map<String, dynamic> toJson() => _$LikeUser$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeUserInput extends JsonSerializable with EquatableMixin {
  LikeUserInput({
    this.clientMutationId,
    required this.params,
  });

  factory LikeUserInput.fromJson(Map<String, dynamic> json) =>
      _$LikeUserInputFromJson(json);

  String? clientMutationId;

  late LikeInput params;

  @override
  List<Object?> get props => [clientMutationId, params];
  @override
  Map<String, dynamic> toJson() => _$LikeUserInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeInput extends JsonSerializable with EquatableMixin {
  LikeInput({
    required this.likeType,
    required this.likeeId,
    required this.userId,
  });

  factory LikeInput.fromJson(Map<String, dynamic> json) =>
      _$LikeInputFromJson(json);

  late String likeType;

  late int likeeId;

  late int userId;

  @override
  List<Object?> get props => [likeType, likeeId, userId];
  @override
  Map<String, dynamic> toJson() => _$LikeInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteUser$Mutation$DeleteUser$SoftDeletedUser extends JsonSerializable
    with EquatableMixin {
  DeleteUser$Mutation$DeleteUser$SoftDeletedUser();

  factory DeleteUser$Mutation$DeleteUser$SoftDeletedUser.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteUser$Mutation$DeleteUser$SoftDeletedUserFromJson(json);

  late String id;

  late String phone;

  late bool verified;

  @override
  List<Object?> get props => [id, phone, verified];
  @override
  Map<String, dynamic> toJson() =>
      _$DeleteUser$Mutation$DeleteUser$SoftDeletedUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteUser$Mutation$DeleteUser extends JsonSerializable
    with EquatableMixin {
  DeleteUser$Mutation$DeleteUser();

  factory DeleteUser$Mutation$DeleteUser.fromJson(Map<String, dynamic> json) =>
      _$DeleteUser$Mutation$DeleteUserFromJson(json);

  late DeleteUser$Mutation$DeleteUser$SoftDeletedUser softDeletedUser;

  @override
  List<Object?> get props => [softDeletedUser];
  @override
  Map<String, dynamic> toJson() => _$DeleteUser$Mutation$DeleteUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteUser$Mutation extends JsonSerializable with EquatableMixin {
  DeleteUser$Mutation();

  factory DeleteUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteUser$MutationFromJson(json);

  DeleteUser$Mutation$DeleteUser? deleteUser;

  @override
  List<Object?> get props => [deleteUser];
  @override
  Map<String, dynamic> toJson() => _$DeleteUser$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteUserInput extends JsonSerializable with EquatableMixin {
  DeleteUserInput({
    this.clientMutationId,
    required this.userId,
  });

  factory DeleteUserInput.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserInputFromJson(json);

  String? clientMutationId;

  late int userId;

  @override
  List<Object?> get props => [clientMutationId, userId];
  @override
  Map<String, dynamic> toJson() => _$DeleteUserInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignIn$Mutation$SignIn$User extends JsonSerializable with EquatableMixin {
  SignIn$Mutation$SignIn$User();

  factory SignIn$Mutation$SignIn$User.fromJson(Map<String, dynamic> json) =>
      _$SignIn$Mutation$SignIn$UserFromJson(json);

  late String id;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLISO8601DateTimeNullable)
  DateTime? currentSignInAt;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLISO8601DateTimeNullable)
  DateTime? lastSignInAt;

  late String phone;

  @override
  List<Object?> get props => [id, currentSignInAt, lastSignInAt, phone];
  @override
  Map<String, dynamic> toJson() => _$SignIn$Mutation$SignIn$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignIn$Mutation$SignIn extends JsonSerializable with EquatableMixin {
  SignIn$Mutation$SignIn();

  factory SignIn$Mutation$SignIn.fromJson(Map<String, dynamic> json) =>
      _$SignIn$Mutation$SignInFromJson(json);

  late SignIn$Mutation$SignIn$User user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$SignIn$Mutation$SignInToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignIn$Mutation extends JsonSerializable with EquatableMixin {
  SignIn$Mutation();

  factory SignIn$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SignIn$MutationFromJson(json);

  SignIn$Mutation$SignIn? signIn;

  @override
  List<Object?> get props => [signIn];
  @override
  Map<String, dynamic> toJson() => _$SignIn$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SignInInput extends JsonSerializable with EquatableMixin {
  SignInInput({
    this.clientMutationId,
    required this.token,
  });

  factory SignInInput.fromJson(Map<String, dynamic> json) =>
      _$SignInInputFromJson(json);

  String? clientMutationId;

  late String token;

  @override
  List<Object?> get props => [clientMutationId, token];
  @override
  Map<String, dynamic> toJson() => _$SignInInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReorderPhotos$Mutation$ReorderPhotos$Photo extends JsonSerializable
    with EquatableMixin {
  ReorderPhotos$Mutation$ReorderPhotos$Photo();

  factory ReorderPhotos$Mutation$ReorderPhotos$Photo.fromJson(
          Map<String, dynamic> json) =>
      _$ReorderPhotos$Mutation$ReorderPhotos$PhotoFromJson(json);

  int? order;

  late String url;

  late String id;

  @override
  List<Object?> get props => [order, url, id];
  @override
  Map<String, dynamic> toJson() =>
      _$ReorderPhotos$Mutation$ReorderPhotos$PhotoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReorderPhotos$Mutation$ReorderPhotos extends JsonSerializable
    with EquatableMixin {
  ReorderPhotos$Mutation$ReorderPhotos();

  factory ReorderPhotos$Mutation$ReorderPhotos.fromJson(
          Map<String, dynamic> json) =>
      _$ReorderPhotos$Mutation$ReorderPhotosFromJson(json);

  late ReorderPhotos$Mutation$ReorderPhotos$Photo photo;

  @override
  List<Object?> get props => [photo];
  @override
  Map<String, dynamic> toJson() =>
      _$ReorderPhotos$Mutation$ReorderPhotosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReorderPhotos$Mutation extends JsonSerializable with EquatableMixin {
  ReorderPhotos$Mutation();

  factory ReorderPhotos$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ReorderPhotos$MutationFromJson(json);

  ReorderPhotos$Mutation$ReorderPhotos? reorderPhotos;

  @override
  List<Object?> get props => [reorderPhotos];
  @override
  Map<String, dynamic> toJson() => _$ReorderPhotos$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReorderPhotosInput extends JsonSerializable with EquatableMixin {
  ReorderPhotosInput({
    this.clientMutationId,
    required this.order,
    required this.photoId,
  });

  factory ReorderPhotosInput.fromJson(Map<String, dynamic> json) =>
      _$ReorderPhotosInputFromJson(json);

  String? clientMutationId;

  late String order;

  late String photoId;

  @override
  List<Object?> get props => [clientMutationId, order, photoId];
  @override
  Map<String, dynamic> toJson() => _$ReorderPhotosInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SetUserLocation$Mutation$SetUserLocation$User extends JsonSerializable
    with EquatableMixin {
  SetUserLocation$Mutation$SetUserLocation$User();

  factory SetUserLocation$Mutation$SetUserLocation$User.fromJson(
          Map<String, dynamic> json) =>
      _$SetUserLocation$Mutation$SetUserLocation$UserFromJson(json);

  late String id;

  String? lonlat;

  String? displayCity;

  String? displayState;

  @override
  List<Object?> get props => [id, lonlat, displayCity, displayState];
  @override
  Map<String, dynamic> toJson() =>
      _$SetUserLocation$Mutation$SetUserLocation$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SetUserLocation$Mutation$SetUserLocation extends JsonSerializable
    with EquatableMixin {
  SetUserLocation$Mutation$SetUserLocation();

  factory SetUserLocation$Mutation$SetUserLocation.fromJson(
          Map<String, dynamic> json) =>
      _$SetUserLocation$Mutation$SetUserLocationFromJson(json);

  late SetUserLocation$Mutation$SetUserLocation$User user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() =>
      _$SetUserLocation$Mutation$SetUserLocationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SetUserLocation$Mutation extends JsonSerializable with EquatableMixin {
  SetUserLocation$Mutation();

  factory SetUserLocation$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SetUserLocation$MutationFromJson(json);

  SetUserLocation$Mutation$SetUserLocation? setUserLocation;

  @override
  List<Object?> get props => [setUserLocation];
  @override
  Map<String, dynamic> toJson() => _$SetUserLocation$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SetUserLocationInput extends JsonSerializable with EquatableMixin {
  SetUserLocationInput({
    this.clientMutationId,
    required this.latitude,
    required this.longitude,
    required this.userId,
  });

  factory SetUserLocationInput.fromJson(Map<String, dynamic> json) =>
      _$SetUserLocationInputFromJson(json);

  String? clientMutationId;

  late String latitude;

  late String longitude;

  late int userId;

  @override
  List<Object?> get props => [clientMutationId, latitude, longitude, userId];
  @override
  Map<String, dynamic> toJson() => _$SetUserLocationInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UndoLike$Mutation$UndoLike$UndidUser extends JsonSerializable
    with EquatableMixin {
  UndoLike$Mutation$UndoLike$UndidUser();

  factory UndoLike$Mutation$UndoLike$UndidUser.fromJson(
          Map<String, dynamic> json) =>
      _$UndoLike$Mutation$UndoLike$UndidUserFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$UndoLike$Mutation$UndoLike$UndidUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UndoLike$Mutation$UndoLike extends JsonSerializable with EquatableMixin {
  UndoLike$Mutation$UndoLike();

  factory UndoLike$Mutation$UndoLike.fromJson(Map<String, dynamic> json) =>
      _$UndoLike$Mutation$UndoLikeFromJson(json);

  late String status;

  UndoLike$Mutation$UndoLike$UndidUser? undidUser;

  @override
  List<Object?> get props => [status, undidUser];
  @override
  Map<String, dynamic> toJson() => _$UndoLike$Mutation$UndoLikeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UndoLike$Mutation extends JsonSerializable with EquatableMixin {
  UndoLike$Mutation();

  factory UndoLike$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UndoLike$MutationFromJson(json);

  UndoLike$Mutation$UndoLike? undoLike;

  @override
  List<Object?> get props => [undoLike];
  @override
  Map<String, dynamic> toJson() => _$UndoLike$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UndoLikeInput extends JsonSerializable with EquatableMixin {
  UndoLikeInput({
    this.clientMutationId,
    required this.userId,
  });

  factory UndoLikeInput.fromJson(Map<String, dynamic> json) =>
      _$UndoLikeInputFromJson(json);

  String? clientMutationId;

  late String userId;

  @override
  List<Object?> get props => [clientMutationId, userId];
  @override
  Map<String, dynamic> toJson() => _$UndoLikeInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UploadPhoto$Mutation$UploadPhoto$User$Gallery$Photos
    extends JsonSerializable with EquatableMixin {
  UploadPhoto$Mutation$UploadPhoto$User$Gallery$Photos();

  factory UploadPhoto$Mutation$UploadPhoto$User$Gallery$Photos.fromJson(
          Map<String, dynamic> json) =>
      _$UploadPhoto$Mutation$UploadPhoto$User$Gallery$PhotosFromJson(json);

  int? order;

  late String url;

  late String id;

  @override
  List<Object?> get props => [order, url, id];
  @override
  Map<String, dynamic> toJson() =>
      _$UploadPhoto$Mutation$UploadPhoto$User$Gallery$PhotosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UploadPhoto$Mutation$UploadPhoto$User$Gallery extends JsonSerializable
    with EquatableMixin {
  UploadPhoto$Mutation$UploadPhoto$User$Gallery();

  factory UploadPhoto$Mutation$UploadPhoto$User$Gallery.fromJson(
          Map<String, dynamic> json) =>
      _$UploadPhoto$Mutation$UploadPhoto$User$GalleryFromJson(json);

  List<UploadPhoto$Mutation$UploadPhoto$User$Gallery$Photos>? photos;

  @override
  List<Object?> get props => [photos];
  @override
  Map<String, dynamic> toJson() =>
      _$UploadPhoto$Mutation$UploadPhoto$User$GalleryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UploadPhoto$Mutation$UploadPhoto$User extends JsonSerializable
    with EquatableMixin {
  UploadPhoto$Mutation$UploadPhoto$User();

  factory UploadPhoto$Mutation$UploadPhoto$User.fromJson(
          Map<String, dynamic> json) =>
      _$UploadPhoto$Mutation$UploadPhoto$UserFromJson(json);

  UploadPhoto$Mutation$UploadPhoto$User$Gallery? gallery;

  @override
  List<Object?> get props => [gallery];
  @override
  Map<String, dynamic> toJson() =>
      _$UploadPhoto$Mutation$UploadPhoto$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UploadPhoto$Mutation$UploadPhoto extends JsonSerializable
    with EquatableMixin {
  UploadPhoto$Mutation$UploadPhoto();

  factory UploadPhoto$Mutation$UploadPhoto.fromJson(
          Map<String, dynamic> json) =>
      _$UploadPhoto$Mutation$UploadPhotoFromJson(json);

  late UploadPhoto$Mutation$UploadPhoto$User user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() =>
      _$UploadPhoto$Mutation$UploadPhotoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UploadPhoto$Mutation extends JsonSerializable with EquatableMixin {
  UploadPhoto$Mutation();

  factory UploadPhoto$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UploadPhoto$MutationFromJson(json);

  UploadPhoto$Mutation$UploadPhoto? uploadPhoto;

  @override
  List<Object?> get props => [uploadPhoto];
  @override
  Map<String, dynamic> toJson() => _$UploadPhoto$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UploadPhotoInput extends JsonSerializable with EquatableMixin {
  UploadPhotoInput({
    this.clientMutationId,
    this.image,
    required this.order,
    required this.userId,
  });

  factory UploadPhotoInput.fromJson(Map<String, dynamic> json) =>
      _$UploadPhotoInputFromJson(json);

  String? clientMutationId;

  @JsonKey(
      fromJson: fromGraphQLUploadNullableToDartMultipartFileNullable,
      toJson: fromDartMultipartFileNullableToGraphQLUploadNullable)
  MultipartFile? image;

  late int order;

  late int userId;

  @override
  List<Object?> get props => [clientMutationId, image, order, userId];
  @override
  Map<String, dynamic> toJson() => _$UploadPhotoInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteFavoriteMusic$Mutation$DeleteFavoriteMusic extends JsonSerializable
    with EquatableMixin {
  DeleteFavoriteMusic$Mutation$DeleteFavoriteMusic();

  factory DeleteFavoriteMusic$Mutation$DeleteFavoriteMusic.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteFavoriteMusic$Mutation$DeleteFavoriteMusicFromJson(json);

  late bool deleted;

  @override
  List<Object?> get props => [deleted];
  @override
  Map<String, dynamic> toJson() =>
      _$DeleteFavoriteMusic$Mutation$DeleteFavoriteMusicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteFavoriteMusic$Mutation extends JsonSerializable
    with EquatableMixin {
  DeleteFavoriteMusic$Mutation();

  factory DeleteFavoriteMusic$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteFavoriteMusic$MutationFromJson(json);

  DeleteFavoriteMusic$Mutation$DeleteFavoriteMusic? deleteFavoriteMusic;

  @override
  List<Object?> get props => [deleteFavoriteMusic];
  @override
  Map<String, dynamic> toJson() => _$DeleteFavoriteMusic$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteFavoriteMusicInput extends JsonSerializable with EquatableMixin {
  DeleteFavoriteMusicInput({
    this.clientMutationId,
    required this.musicIds,
    required this.userId,
  });

  factory DeleteFavoriteMusicInput.fromJson(Map<String, dynamic> json) =>
      _$DeleteFavoriteMusicInputFromJson(json);

  String? clientMutationId;

  late List<String> musicIds;

  late String userId;

  @override
  List<Object?> get props => [clientMutationId, musicIds, userId];
  @override
  Map<String, dynamic> toJson() => _$DeleteFavoriteMusicInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchMessages$Query$FetchMessages$Recommendation$Anime
    extends JsonSerializable with EquatableMixin {
  FetchMessages$Query$FetchMessages$Recommendation$Anime();

  factory FetchMessages$Query$FetchMessages$Recommendation$Anime.fromJson(
          Map<String, dynamic> json) =>
      _$FetchMessages$Query$FetchMessages$Recommendation$AnimeFromJson(json);

  late String id;

  String? title;

  String? cover;

  @override
  List<Object?> get props => [id, title, cover];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchMessages$Query$FetchMessages$Recommendation$AnimeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchMessages$Query$FetchMessages$Recommendation extends JsonSerializable
    with EquatableMixin {
  FetchMessages$Query$FetchMessages$Recommendation();

  factory FetchMessages$Query$FetchMessages$Recommendation.fromJson(
          Map<String, dynamic> json) =>
      _$FetchMessages$Query$FetchMessages$RecommendationFromJson(json);

  late int userId;

  late int recommendeeId;

  FetchMessages$Query$FetchMessages$Recommendation$Anime? anime;

  @override
  List<Object?> get props => [userId, recommendeeId, anime];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchMessages$Query$FetchMessages$RecommendationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchMessages$Query$FetchMessages$Sticker extends JsonSerializable
    with EquatableMixin {
  FetchMessages$Query$FetchMessages$Sticker();

  factory FetchMessages$Query$FetchMessages$Sticker.fromJson(
          Map<String, dynamic> json) =>
      _$FetchMessages$Query$FetchMessages$StickerFromJson(json);

  late String id;

  late String url;

  @override
  List<Object?> get props => [id, url];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchMessages$Query$FetchMessages$StickerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchMessages$Query$FetchMessages extends JsonSerializable
    with EquatableMixin {
  FetchMessages$Query$FetchMessages();

  factory FetchMessages$Query$FetchMessages.fromJson(
          Map<String, dynamic> json) =>
      _$FetchMessages$Query$FetchMessagesFromJson(json);

  late String id;

  String? attachment;

  String? attachmentType;

  String? content;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeToDartDateTime,
      toJson: fromDartDateTimeToGraphQLISO8601DateTime)
  late DateTime createdAt;

  String? reaction;

  bool? read;

  int? senderId;

  FetchMessages$Query$FetchMessages$Recommendation? recommendation;

  FetchMessages$Query$FetchMessages$Sticker? sticker;

  @override
  List<Object?> get props => [
        id,
        attachment,
        attachmentType,
        content,
        createdAt,
        reaction,
        read,
        senderId,
        recommendation,
        sticker
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchMessages$Query$FetchMessagesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchMessages$Query extends JsonSerializable with EquatableMixin {
  FetchMessages$Query();

  factory FetchMessages$Query.fromJson(Map<String, dynamic> json) =>
      _$FetchMessages$QueryFromJson(json);

  late List<FetchMessages$Query$FetchMessages> fetchMessages;

  @override
  List<Object?> get props => [fetchMessages];
  @override
  Map<String, dynamic> toJson() => _$FetchMessages$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchFeed$Query$FetchFeed$Gallery$Photos extends JsonSerializable
    with EquatableMixin {
  FetchFeed$Query$FetchFeed$Gallery$Photos();

  factory FetchFeed$Query$FetchFeed$Gallery$Photos.fromJson(
          Map<String, dynamic> json) =>
      _$FetchFeed$Query$FetchFeed$Gallery$PhotosFromJson(json);

  late String id;

  int? order;

  late String url;

  @override
  List<Object?> get props => [id, order, url];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchFeed$Query$FetchFeed$Gallery$PhotosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchFeed$Query$FetchFeed$Gallery extends JsonSerializable
    with EquatableMixin {
  FetchFeed$Query$FetchFeed$Gallery();

  factory FetchFeed$Query$FetchFeed$Gallery.fromJson(
          Map<String, dynamic> json) =>
      _$FetchFeed$Query$FetchFeed$GalleryFromJson(json);

  List<FetchFeed$Query$FetchFeed$Gallery$Photos>? photos;

  @override
  List<Object?> get props => [photos];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchFeed$Query$FetchFeed$GalleryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchFeed$Query$FetchFeed$Animes extends JsonSerializable
    with EquatableMixin {
  FetchFeed$Query$FetchFeed$Animes();

  factory FetchFeed$Query$FetchFeed$Animes.fromJson(
          Map<String, dynamic> json) =>
      _$FetchFeed$Query$FetchFeed$AnimesFromJson(json);

  late String id;

  String? title;

  String? cover;

  @override
  List<Object?> get props => [id, title, cover];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchFeed$Query$FetchFeed$AnimesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchFeed$Query$FetchFeed$FavoriteMusic extends JsonSerializable
    with EquatableMixin {
  FetchFeed$Query$FetchFeed$FavoriteMusic();

  factory FetchFeed$Query$FetchFeed$FavoriteMusic.fromJson(
          Map<String, dynamic> json) =>
      _$FetchFeed$Query$FetchFeed$FavoriteMusicFromJson(json);

  late String id;

  String? trackName;

  String? artistName;

  String? coverUrl;

  String? musicType;

  String? spotifyId;

  @override
  List<Object?> get props =>
      [id, trackName, artistName, coverUrl, musicType, spotifyId];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchFeed$Query$FetchFeed$FavoriteMusicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchFeed$Query$FetchFeed extends JsonSerializable with EquatableMixin {
  FetchFeed$Query$FetchFeed();

  factory FetchFeed$Query$FetchFeed.fromJson(Map<String, dynamic> json) =>
      _$FetchFeed$Query$FetchFeedFromJson(json);

  late String id;

  late String phone;

  late String firstName;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLISO8601DateTimeNullable)
  DateTime? birthday;

  late bool premium;

  String? occupation;

  String? school;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLISO8601DateTimeNullable)
  DateTime? currentSignInAt;

  String? currentSignInIp;

  String? gender;

  String? desiredGender;

  String? bio;

  late bool verified;

  String? onlineStatus;

  FetchFeed$Query$FetchFeed$Gallery? gallery;

  List<FetchFeed$Query$FetchFeed$Animes>? animes;

  List<FetchFeed$Query$FetchFeed$FavoriteMusic>? favoriteMusic;

  bool? hasLocationHidden;

  int? superLikeCount;

  @override
  List<Object?> get props => [
        id,
        phone,
        firstName,
        birthday,
        premium,
        occupation,
        school,
        currentSignInAt,
        currentSignInIp,
        gender,
        desiredGender,
        bio,
        verified,
        onlineStatus,
        gallery,
        animes,
        favoriteMusic,
        hasLocationHidden,
        superLikeCount
      ];
  @override
  Map<String, dynamic> toJson() => _$FetchFeed$Query$FetchFeedToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchFeed$Query extends JsonSerializable with EquatableMixin {
  FetchFeed$Query();

  factory FetchFeed$Query.fromJson(Map<String, dynamic> json) =>
      _$FetchFeed$QueryFromJson(json);

  late List<FetchFeed$Query$FetchFeed> fetchFeed;

  @override
  List<Object?> get props => [fetchFeed];
  @override
  Map<String, dynamic> toJson() => _$FetchFeed$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchFeedInput extends JsonSerializable with EquatableMixin {
  FetchFeedInput({
    this.animeIds,
    this.hasBio,
    required this.maxAge,
    required this.milesAway,
    required this.minAge,
    this.page,
    required this.userId,
    this.verified,
  });

  factory FetchFeedInput.fromJson(Map<String, dynamic> json) =>
      _$FetchFeedInputFromJson(json);

  List<String>? animeIds;

  bool? hasBio;

  late int maxAge;

  late int milesAway;

  late int minAge;

  int? page;

  late String userId;

  bool? verified;

  @override
  List<Object?> get props =>
      [animeIds, hasBio, maxAge, milesAway, minAge, page, userId, verified];
  @override
  Map<String, dynamic> toJson() => _$FetchFeedInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchUser$Query$FetchUser$Matches$Conversation extends JsonSerializable
    with EquatableMixin {
  FetchUser$Query$FetchUser$Matches$Conversation();

  factory FetchUser$Query$FetchUser$Matches$Conversation.fromJson(
          Map<String, dynamic> json) =>
      _$FetchUser$Query$FetchUser$Matches$ConversationFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchUser$Query$FetchUser$Matches$ConversationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchUser$Query$FetchUser$Matches extends JsonSerializable
    with EquatableMixin {
  FetchUser$Query$FetchUser$Matches();

  factory FetchUser$Query$FetchUser$Matches.fromJson(
          Map<String, dynamic> json) =>
      _$FetchUser$Query$FetchUser$MatchesFromJson(json);

  late String id;

  int? matcheeId;

  late FetchUser$Query$FetchUser$Matches$Conversation conversation;

  @override
  List<Object?> get props => [id, matcheeId, conversation];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchUser$Query$FetchUser$MatchesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchUser$Query$FetchUser$Gallery$Photos extends JsonSerializable
    with EquatableMixin {
  FetchUser$Query$FetchUser$Gallery$Photos();

  factory FetchUser$Query$FetchUser$Gallery$Photos.fromJson(
          Map<String, dynamic> json) =>
      _$FetchUser$Query$FetchUser$Gallery$PhotosFromJson(json);

  int? order;

  late String url;

  late String id;

  @override
  List<Object?> get props => [order, url, id];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchUser$Query$FetchUser$Gallery$PhotosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchUser$Query$FetchUser$Gallery extends JsonSerializable
    with EquatableMixin {
  FetchUser$Query$FetchUser$Gallery();

  factory FetchUser$Query$FetchUser$Gallery.fromJson(
          Map<String, dynamic> json) =>
      _$FetchUser$Query$FetchUser$GalleryFromJson(json);

  List<FetchUser$Query$FetchUser$Gallery$Photos>? photos;

  @override
  List<Object?> get props => [photos];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchUser$Query$FetchUser$GalleryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchUser$Query$FetchUser$Animes extends JsonSerializable
    with EquatableMixin {
  FetchUser$Query$FetchUser$Animes();

  factory FetchUser$Query$FetchUser$Animes.fromJson(
          Map<String, dynamic> json) =>
      _$FetchUser$Query$FetchUser$AnimesFromJson(json);

  late String id;

  String? title;

  String? cover;

  @override
  List<Object?> get props => [id, title, cover];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchUser$Query$FetchUser$AnimesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchUser$Query$FetchUser$FavoriteMusic extends JsonSerializable
    with EquatableMixin {
  FetchUser$Query$FetchUser$FavoriteMusic();

  factory FetchUser$Query$FetchUser$FavoriteMusic.fromJson(
          Map<String, dynamic> json) =>
      _$FetchUser$Query$FetchUser$FavoriteMusicFromJson(json);

  late String id;

  String? coverUrl;

  String? musicType;

  String? trackName;

  String? artistName;

  String? spotifyId;

  @override
  List<Object?> get props =>
      [id, coverUrl, musicType, trackName, artistName, spotifyId];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchUser$Query$FetchUser$FavoriteMusicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchUser$Query$FetchUser extends JsonSerializable with EquatableMixin {
  FetchUser$Query$FetchUser();

  factory FetchUser$Query$FetchUser.fromJson(Map<String, dynamic> json) =>
      _$FetchUser$Query$FetchUserFromJson(json);

  late String id;

  late String role;

  late String firstName;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLISO8601DateTimeNullable)
  DateTime? birthday;

  String? bio;

  String? gender;

  String? desiredGender;

  late String phone;

  late bool verified;

  String? school;

  String? occupation;

  String? displayCity;

  String? displayState;

  String? spotifyEmail;

  String? onlineStatus;

  String? lonlat;

  List<FetchUser$Query$FetchUser$Matches>? matches;

  FetchUser$Query$FetchUser$Gallery? gallery;

  List<FetchUser$Query$FetchUser$Animes>? animes;

  List<FetchUser$Query$FetchUser$FavoriteMusic>? favoriteMusic;

  late bool premium;

  int? superLikeCount;

  bool? hasLocationHidden;

  @override
  List<Object?> get props => [
        id,
        role,
        firstName,
        birthday,
        bio,
        gender,
        desiredGender,
        phone,
        verified,
        school,
        occupation,
        displayCity,
        displayState,
        spotifyEmail,
        onlineStatus,
        lonlat,
        matches,
        gallery,
        animes,
        favoriteMusic,
        premium,
        superLikeCount,
        hasLocationHidden
      ];
  @override
  Map<String, dynamic> toJson() => _$FetchUser$Query$FetchUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchUser$Query extends JsonSerializable with EquatableMixin {
  FetchUser$Query();

  factory FetchUser$Query.fromJson(Map<String, dynamic> json) =>
      _$FetchUser$QueryFromJson(json);

  late FetchUser$Query$FetchUser fetchUser;

  @override
  List<Object?> get props => [fetchUser];
  @override
  Map<String, dynamic> toJson() => _$FetchUser$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchAnime$Query$FetchAnime extends JsonSerializable with EquatableMixin {
  FetchAnime$Query$FetchAnime();

  factory FetchAnime$Query$FetchAnime.fromJson(Map<String, dynamic> json) =>
      _$FetchAnime$Query$FetchAnimeFromJson(json);

  late String id;

  String? title;

  String? genres;

  String? cover;

  int? episodes;

  int? popularity;

  int? averageScore;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLISO8601DateTimeNullable)
  DateTime? startDate;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLISO8601DateTimeNullable)
  DateTime? endDate;

  String? studios;

  int? year;

  String? status;

  @override
  List<Object?> get props => [
        id,
        title,
        genres,
        cover,
        episodes,
        popularity,
        averageScore,
        startDate,
        endDate,
        studios,
        year,
        status
      ];
  @override
  Map<String, dynamic> toJson() => _$FetchAnime$Query$FetchAnimeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchAnime$Query extends JsonSerializable with EquatableMixin {
  FetchAnime$Query();

  factory FetchAnime$Query.fromJson(Map<String, dynamic> json) =>
      _$FetchAnime$QueryFromJson(json);

  late List<FetchAnime$Query$FetchAnime> fetchAnime;

  @override
  List<Object?> get props => [fetchAnime];
  @override
  Map<String, dynamic> toJson() => _$FetchAnime$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AnimeInput extends JsonSerializable with EquatableMixin {
  AnimeInput({
    this.genres,
    this.page,
    this.title,
  });

  factory AnimeInput.fromJson(Map<String, dynamic> json) =>
      _$AnimeInputFromJson(json);

  List<String>? genres;

  int? page;

  String? title;

  @override
  List<Object?> get props => [genres, page, title];
  @override
  Map<String, dynamic> toJson() => _$AnimeInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchConversations$Query$FetchConversations$Match$User$Gallery$Photos
    extends JsonSerializable with EquatableMixin {
  FetchConversations$Query$FetchConversations$Match$User$Gallery$Photos();

  factory FetchConversations$Query$FetchConversations$Match$User$Gallery$Photos.fromJson(
          Map<String, dynamic> json) =>
      _$FetchConversations$Query$FetchConversations$Match$User$Gallery$PhotosFromJson(
          json);

  int? order;

  late String url;

  @override
  List<Object?> get props => [order, url];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchConversations$Query$FetchConversations$Match$User$Gallery$PhotosToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class FetchConversations$Query$FetchConversations$Match$User$Gallery
    extends JsonSerializable with EquatableMixin {
  FetchConversations$Query$FetchConversations$Match$User$Gallery();

  factory FetchConversations$Query$FetchConversations$Match$User$Gallery.fromJson(
          Map<String, dynamic> json) =>
      _$FetchConversations$Query$FetchConversations$Match$User$GalleryFromJson(
          json);

  List<FetchConversations$Query$FetchConversations$Match$User$Gallery$Photos>?
      photos;

  @override
  List<Object?> get props => [photos];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchConversations$Query$FetchConversations$Match$User$GalleryToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class FetchConversations$Query$FetchConversations$Match$User
    extends JsonSerializable with EquatableMixin {
  FetchConversations$Query$FetchConversations$Match$User();

  factory FetchConversations$Query$FetchConversations$Match$User.fromJson(
          Map<String, dynamic> json) =>
      _$FetchConversations$Query$FetchConversations$Match$UserFromJson(json);

  late String id;

  String? onlineStatus;

  late String firstName;

  FetchConversations$Query$FetchConversations$Match$User$Gallery? gallery;

  @override
  List<Object?> get props => [id, onlineStatus, firstName, gallery];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchConversations$Query$FetchConversations$Match$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchConversations$Query$FetchConversations$Match$Matchee$Gallery$Photos
    extends JsonSerializable with EquatableMixin {
  FetchConversations$Query$FetchConversations$Match$Matchee$Gallery$Photos();

  factory FetchConversations$Query$FetchConversations$Match$Matchee$Gallery$Photos.fromJson(
          Map<String, dynamic> json) =>
      _$FetchConversations$Query$FetchConversations$Match$Matchee$Gallery$PhotosFromJson(
          json);

  int? order;

  late String url;

  @override
  List<Object?> get props => [order, url];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchConversations$Query$FetchConversations$Match$Matchee$Gallery$PhotosToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class FetchConversations$Query$FetchConversations$Match$Matchee$Gallery
    extends JsonSerializable with EquatableMixin {
  FetchConversations$Query$FetchConversations$Match$Matchee$Gallery();

  factory FetchConversations$Query$FetchConversations$Match$Matchee$Gallery.fromJson(
          Map<String, dynamic> json) =>
      _$FetchConversations$Query$FetchConversations$Match$Matchee$GalleryFromJson(
          json);

  List<FetchConversations$Query$FetchConversations$Match$Matchee$Gallery$Photos>?
      photos;

  @override
  List<Object?> get props => [photos];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchConversations$Query$FetchConversations$Match$Matchee$GalleryToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class FetchConversations$Query$FetchConversations$Match$Matchee
    extends JsonSerializable with EquatableMixin {
  FetchConversations$Query$FetchConversations$Match$Matchee();

  factory FetchConversations$Query$FetchConversations$Match$Matchee.fromJson(
          Map<String, dynamic> json) =>
      _$FetchConversations$Query$FetchConversations$Match$MatcheeFromJson(json);

  late String id;

  String? onlineStatus;

  late String firstName;

  FetchConversations$Query$FetchConversations$Match$Matchee$Gallery? gallery;

  @override
  List<Object?> get props => [id, onlineStatus, firstName, gallery];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchConversations$Query$FetchConversations$Match$MatcheeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchConversations$Query$FetchConversations$Match extends JsonSerializable
    with EquatableMixin {
  FetchConversations$Query$FetchConversations$Match();

  factory FetchConversations$Query$FetchConversations$Match.fromJson(
          Map<String, dynamic> json) =>
      _$FetchConversations$Query$FetchConversations$MatchFromJson(json);

  late String id;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeToDartDateTime,
      toJson: fromDartDateTimeToGraphQLISO8601DateTime)
  late DateTime createdAt;

  late FetchConversations$Query$FetchConversations$Match$User user;

  late FetchConversations$Query$FetchConversations$Match$Matchee matchee;

  @override
  List<Object?> get props => [id, createdAt, user, matchee];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchConversations$Query$FetchConversations$MatchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchConversations$Query$FetchConversations$LastMessage$Recommendation$Anime
    extends JsonSerializable with EquatableMixin {
  FetchConversations$Query$FetchConversations$LastMessage$Recommendation$Anime();

  factory FetchConversations$Query$FetchConversations$LastMessage$Recommendation$Anime.fromJson(
          Map<String, dynamic> json) =>
      _$FetchConversations$Query$FetchConversations$LastMessage$Recommendation$AnimeFromJson(
          json);

  String? title;

  String? cover;

  @override
  List<Object?> get props => [title, cover];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchConversations$Query$FetchConversations$LastMessage$Recommendation$AnimeToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class FetchConversations$Query$FetchConversations$LastMessage$Recommendation
    extends JsonSerializable with EquatableMixin {
  FetchConversations$Query$FetchConversations$LastMessage$Recommendation();

  factory FetchConversations$Query$FetchConversations$LastMessage$Recommendation.fromJson(
          Map<String, dynamic> json) =>
      _$FetchConversations$Query$FetchConversations$LastMessage$RecommendationFromJson(
          json);

  late int userId;

  late int recommendeeId;

  FetchConversations$Query$FetchConversations$LastMessage$Recommendation$Anime?
      anime;

  @override
  List<Object?> get props => [userId, recommendeeId, anime];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchConversations$Query$FetchConversations$LastMessage$RecommendationToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class FetchConversations$Query$FetchConversations$LastMessage$Sticker
    extends JsonSerializable with EquatableMixin {
  FetchConversations$Query$FetchConversations$LastMessage$Sticker();

  factory FetchConversations$Query$FetchConversations$LastMessage$Sticker.fromJson(
          Map<String, dynamic> json) =>
      _$FetchConversations$Query$FetchConversations$LastMessage$StickerFromJson(
          json);

  late String id;

  late String url;

  @override
  List<Object?> get props => [id, url];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchConversations$Query$FetchConversations$LastMessage$StickerToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class FetchConversations$Query$FetchConversations$LastMessage
    extends JsonSerializable with EquatableMixin {
  FetchConversations$Query$FetchConversations$LastMessage();

  factory FetchConversations$Query$FetchConversations$LastMessage.fromJson(
          Map<String, dynamic> json) =>
      _$FetchConversations$Query$FetchConversations$LastMessageFromJson(json);

  String? attachment;

  String? attachmentType;

  String? content;

  @JsonKey(
      fromJson: fromGraphQLISO8601DateTimeToDartDateTime,
      toJson: fromDartDateTimeToGraphQLISO8601DateTime)
  late DateTime createdAt;

  String? reaction;

  bool? read;

  int? senderId;

  FetchConversations$Query$FetchConversations$LastMessage$Recommendation?
      recommendation;

  FetchConversations$Query$FetchConversations$LastMessage$Sticker? sticker;

  @override
  List<Object?> get props => [
        attachment,
        attachmentType,
        content,
        createdAt,
        reaction,
        read,
        senderId,
        recommendation,
        sticker
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchConversations$Query$FetchConversations$LastMessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchConversations$Query$FetchConversations extends JsonSerializable
    with EquatableMixin {
  FetchConversations$Query$FetchConversations();

  factory FetchConversations$Query$FetchConversations.fromJson(
          Map<String, dynamic> json) =>
      _$FetchConversations$Query$FetchConversationsFromJson(json);

  late String id;

  FetchConversations$Query$FetchConversations$Match? match;

  FetchConversations$Query$FetchConversations$LastMessage? lastMessage;

  int? unreadCount;

  @override
  List<Object?> get props => [id, match, lastMessage, unreadCount];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchConversations$Query$FetchConversationsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchConversations$Query extends JsonSerializable with EquatableMixin {
  FetchConversations$Query();

  factory FetchConversations$Query.fromJson(Map<String, dynamic> json) =>
      _$FetchConversations$QueryFromJson(json);

  late List<FetchConversations$Query$FetchConversations> fetchConversations;

  @override
  List<Object?> get props => [fetchConversations];
  @override
  Map<String, dynamic> toJson() => _$FetchConversations$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchVerifyRequests$Query$FetchVerifyRequests extends JsonSerializable
    with EquatableMixin {
  FetchVerifyRequests$Query$FetchVerifyRequests();

  factory FetchVerifyRequests$Query$FetchVerifyRequests.fromJson(
          Map<String, dynamic> json) =>
      _$FetchVerifyRequests$Query$FetchVerifyRequestsFromJson(json);

  late int userId;

  late String status;

  @override
  List<Object?> get props => [userId, status];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchVerifyRequests$Query$FetchVerifyRequestsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchVerifyRequests$Query extends JsonSerializable with EquatableMixin {
  FetchVerifyRequests$Query();

  factory FetchVerifyRequests$Query.fromJson(Map<String, dynamic> json) =>
      _$FetchVerifyRequests$QueryFromJson(json);

  late List<FetchVerifyRequests$Query$FetchVerifyRequests> fetchVerifyRequests;

  @override
  List<Object?> get props => [fetchVerifyRequests];
  @override
  Map<String, dynamic> toJson() => _$FetchVerifyRequests$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchStickers$Query$FetchStickers extends JsonSerializable
    with EquatableMixin {
  FetchStickers$Query$FetchStickers();

  factory FetchStickers$Query$FetchStickers.fromJson(
          Map<String, dynamic> json) =>
      _$FetchStickers$Query$FetchStickersFromJson(json);

  late String id;

  late String url;

  @override
  List<Object?> get props => [id, url];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchStickers$Query$FetchStickersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchStickers$Query extends JsonSerializable with EquatableMixin {
  FetchStickers$Query();

  factory FetchStickers$Query.fromJson(Map<String, dynamic> json) =>
      _$FetchStickers$QueryFromJson(json);

  late List<FetchStickers$Query$FetchStickers> fetchStickers;

  @override
  List<Object?> get props => [fetchStickers];
  @override
  Map<String, dynamic> toJson() => _$FetchStickers$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteFavoriteAnimeArguments extends JsonSerializable
    with EquatableMixin {
  DeleteFavoriteAnimeArguments({required this.input});

  @override
  factory DeleteFavoriteAnimeArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteFavoriteAnimeArgumentsFromJson(json);

  late DeleteFavoriteAnimeInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$DeleteFavoriteAnimeArgumentsToJson(this);
}

final DELETE_FAVORITE_ANIME_MUTATION_DOCUMENT_OPERATION_NAME =
    'deleteFavoriteAnime';
final DELETE_FAVORITE_ANIME_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteFavoriteAnime'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'DeleteFavoriteAnimeInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'deleteFavoriteAnime'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'deleted'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class DeleteFavoriteAnimeMutation extends GraphQLQuery<
    DeleteFavoriteAnime$Mutation, DeleteFavoriteAnimeArguments> {
  DeleteFavoriteAnimeMutation({required this.variables});

  @override
  final DocumentNode document = DELETE_FAVORITE_ANIME_MUTATION_DOCUMENT;

  @override
  final String operationName =
      DELETE_FAVORITE_ANIME_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final DeleteFavoriteAnimeArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DeleteFavoriteAnime$Mutation parse(Map<String, dynamic> json) =>
      DeleteFavoriteAnime$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateUserArguments extends JsonSerializable with EquatableMixin {
  CreateUserArguments({required this.input});

  @override
  factory CreateUserArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateUserArgumentsFromJson(json);

  late CreateUserInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$CreateUserArgumentsToJson(this);
}

final CREATE_USER_MUTATION_DOCUMENT_OPERATION_NAME = 'createUser';
final CREATE_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'createUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'CreateUserInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'phone'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'createdAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'updatedAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class CreateUserMutation
    extends GraphQLQuery<CreateUser$Mutation, CreateUserArguments> {
  CreateUserMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_USER_MUTATION_DOCUMENT;

  @override
  final String operationName = CREATE_USER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final CreateUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CreateUser$Mutation parse(Map<String, dynamic> json) =>
      CreateUser$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SubmitVerifyRequestArguments extends JsonSerializable
    with EquatableMixin {
  SubmitVerifyRequestArguments({required this.input});

  @override
  factory SubmitVerifyRequestArguments.fromJson(Map<String, dynamic> json) =>
      _$SubmitVerifyRequestArgumentsFromJson(json);

  late SubmitVerifyRequestInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$SubmitVerifyRequestArgumentsToJson(this);
}

final SUBMIT_VERIFY_REQUEST_MUTATION_DOCUMENT_OPERATION_NAME =
    'submitVerifyRequest';
final SUBMIT_VERIFY_REQUEST_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'submitVerifyRequest'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'SubmitVerifyRequestInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'submitVerifyRequest'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'phone'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class SubmitVerifyRequestMutation extends GraphQLQuery<
    SubmitVerifyRequest$Mutation, SubmitVerifyRequestArguments> {
  SubmitVerifyRequestMutation({required this.variables});

  @override
  final DocumentNode document = SUBMIT_VERIFY_REQUEST_MUTATION_DOCUMENT;

  @override
  final String operationName =
      SUBMIT_VERIFY_REQUEST_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SubmitVerifyRequestArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SubmitVerifyRequest$Mutation parse(Map<String, dynamic> json) =>
      SubmitVerifyRequest$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AddFavoriteAnimeArguments extends JsonSerializable with EquatableMixin {
  AddFavoriteAnimeArguments({required this.input});

  @override
  factory AddFavoriteAnimeArguments.fromJson(Map<String, dynamic> json) =>
      _$AddFavoriteAnimeArgumentsFromJson(json);

  late AddFavoriteAnimeInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$AddFavoriteAnimeArgumentsToJson(this);
}

final ADD_FAVORITE_ANIME_MUTATION_DOCUMENT_OPERATION_NAME = 'addFavoriteAnime';
final ADD_FAVORITE_ANIME_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addFavoriteAnime'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'AddFavoriteAnimeInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'addFavoriteAnime'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'animes'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'title'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'cover'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              )
            ]),
          )
        ]),
      )
    ]),
  )
]);

class AddFavoriteAnimeMutation
    extends GraphQLQuery<AddFavoriteAnime$Mutation, AddFavoriteAnimeArguments> {
  AddFavoriteAnimeMutation({required this.variables});

  @override
  final DocumentNode document = ADD_FAVORITE_ANIME_MUTATION_DOCUMENT;

  @override
  final String operationName =
      ADD_FAVORITE_ANIME_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final AddFavoriteAnimeArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  AddFavoriteAnime$Mutation parse(Map<String, dynamic> json) =>
      AddFavoriteAnime$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateUserArguments extends JsonSerializable with EquatableMixin {
  UpdateUserArguments({required this.input});

  @override
  factory UpdateUserArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserArgumentsFromJson(json);

  late UpdateUserInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$UpdateUserArgumentsToJson(this);
}

final UPDATE_USER_MUTATION_DOCUMENT_OPERATION_NAME = 'updateUser';
final UPDATE_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateUserInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'phone'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'role'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'birthday'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'bio'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'gender'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'desiredGender'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'verified'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'school'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'occupation'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'hasLocationHidden'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class UpdateUserMutation
    extends GraphQLQuery<UpdateUser$Mutation, UpdateUserArguments> {
  UpdateUserMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_USER_MUTATION_DOCUMENT;

  @override
  final String operationName = UPDATE_USER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateUser$Mutation parse(Map<String, dynamic> json) =>
      UpdateUser$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SendMessageArguments extends JsonSerializable with EquatableMixin {
  SendMessageArguments({required this.input});

  @override
  factory SendMessageArguments.fromJson(Map<String, dynamic> json) =>
      _$SendMessageArgumentsFromJson(json);

  late SendMessageInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$SendMessageArgumentsToJson(this);
}

final SEND_MESSAGE_MUTATION_DOCUMENT_OPERATION_NAME = 'sendMessage';
final SEND_MESSAGE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'sendMessage'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'SendMessageInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'sendMessage'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'message'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'content'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'senderId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'conversationId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'reaction'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class SendMessageMutation
    extends GraphQLQuery<SendMessage$Mutation, SendMessageArguments> {
  SendMessageMutation({required this.variables});

  @override
  final DocumentNode document = SEND_MESSAGE_MUTATION_DOCUMENT;

  @override
  final String operationName = SEND_MESSAGE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SendMessageArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SendMessage$Mutation parse(Map<String, dynamic> json) =>
      SendMessage$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeletePhotoArguments extends JsonSerializable with EquatableMixin {
  DeletePhotoArguments({required this.input});

  @override
  factory DeletePhotoArguments.fromJson(Map<String, dynamic> json) =>
      _$DeletePhotoArgumentsFromJson(json);

  late DeletePhotoInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$DeletePhotoArgumentsToJson(this);
}

final DELETE_PHOTO_MUTATION_DOCUMENT_OPERATION_NAME = 'deletePhoto';
final DELETE_PHOTO_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deletePhoto'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'DeletePhotoInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'deletePhoto'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'deleted'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gallery'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'photos'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'order'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'url'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              )
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class DeletePhotoMutation
    extends GraphQLQuery<DeletePhoto$Mutation, DeletePhotoArguments> {
  DeletePhotoMutation({required this.variables});

  @override
  final DocumentNode document = DELETE_PHOTO_MUTATION_DOCUMENT;

  @override
  final String operationName = DELETE_PHOTO_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final DeletePhotoArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DeletePhoto$Mutation parse(Map<String, dynamic> json) =>
      DeletePhoto$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateMessageArguments extends JsonSerializable with EquatableMixin {
  UpdateMessageArguments({required this.input});

  @override
  factory UpdateMessageArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateMessageArgumentsFromJson(json);

  late UpdateMessageInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$UpdateMessageArgumentsToJson(this);
}

final UPDATE_MESSAGE_MUTATION_DOCUMENT_OPERATION_NAME = 'updateMessage';
final UPDATE_MESSAGE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateMessage'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateMessageInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateMessage'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'message'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'reaction'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class UpdateMessageMutation
    extends GraphQLQuery<UpdateMessage$Mutation, UpdateMessageArguments> {
  UpdateMessageMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_MESSAGE_MUTATION_DOCUMENT;

  @override
  final String operationName = UPDATE_MESSAGE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateMessageArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateMessage$Mutation parse(Map<String, dynamic> json) =>
      UpdateMessage$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ValidatePhoneArguments extends JsonSerializable with EquatableMixin {
  ValidatePhoneArguments({required this.input});

  @override
  factory ValidatePhoneArguments.fromJson(Map<String, dynamic> json) =>
      _$ValidatePhoneArgumentsFromJson(json);

  late ValidatePhoneInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$ValidatePhoneArgumentsToJson(this);
}

final VALIDATE_PHONE_MUTATION_DOCUMENT_OPERATION_NAME = 'validatePhone';
final VALIDATE_PHONE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'validatePhone'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'ValidatePhoneInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'validatePhone'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'phone'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'createdAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'updatedAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'token'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'profileFilled'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class ValidatePhoneMutation
    extends GraphQLQuery<ValidatePhone$Mutation, ValidatePhoneArguments> {
  ValidatePhoneMutation({required this.variables});

  @override
  final DocumentNode document = VALIDATE_PHONE_MUTATION_DOCUMENT;

  @override
  final String operationName = VALIDATE_PHONE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final ValidatePhoneArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ValidatePhone$Mutation parse(Map<String, dynamic> json) =>
      ValidatePhone$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetDistanceBetweenUsersArguments extends JsonSerializable
    with EquatableMixin {
  GetDistanceBetweenUsersArguments({required this.input});

  @override
  factory GetDistanceBetweenUsersArguments.fromJson(
          Map<String, dynamic> json) =>
      _$GetDistanceBetweenUsersArgumentsFromJson(json);

  late GetDistanceBetweenUsersInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() =>
      _$GetDistanceBetweenUsersArgumentsToJson(this);
}

final GET_DISTANCE_BETWEEN_USERS_MUTATION_DOCUMENT_OPERATION_NAME =
    'getDistanceBetweenUsers';
final GET_DISTANCE_BETWEEN_USERS_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'getDistanceBetweenUsers'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'GetDistanceBetweenUsersInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getDistanceBetweenUsers'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'mi'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class GetDistanceBetweenUsersMutation extends GraphQLQuery<
    GetDistanceBetweenUsers$Mutation, GetDistanceBetweenUsersArguments> {
  GetDistanceBetweenUsersMutation({required this.variables});

  @override
  final DocumentNode document = GET_DISTANCE_BETWEEN_USERS_MUTATION_DOCUMENT;

  @override
  final String operationName =
      GET_DISTANCE_BETWEEN_USERS_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final GetDistanceBetweenUsersArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetDistanceBetweenUsers$Mutation parse(Map<String, dynamic> json) =>
      GetDistanceBetweenUsers$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AddFavoriteMusicArguments extends JsonSerializable with EquatableMixin {
  AddFavoriteMusicArguments({required this.input});

  @override
  factory AddFavoriteMusicArguments.fromJson(Map<String, dynamic> json) =>
      _$AddFavoriteMusicArgumentsFromJson(json);

  late AddFavoriteMusicInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$AddFavoriteMusicArgumentsToJson(this);
}

final ADD_FAVORITE_MUSIC_MUTATION_DOCUMENT_OPERATION_NAME = 'addFavoriteMusic';
final ADD_FAVORITE_MUSIC_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addFavoriteMusic'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'AddFavoriteMusicInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'addFavoriteMusic'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'favoriteMusic'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'musicType'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'trackName'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'artistName'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'coverUrl'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'spotifyId'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class AddFavoriteMusicMutation
    extends GraphQLQuery<AddFavoriteMusic$Mutation, AddFavoriteMusicArguments> {
  AddFavoriteMusicMutation({required this.variables});

  @override
  final DocumentNode document = ADD_FAVORITE_MUSIC_MUTATION_DOCUMENT;

  @override
  final String operationName =
      ADD_FAVORITE_MUSIC_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final AddFavoriteMusicArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  AddFavoriteMusic$Mutation parse(Map<String, dynamic> json) =>
      AddFavoriteMusic$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ResendVerifyCodeArguments extends JsonSerializable with EquatableMixin {
  ResendVerifyCodeArguments({required this.input});

  @override
  factory ResendVerifyCodeArguments.fromJson(Map<String, dynamic> json) =>
      _$ResendVerifyCodeArgumentsFromJson(json);

  late ResendVerifyTextInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$ResendVerifyCodeArgumentsToJson(this);
}

final RESEND_VERIFY_CODE_MUTATION_DOCUMENT_OPERATION_NAME = 'resendVerifyCode';
final RESEND_VERIFY_CODE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'resendVerifyCode'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'ResendVerifyTextInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'resendVerifyText'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'phone'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class ResendVerifyCodeMutation
    extends GraphQLQuery<ResendVerifyCode$Mutation, ResendVerifyCodeArguments> {
  ResendVerifyCodeMutation({required this.variables});

  @override
  final DocumentNode document = RESEND_VERIFY_CODE_MUTATION_DOCUMENT;

  @override
  final String operationName =
      RESEND_VERIFY_CODE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final ResendVerifyCodeArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ResendVerifyCode$Mutation parse(Map<String, dynamic> json) =>
      ResendVerifyCode$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class LikeUserArguments extends JsonSerializable with EquatableMixin {
  LikeUserArguments({required this.input});

  @override
  factory LikeUserArguments.fromJson(Map<String, dynamic> json) =>
      _$LikeUserArgumentsFromJson(json);

  late LikeUserInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$LikeUserArgumentsToJson(this);
}

final LIKE_USER_MUTATION_DOCUMENT_OPERATION_NAME = 'likeUser';
final LIKE_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'likeUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'LikeUserInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'likeUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'like'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'userId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'likeeId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'likeType'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'match'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'conversation'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'matchee'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'phone'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'firstName'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'verified'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'gallery'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'photos'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'order'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'url'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'id'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      )
                    ]),
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'user'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'phone'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'firstName'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'verified'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'gallery'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'photos'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'order'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'url'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'id'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      )
                    ]),
                  ),
                ]),
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class LikeUserMutation
    extends GraphQLQuery<LikeUser$Mutation, LikeUserArguments> {
  LikeUserMutation({required this.variables});

  @override
  final DocumentNode document = LIKE_USER_MUTATION_DOCUMENT;

  @override
  final String operationName = LIKE_USER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final LikeUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  LikeUser$Mutation parse(Map<String, dynamic> json) =>
      LikeUser$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteUserArguments extends JsonSerializable with EquatableMixin {
  DeleteUserArguments({required this.input});

  @override
  factory DeleteUserArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserArgumentsFromJson(json);

  late DeleteUserInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$DeleteUserArgumentsToJson(this);
}

final DELETE_USER_MUTATION_DOCUMENT_OPERATION_NAME = 'deleteUser';
final DELETE_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'DeleteUserInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'deleteUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'softDeletedUser'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'phone'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'verified'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class DeleteUserMutation
    extends GraphQLQuery<DeleteUser$Mutation, DeleteUserArguments> {
  DeleteUserMutation({required this.variables});

  @override
  final DocumentNode document = DELETE_USER_MUTATION_DOCUMENT;

  @override
  final String operationName = DELETE_USER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final DeleteUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DeleteUser$Mutation parse(Map<String, dynamic> json) =>
      DeleteUser$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SignInArguments extends JsonSerializable with EquatableMixin {
  SignInArguments({required this.input});

  @override
  factory SignInArguments.fromJson(Map<String, dynamic> json) =>
      _$SignInArgumentsFromJson(json);

  late SignInInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$SignInArgumentsToJson(this);
}

final SIGN_IN_MUTATION_DOCUMENT_OPERATION_NAME = 'signIn';
final SIGN_IN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'signIn'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'SignInInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'signIn'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentSignInAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'lastSignInAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'phone'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class SignInMutation extends GraphQLQuery<SignIn$Mutation, SignInArguments> {
  SignInMutation({required this.variables});

  @override
  final DocumentNode document = SIGN_IN_MUTATION_DOCUMENT;

  @override
  final String operationName = SIGN_IN_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SignInArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SignIn$Mutation parse(Map<String, dynamic> json) =>
      SignIn$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ReorderPhotosArguments extends JsonSerializable with EquatableMixin {
  ReorderPhotosArguments({required this.input});

  @override
  factory ReorderPhotosArguments.fromJson(Map<String, dynamic> json) =>
      _$ReorderPhotosArgumentsFromJson(json);

  late ReorderPhotosInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$ReorderPhotosArgumentsToJson(this);
}

final REORDER_PHOTOS_MUTATION_DOCUMENT_OPERATION_NAME = 'reorderPhotos';
final REORDER_PHOTOS_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'reorderPhotos'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'ReorderPhotosInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'reorderPhotos'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'photo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'order'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'url'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class ReorderPhotosMutation
    extends GraphQLQuery<ReorderPhotos$Mutation, ReorderPhotosArguments> {
  ReorderPhotosMutation({required this.variables});

  @override
  final DocumentNode document = REORDER_PHOTOS_MUTATION_DOCUMENT;

  @override
  final String operationName = REORDER_PHOTOS_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final ReorderPhotosArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ReorderPhotos$Mutation parse(Map<String, dynamic> json) =>
      ReorderPhotos$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SetUserLocationArguments extends JsonSerializable with EquatableMixin {
  SetUserLocationArguments({required this.input});

  @override
  factory SetUserLocationArguments.fromJson(Map<String, dynamic> json) =>
      _$SetUserLocationArgumentsFromJson(json);

  late SetUserLocationInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$SetUserLocationArgumentsToJson(this);
}

final SET_USER_LOCATION_MUTATION_DOCUMENT_OPERATION_NAME = 'setUserLocation';
final SET_USER_LOCATION_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'setUserLocation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'SetUserLocationInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'setUserLocation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'lonlat'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'displayCity'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'displayState'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class SetUserLocationMutation
    extends GraphQLQuery<SetUserLocation$Mutation, SetUserLocationArguments> {
  SetUserLocationMutation({required this.variables});

  @override
  final DocumentNode document = SET_USER_LOCATION_MUTATION_DOCUMENT;

  @override
  final String operationName =
      SET_USER_LOCATION_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SetUserLocationArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SetUserLocation$Mutation parse(Map<String, dynamic> json) =>
      SetUserLocation$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UndoLikeArguments extends JsonSerializable with EquatableMixin {
  UndoLikeArguments({required this.input});

  @override
  factory UndoLikeArguments.fromJson(Map<String, dynamic> json) =>
      _$UndoLikeArgumentsFromJson(json);

  late UndoLikeInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$UndoLikeArgumentsToJson(this);
}

final UNDO_LIKE_MUTATION_DOCUMENT_OPERATION_NAME = 'undoLike';
final UNDO_LIKE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'undoLike'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UndoLikeInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'undoLike'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'undidUser'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class UndoLikeMutation
    extends GraphQLQuery<UndoLike$Mutation, UndoLikeArguments> {
  UndoLikeMutation({required this.variables});

  @override
  final DocumentNode document = UNDO_LIKE_MUTATION_DOCUMENT;

  @override
  final String operationName = UNDO_LIKE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UndoLikeArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UndoLike$Mutation parse(Map<String, dynamic> json) =>
      UndoLike$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UploadPhotoArguments extends JsonSerializable with EquatableMixin {
  UploadPhotoArguments({required this.input});

  @override
  factory UploadPhotoArguments.fromJson(Map<String, dynamic> json) =>
      _$UploadPhotoArgumentsFromJson(json);

  late UploadPhotoInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$UploadPhotoArgumentsToJson(this);
}

final UPLOAD_PHOTO_MUTATION_DOCUMENT_OPERATION_NAME = 'uploadPhoto';
final UPLOAD_PHOTO_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'uploadPhoto'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UploadPhotoInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'uploadPhoto'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'gallery'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'photos'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'order'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'url'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  )
                ]),
              )
            ]),
          )
        ]),
      )
    ]),
  )
]);

class UploadPhotoMutation
    extends GraphQLQuery<UploadPhoto$Mutation, UploadPhotoArguments> {
  UploadPhotoMutation({required this.variables});

  @override
  final DocumentNode document = UPLOAD_PHOTO_MUTATION_DOCUMENT;

  @override
  final String operationName = UPLOAD_PHOTO_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UploadPhotoArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UploadPhoto$Mutation parse(Map<String, dynamic> json) =>
      UploadPhoto$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DeleteFavoriteMusicArguments extends JsonSerializable
    with EquatableMixin {
  DeleteFavoriteMusicArguments({required this.input});

  @override
  factory DeleteFavoriteMusicArguments.fromJson(Map<String, dynamic> json) =>
      _$DeleteFavoriteMusicArgumentsFromJson(json);

  late DeleteFavoriteMusicInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$DeleteFavoriteMusicArgumentsToJson(this);
}

final DELETE_FAVORITE_MUSIC_MUTATION_DOCUMENT_OPERATION_NAME =
    'deleteFavoriteMusic';
final DELETE_FAVORITE_MUSIC_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'deleteFavoriteMusic'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'DeleteFavoriteMusicInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'deleteFavoriteMusic'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'deleted'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class DeleteFavoriteMusicMutation extends GraphQLQuery<
    DeleteFavoriteMusic$Mutation, DeleteFavoriteMusicArguments> {
  DeleteFavoriteMusicMutation({required this.variables});

  @override
  final DocumentNode document = DELETE_FAVORITE_MUSIC_MUTATION_DOCUMENT;

  @override
  final String operationName =
      DELETE_FAVORITE_MUSIC_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final DeleteFavoriteMusicArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DeleteFavoriteMusic$Mutation parse(Map<String, dynamic> json) =>
      DeleteFavoriteMusic$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class FetchMessagesArguments extends JsonSerializable with EquatableMixin {
  FetchMessagesArguments({
    required this.conversationId,
    this.page,
  });

  @override
  factory FetchMessagesArguments.fromJson(Map<String, dynamic> json) =>
      _$FetchMessagesArgumentsFromJson(json);

  late String conversationId;

  final int? page;

  @override
  List<Object?> get props => [conversationId, page];
  @override
  Map<String, dynamic> toJson() => _$FetchMessagesArgumentsToJson(this);
}

final FETCH_MESSAGES_QUERY_DOCUMENT_OPERATION_NAME = 'fetchMessages';
final FETCH_MESSAGES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetchMessages'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'conversationId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'page')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'fetchMessages'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'conversationId'),
            value: VariableNode(name: NameNode(value: 'conversationId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'page'),
            value: VariableNode(name: NameNode(value: 'page')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'attachment'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'attachmentType'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'reaction'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'read'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'senderId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'recommendation'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'userId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'recommendeeId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'anime'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'title'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'cover'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'sticker'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'url'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class FetchMessagesQuery
    extends GraphQLQuery<FetchMessages$Query, FetchMessagesArguments> {
  FetchMessagesQuery({required this.variables});

  @override
  final DocumentNode document = FETCH_MESSAGES_QUERY_DOCUMENT;

  @override
  final String operationName = FETCH_MESSAGES_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final FetchMessagesArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  FetchMessages$Query parse(Map<String, dynamic> json) =>
      FetchMessages$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class FetchFeedArguments extends JsonSerializable with EquatableMixin {
  FetchFeedArguments({required this.params});

  @override
  factory FetchFeedArguments.fromJson(Map<String, dynamic> json) =>
      _$FetchFeedArgumentsFromJson(json);

  late FetchFeedInput params;

  @override
  List<Object?> get props => [params];
  @override
  Map<String, dynamic> toJson() => _$FetchFeedArgumentsToJson(this);
}

final FETCH_FEED_QUERY_DOCUMENT_OPERATION_NAME = 'fetchFeed';
final FETCH_FEED_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetchFeed'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'params')),
        type: NamedTypeNode(
          name: NameNode(value: 'FetchFeedInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'fetchFeed'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'params'),
            value: VariableNode(name: NameNode(value: 'params')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'birthday'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'premium'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'occupation'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'school'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'currentSignInAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'currentSignInIp'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gender'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'desiredGender'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'bio'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'verified'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'onlineStatus'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gallery'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'photos'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'order'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'url'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'animes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'title'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'cover'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'favoriteMusic'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'trackName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'artistName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'coverUrl'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'musicType'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'spotifyId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'hasLocationHidden'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'superLikeCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class FetchFeedQuery extends GraphQLQuery<FetchFeed$Query, FetchFeedArguments> {
  FetchFeedQuery({required this.variables});

  @override
  final DocumentNode document = FETCH_FEED_QUERY_DOCUMENT;

  @override
  final String operationName = FETCH_FEED_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final FetchFeedArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  FetchFeed$Query parse(Map<String, dynamic> json) =>
      FetchFeed$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class FetchUserArguments extends JsonSerializable with EquatableMixin {
  FetchUserArguments({required this.userId});

  @override
  factory FetchUserArguments.fromJson(Map<String, dynamic> json) =>
      _$FetchUserArgumentsFromJson(json);

  late String userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$FetchUserArgumentsToJson(this);
}

final FETCH_USER_QUERY_DOCUMENT_OPERATION_NAME = 'fetchUser';
final FETCH_USER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetchUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'fetchUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userId'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'role'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'birthday'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'bio'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gender'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'desiredGender'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'verified'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'school'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'occupation'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'displayCity'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'displayState'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'spotifyEmail'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'onlineStatus'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lonlat'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'matches'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'matcheeId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'conversation'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'gallery'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'photos'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'order'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'url'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'animes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'title'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'cover'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'favoriteMusic'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'coverUrl'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'musicType'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'trackName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'artistName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'spotifyId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'premium'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'superLikeCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'hasLocationHidden'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class FetchUserQuery extends GraphQLQuery<FetchUser$Query, FetchUserArguments> {
  FetchUserQuery({required this.variables});

  @override
  final DocumentNode document = FETCH_USER_QUERY_DOCUMENT;

  @override
  final String operationName = FETCH_USER_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final FetchUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  FetchUser$Query parse(Map<String, dynamic> json) =>
      FetchUser$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class FetchAnimeArguments extends JsonSerializable with EquatableMixin {
  FetchAnimeArguments({required this.params});

  @override
  factory FetchAnimeArguments.fromJson(Map<String, dynamic> json) =>
      _$FetchAnimeArgumentsFromJson(json);

  late AnimeInput params;

  @override
  List<Object?> get props => [params];
  @override
  Map<String, dynamic> toJson() => _$FetchAnimeArgumentsToJson(this);
}

final FETCH_ANIME_QUERY_DOCUMENT_OPERATION_NAME = 'fetchAnime';
final FETCH_ANIME_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetchAnime'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'params')),
        type: NamedTypeNode(
          name: NameNode(value: 'AnimeInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'fetchAnime'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'params'),
            value: VariableNode(name: NameNode(value: 'params')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'genres'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cover'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'episodes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'popularity'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'averageScore'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'startDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'endDate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'studios'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'year'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class FetchAnimeQuery
    extends GraphQLQuery<FetchAnime$Query, FetchAnimeArguments> {
  FetchAnimeQuery({required this.variables});

  @override
  final DocumentNode document = FETCH_ANIME_QUERY_DOCUMENT;

  @override
  final String operationName = FETCH_ANIME_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final FetchAnimeArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  FetchAnime$Query parse(Map<String, dynamic> json) =>
      FetchAnime$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class FetchConversationsArguments extends JsonSerializable with EquatableMixin {
  FetchConversationsArguments({required this.userId});

  @override
  factory FetchConversationsArguments.fromJson(Map<String, dynamic> json) =>
      _$FetchConversationsArgumentsFromJson(json);

  late String userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$FetchConversationsArgumentsToJson(this);
}

final FETCH_CONVERSATIONS_QUERY_DOCUMENT_OPERATION_NAME = 'fetchConversations';
final FETCH_CONVERSATIONS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetchConversations'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'fetchConversations'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userId'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'match'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'createdAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'user'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'onlineStatus'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'firstName'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'gallery'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'photos'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'order'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'url'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      )
                    ]),
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'matchee'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'onlineStatus'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'firstName'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'gallery'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'photos'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'order'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'url'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      )
                    ]),
                  ),
                ]),
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'lastMessage'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'attachment'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'attachmentType'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'content'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'createdAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'reaction'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'read'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'senderId'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'recommendation'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'userId'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'recommendeeId'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'anime'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'title'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'cover'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'sticker'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'url'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'unreadCount'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'userId'),
                value: VariableNode(name: NameNode(value: 'userId')),
              )
            ],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class FetchConversationsQuery extends GraphQLQuery<FetchConversations$Query,
    FetchConversationsArguments> {
  FetchConversationsQuery({required this.variables});

  @override
  final DocumentNode document = FETCH_CONVERSATIONS_QUERY_DOCUMENT;

  @override
  final String operationName =
      FETCH_CONVERSATIONS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final FetchConversationsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  FetchConversations$Query parse(Map<String, dynamic> json) =>
      FetchConversations$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class FetchVerifyRequestsArguments extends JsonSerializable
    with EquatableMixin {
  FetchVerifyRequestsArguments({required this.userId});

  @override
  factory FetchVerifyRequestsArguments.fromJson(Map<String, dynamic> json) =>
      _$FetchVerifyRequestsArgumentsFromJson(json);

  late String userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$FetchVerifyRequestsArgumentsToJson(this);
}

final FETCH_VERIFY_REQUESTS_QUERY_DOCUMENT_OPERATION_NAME =
    'fetchVerifyRequests';
final FETCH_VERIFY_REQUESTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetchVerifyRequests'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'fetchVerifyRequests'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userId'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'userId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class FetchVerifyRequestsQuery extends GraphQLQuery<FetchVerifyRequests$Query,
    FetchVerifyRequestsArguments> {
  FetchVerifyRequestsQuery({required this.variables});

  @override
  final DocumentNode document = FETCH_VERIFY_REQUESTS_QUERY_DOCUMENT;

  @override
  final String operationName =
      FETCH_VERIFY_REQUESTS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final FetchVerifyRequestsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  FetchVerifyRequests$Query parse(Map<String, dynamic> json) =>
      FetchVerifyRequests$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class FetchStickersArguments extends JsonSerializable with EquatableMixin {
  FetchStickersArguments({required this.page});

  @override
  factory FetchStickersArguments.fromJson(Map<String, dynamic> json) =>
      _$FetchStickersArgumentsFromJson(json);

  late int page;

  @override
  List<Object?> get props => [page];
  @override
  Map<String, dynamic> toJson() => _$FetchStickersArgumentsToJson(this);
}

final FETCH_STICKERS_QUERY_DOCUMENT_OPERATION_NAME = 'fetchStickers';
final FETCH_STICKERS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetchStickers'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'page')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'fetchStickers'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'page'),
            value: VariableNode(name: NameNode(value: 'page')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class FetchStickersQuery
    extends GraphQLQuery<FetchStickers$Query, FetchStickersArguments> {
  FetchStickersQuery({required this.variables});

  @override
  final DocumentNode document = FETCH_STICKERS_QUERY_DOCUMENT;

  @override
  final String operationName = FETCH_STICKERS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final FetchStickersArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  FetchStickers$Query parse(Map<String, dynamic> json) =>
      FetchStickers$Query.fromJson(json);
}
