// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateInfo _$$_UpdateInfoFromJson(Map<String, dynamic> json) =>
    _$_UpdateInfo(
      updateAvailable: json['updateAvailable'] as bool? ?? false,
      latestVersion: json['latestVersion'] as String? ?? null,
      errorMessage: json['errorMessage'] as String? ?? null,
      downloadUrl: json['downloadUrl'] as String? ?? null,
      installProgress: (json['installProgress'] as num?)?.toDouble() ?? null,
      lastChecked: json['lastChecked'] == null
          ? null
          : DateTime.parse(json['lastChecked'] as String),
      checking: json['checking'] as bool? ?? false,
      patchNotes: json['patchNotes'] as String? ?? null,
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
    );

Map<String, dynamic> _$$_UpdateInfoToJson(_$_UpdateInfo instance) =>
    <String, dynamic>{
      'updateAvailable': instance.updateAvailable,
      'latestVersion': instance.latestVersion,
      'errorMessage': instance.errorMessage,
      'downloadUrl': instance.downloadUrl,
      'installProgress': instance.installProgress,
      'lastChecked': instance.lastChecked?.toIso8601String(),
      'checking': instance.checking,
      'patchNotes': instance.patchNotes,
      'releaseDate': instance.releaseDate?.toIso8601String(),
    };
