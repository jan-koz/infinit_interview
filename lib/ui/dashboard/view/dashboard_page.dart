import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_interview/core/di/dependencies_container.dart';
import 'package:infinit_interview/ui/dashboard/cubit/event_list_cubit.dart';
import 'package:infinit_interview/ui/dashboard/cubit/event_list_state.dart';
import 'package:infinit_interview/ui/dashboard/view/components/event_item.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<EventListCubit>()..fetchEvents(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
        ),
        body: BlocBuilder<EventListCubit, EventListState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text('Welcome!')),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (events) => RefreshIndicator(
                onRefresh: () => context.read<EventListCubit>().fetchEvents(),
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return EventItem(event: event);
                  },
                ),
              ),
              error: (message) => Center(child: Text(message)),
            );
          },
        ),
      ),
    );
  }
}
