// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'environment_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EnvironmentEntry _$$_EnvironmentEntryFromJson(Map<String, dynamic> json) =>
    _$_EnvironmentEntry(
      value: json['value'] as String,
      enabled: json['enabled'] as bool,
      parent: json['parent'] as String,
      name: json['name'] as String? ?? null,
    );

Map<String, dynamic> _$$_EnvironmentEntryToJson(_$_EnvironmentEntry instance) =>
    <String, dynamic>{
      'value': instance.value,
      'enabled': instance.enabled,
      'parent': instance.parent,
      'name': instance.name,
    };
