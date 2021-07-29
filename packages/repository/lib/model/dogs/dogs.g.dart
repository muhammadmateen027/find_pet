// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dogs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dogs _$DogsFromJson(Map<String, dynamic> json) {
  return Dogs(
    message:
        (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$DogsToJson(Dogs instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
