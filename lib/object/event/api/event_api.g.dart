// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventApi _$EventApiFromJson(Map<String, dynamic> json) => EventApi(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String?,
      imageUrl: json['image_url'] as String?,
      shortDescription: json['short_description'] as String?,
      location: json['location'] as String?,
      startTime: json['start_time'] as String?,
    );

Map<String, dynamic> _$EventApiToJson(EventApi instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.imageUrl,
      'short_description': instance.shortDescription,
      'location': instance.location,
      'start_time': instance.startTime,
    };
