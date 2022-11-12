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
      modules: (json['modules'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$ModulesEnumMap, e))
              .toList() ??
          const <Modules>[],
    );

Map<String, dynamic> _$$_SettingsToJson(_$_Settings instance) =>
    <String, dynamic>{
      'language': _localeToJson(instance.language),
      'autoCheckUpdates': instance.autoCheckUpdates,
      'modules': instance.modules.map((e) => _$ModulesEnumMap[e]!).toList(),
    };

const _$ModulesEnumMap = {
  Modules.javaVersionManagement: 'javaVersionManagement',
};
