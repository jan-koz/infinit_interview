import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinit_interview/object/event/app/event.dart';

part 'event_list_state.freezed.dart';

@freezed
class EventListState with _$EventListState {
  const factory EventListState.initial() = Initial;
  const factory EventListState.loading() = Loading;
  const factory EventListState.loaded(List<Event> events) = Loaded;
  const factory EventListState.error(String message) = Error;
}
