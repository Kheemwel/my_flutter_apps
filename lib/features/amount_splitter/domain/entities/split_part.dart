import 'package:freezed_annotation/freezed_annotation.dart';

part 'split_part.freezed.dart';

@freezed
abstract class SplitPart with _$SplitPart {
  const factory SplitPart({required int id, required int amount}) = _SplitPart;
}
