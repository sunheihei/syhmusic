import 'package:json_annotation/json_annotation.dart'; 
  
part 'song.g.dart';


@JsonSerializable()
  class Song extends Object {

  @JsonKey(name: 'headers')
  Headers headers;

  @JsonKey(name: 'results')
  List<Results> results;

  Song(this.headers,this.results,);

  factory Song.fromJson(Map<String, dynamic> srcJson) => _$SongFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SongToJson(this);

}

  
@JsonSerializable()
  class Headers extends Object {

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'error_message')
  String errorMessage;

  @JsonKey(name: 'warnings')
  String warnings;

  @JsonKey(name: 'results_count')
  int resultsCount;

  @JsonKey(name: 'next')
  String next;

  Headers(this.status,this.code,this.errorMessage,this.warnings,this.resultsCount,this.next,);

  factory Headers.fromJson(Map<String, dynamic> srcJson) => _$HeadersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HeadersToJson(this);

}

  
@JsonSerializable()
  class Results extends Object {


  @JsonKey(name: 'id')
  String songid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'duration')
  int duration;

  @JsonKey(name: 'artist_name')
  String artistName;

  @JsonKey(name: 'album_name')
  String albumName;

  @JsonKey(name: 'album_id')
  String albumId;

  @JsonKey(name: 'license_ccurl')
  String licenseCcurl;


  @JsonKey(name: 'album_image')
  String albumImage;

  @JsonKey(name: 'audio')
  String audio;

  @JsonKey(name: 'audiodownload')
  String audiodownload;


  Results(this.songid,this.name,this.duration,this.artistName,this.albumName,this.albumId,this.licenseCcurl,this.albumImage,this.audio,this.audiodownload);

  factory Results.fromJson(Map<String, dynamic> srcJson) => _$ResultsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);

}

  
