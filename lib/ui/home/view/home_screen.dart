import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinit_interview/ui/dashboard/view/dashboard_page.dart';
import 'package:infinit_interview/ui/artworks_list/view/artwork_list_page.dart';
import 'package:infinit_interview/ui/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const mainPages = [
    DashboardPage(),
    ArtworkListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavigationBarMobile(),
      body: BlocBuilder<HomeCubit, int>(
        builder: (context, state) => mainPages[state],
      ),
    );
  }
}

class NavigationBarMobile extends StatelessWidget {
  const NavigationBarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (context, state) => NavigationBar(
        onDestinationSelected: (int index) {
          context.read<HomeCubit>().changeTab(index);
        },
        indicatorColor: Theme.of(context).primaryColor,
        selectedIndex: state,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.dashboard),
            icon: Icon(Icons.dashboard_outlined),
            label: "Dashboard",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.list),
            icon: Icon(Icons.list_outlined),
            label: "List",
          ),
        ],
      ),
    );
  }
}
