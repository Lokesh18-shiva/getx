import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';
@freezed
class TestModel with _$TestModel {
  // @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory TestModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'first_name') String? firstname,
    @JsonKey(name: 'last_name') String? lastname,
    @JsonKey(name: 'avatar') String? avatar,
    

  }) = _TestModel;

  factory TestModel.fromJson(Map<String, dynamic> json) =>
      _$TestModelFromJson(json);
}