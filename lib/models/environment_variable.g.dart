// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_variable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EnvironmentVariable _$$_EnvironmentVariableFromJson(
        Map<String, dynamic> json) =>
    _$_EnvironmentVariable(
      name: json['name'] as String,
      entries: (json['entries'] as List<dynamic>)
          .map((e) => EnvironmentEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      context:
          $enumDecode(_$EnvironmentVariableContextEnumMap, json['context']),
    );

Map<String, dynamic> _$$_EnvironmentVariableToJson(
        _$_EnvironmentVariable instance) =>
    <String, dynamic>{
      'name': instance.name,
      'entries': instance.entries,
      'context': _$EnvironmentVariableContextEnumMap[instance.context]!,
    };

const _$EnvironmentVariableContextEnumMap = {
  EnvironmentVariableContext.user: 'user',
  EnvironmentVariableContext.machine: 'machine',
};
