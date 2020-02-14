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
      json['artist_id'] as String,
      json['artist_name'] as String,
      json['artist_idstr'] as String,
      json['album_name'] as String,
      json['album_id'] as String,
      json['license_ccurl'] as String,
      json['position'] as int,
      json['releasedate'] as String,
      json['album_image'] as String,
      json['audio'] as String,
      json['audiodownload'] as String,
      json['prourl'] as String,
      json['shorturl'] as String,
      json['shareurl'] as String,
      json['lyrics'] as String,
      json['waveform'] as String,
      json['image'] as String);
}

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'artist_id': instance.artistId,
      'artist_name': instance.artistName,
      'artist_idstr': instance.artistIdstr,
      'album_name': instance.albumName,
      'album_id': instance.albumId,
      'license_ccurl': instance.licenseCcurl,
      'position': instance.position,
      'releasedate': instance.releasedate,
      'album_image': instance.albumImage,
      'audio': instance.audio,
      'audiodownload': instance.audiodownload,
      'prourl': instance.prourl,
      'shorturl': instance.shorturl,
      'shareurl': instance.shareurl,
      'lyrics': instance.lyrics,
      'waveform': instance.waveform,
      'image': instance.image
    };
