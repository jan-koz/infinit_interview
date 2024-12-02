import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_interview/logic/events/events_repository.dart';
import 'package:injectable/injectable.dart';
import 'event_list_state.dart';

@injectable
class EventListCubit extends Cubit<EventListState> {
  final EventsRepository eventsRepository;

  EventListCubit(this.eventsRepository) : super(const EventListState.initial());

  Future<void> fetchEvents() async {
    emit(const EventListState.loading());
    try {
      final events = await eventsRepository.fetchEvents();
      emit(EventListState.loaded(events));
    } catch (e) {
      emit(EventListState.error('Failed to load events: ${e.toString()}'));
    }
  }
}
