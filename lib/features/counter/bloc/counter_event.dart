import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_event.freezed.dart';

@freezed
class CounterEvent with _$CounterEvent {
  const factory CounterEvent.incrementPressed() = IncrementPressed;
  const factory CounterEvent.decrementPressed() = DecrementPressed;
  const factory CounterEvent.resetPressed() = ResetPressed;
}
