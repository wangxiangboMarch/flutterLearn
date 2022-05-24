// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'News.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      json['id'] as String,
      json['publishTime'] as String,
      json['title'] as String,
      json['subTitle'] as String,
      json['image'] as String,
      json['rectangleImage'] as String,
      json['url'] as String,
      json['tagImage'] as String,
      json['readCount'] as String,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'publishTime': instance.publishTime,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'image': instance.image,
      'rectangleImage': instance.rectangleImage,
      'url': instance.url,
      'tagImage': instance.tagImage,
      'readCount': instance.readCount,
    };
