// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_grid_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageGridModel _$ImageGridModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_ImageGridModel',
      json,
      ($checkedConvert) {
        final val = _ImageGridModel(
          colIndex:
              $checkedConvert('vertical_index', (v) => (v as num).toInt()),
          rowIndex: $checkedConvert(
              'horizontal_index', (v) => (v as num?)?.toInt() ?? 0),
          localPath: $checkedConvert('localPath', (v) => v as String? ?? ""),
        );
        return val;
      },
      fieldKeyMap: const {
        'colIndex': 'vertical_index',
        'rowIndex': 'horizontal_index'
      },
    );

Map<String, dynamic> _$ImageGridModelToJson(_ImageGridModel instance) =>
    <String, dynamic>{
      'vertical_index': instance.colIndex,
      'horizontal_index': instance.rowIndex,
      'localPath': instance.localPath,
    };
