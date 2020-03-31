// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song(
      json['headers'] == null
          ? null
          : Headers.fromJson(json['headers'] as Map<String, dynamic>),
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : Results.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SongToJson(Song instance) =>
    <String, dynamic>{'headers': instance.headers, 'results': instance.results};

Headers _$HeadersFromJson(Map<String, dynamic> json) {
  return Headers(
      json['status'] as String,
      json['code'] as int,
      json['error_message'] as String,
      json['warnings'] as String,
      json['results_count'] as int,
      json['next'] as String);
}

Map<String, dynamic> _$HeadersToJson(Headers instance) => <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'error_message': instance.errorMessage,
      'warnings': instance.warnings,
      'results_count': instance.resultsCount,
      'next': instance.next
    };

Results _$ResultsFromJson(Map<String, dynamic> json) {
  return Results(
      json['id'] as String,
      json['name'] as String,
      json['duration'] as int,
      json['artist_name'] as String,
      json['album_name'] as String,
      json['album_id'] as String,
      json['license_ccurl'] as String,
      json['album_image'] as String,
      json['audio'] as String,
      json['audiodownload'] as String);
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.songid,
      'name': instance.name,
      'duration': instance.duration,
      'artist_name': instance.artistName,
      'album_name': instance.albumName,
      'album_id': instance.albumId,
      'license_ccurl': instance.licenseCcurl,
      'album_image': instance.albumImage,
      'audio': instance.audio,
      'audiodownload': instance.audiodownload
    };
