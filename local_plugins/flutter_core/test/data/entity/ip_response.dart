import 'package:freezed_annotation/freezed_annotation.dart';

part 'ip_response.freezed.dart';
part 'ip_response.g.dart';

@freezed
abstract class IpResponse with _$IpResponse{
  const factory IpResponse({
    required String origin
  }) = _IpResponse;

  factory IpResponse.fromJson(Map<String, Object?> json) => _$IpResponseFromJson(json);
}