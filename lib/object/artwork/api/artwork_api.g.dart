// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtworkApi _$ArtworkApiFromJson(Map<String, dynamic> json) => ArtworkApi(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      apiLink: json['api_link'] as String?,
      dateDisplay: json['date_display'] as String?,
      artistDisplay: json['artist_display'] as String?,
    );

Map<String, dynamic> _$ArtworkApiToJson(ArtworkApi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'api_link': instance.apiLink,
      'date_display': instance.dateDisplay,
      'artist_display': instance.artistDisplay,
    };
