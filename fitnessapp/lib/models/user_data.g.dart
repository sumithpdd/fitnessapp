// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData()
  ..currentUserId = json['currentUserId'] as String?
  ..height = json['height'] as int
  ..weight = json['weight'] as int
  ..age = json['age'] as int
  ..bmi = (json['bmi'] as num).toDouble()
  ..bmicategory = json['bmicategory'] as String
  ..bmifatpercentage = (json['bmifatpercentage'] as num).toDouble()
  ..gender = _$enumDecodeNullable(_$GenderEnumMap, json['gender'])
  ..created = UserData._fromJson(json['created'] as Timestamp)
  ..updated = UserData._fromJson(json['updated'] as Timestamp);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'currentUserId': instance.currentUserId,
      'height': instance.height,
      'weight': instance.weight,
      'age': instance.age,
      'bmi': instance.bmi,
      'bmicategory': instance.bmicategory,
      'bmifatpercentage': instance.bmifatpercentage,
      'gender': _$GenderEnumMap[instance.gender],
      'created': UserData._toJson(instance.created),
      'updated': UserData._toJson(instance.updated),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
};
