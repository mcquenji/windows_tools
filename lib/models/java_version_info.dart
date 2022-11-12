import 'package:freezed_annotation/freezed_annotation.dart';

part 'java_version_info.freezed.dart';
part 'java_version_info.g.dart';

@freezed

///  Information about installed Java versions.
class JavaVersionInfo with _$JavaVersionInfo {
  ///  Information about installed Java versions.
  factory JavaVersionInfo() = _JavaVersionInfo;

  ///  Information about installed Java versions from json.
  factory JavaVersionInfo.fromJson(Map<String, dynamic> json) => _$JavaVersionInfoFromJson(json);
}
