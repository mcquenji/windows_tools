// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Settings _$$_SettingsFromJson(Map<String, dynamic> json) => _$_Settings(
      language: json['language'] == null
          ? const Locale("en")
          : _localeFromJson(json['language'] as Map<String, dynamic>),
      autoCheckUpdates: json['autoCheckUpdates'] as bool? ?? true,
    );

Map<String, dynamic> _$$_SettingsToJson(_$_Settings instance) =>
    <String, dynamic>{
      'language': _localeToJson(instance.language),
      'autoCheckUpdates': instance.autoCheckUpdates,
    };
