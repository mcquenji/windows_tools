// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateInfo _$$_UpdateInfoFromJson(Map<String, dynamic> json) =>
    _$_UpdateInfo(
      updateAvailable: json['updateAvailable'] as bool? ?? false,
      latestVersion: json['latestVersion'] as String? ?? "",
      errorMessage: json['errorMessage'] as String? ?? null,
      downloadUrl: json['downloadUrl'] as String? ?? "",
      installProgress: (json['installProgress'] as num?)?.toDouble() ?? null,
      checking: json['checking'] as bool? ?? false,
    );

Map<String, dynamic> _$$_UpdateInfoToJson(_$_UpdateInfo instance) =>
    <String, dynamic>{
      'updateAvailable': instance.updateAvailable,
      'latestVersion': instance.latestVersion,
      'errorMessage': instance.errorMessage,
      'downloadUrl': instance.downloadUrl,
      'installProgress': instance.installProgress,
      'checking': instance.checking,
    };
