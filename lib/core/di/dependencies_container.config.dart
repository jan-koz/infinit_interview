// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../logic/api/artworks/artworks_api.dart' as _i672;
import '../../logic/api/events/events_api.dart' as _i1036;
import '../../logic/artworks/artworks_repository.dart' as _i645;
import '../../logic/events/events_repository.dart' as _i676;
import '../../ui/artworks_list/cubit/artwork_list_cubit.dart' as _i154;
import '../../ui/dashboard/cubit/event_list_cubit.dart' as _i589;
import '../../ui/home/cubit/home_cubit.dart' as _i177;
import '../dio/dio.dart' as _i889;
import '../dio/dio_config.dart' as _i913;
import '../utils/app_bloc_observer.dart' as _i1015;
import '../utils/logger.dart' as _i221;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioProvider = _$DioProvider();
    gh.factory<_i177.HomeCubit>(() => _i177.HomeCubit());
    gh.factory<_i221.AppLogger>(() => _i221.AppLogger());
    gh.factory<_i913.IConfig>(() => _i913.DioConfig());
    gh.factory<_i1015.AppBlocObserver>(
        () => _i1015.AppBlocObserver(gh<_i221.AppLogger>()));
    gh.singleton<_i361.Dio>(() => dioProvider.dio(gh<_i913.IConfig>()));
    gh.factory<_i1036.EventsApi>(() => _i1036.EventsApi(
          gh<_i361.Dio>(),
          gh<_i913.IConfig>(),
        ));
    gh.factory<_i672.ArtworksApi>(() => _i672.ArtworksApi(
          gh<_i361.Dio>(),
          gh<_i913.IConfig>(),
        ));
    gh.lazySingleton<_i645.ArtworksRepository>(
        () => _i645.ArtworksRepository(gh<_i672.ArtworksApi>()));
    gh.lazySingleton<_i676.EventsRepository>(
        () => _i676.EventsRepository(gh<_i1036.EventsApi>()));
    gh.factory<_i589.EventListCubit>(
        () => _i589.EventListCubit(gh<_i676.EventsRepository>()));
    gh.factory<_i154.ArtworkListCubit>(
        () => _i154.ArtworkListCubit(gh<_i645.ArtworksRepository>()));
    return this;
  }
}

class _$DioProvider extends _i889.DioProvider {}
