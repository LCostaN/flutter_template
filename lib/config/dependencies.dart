import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/repositories/auth/auth_repository.dart';
import '../data/repositories/auth/auth_repository_remote.dart';

/// Shared providers for all configurations.
List<SingleChildWidget> _sharedProviders = [];

/// Configure dependencies for remote data.
/// This dependency list uses repositories that connect to a remote server.
List<SingleChildWidget> get providersRemote {
  return [
    // Provider(create: (context) => ApiClient()),
    // Provider(create: (context) => SharedPreferencesService()),
    ChangeNotifierProvider(create: (context) => AuthRepositoryRemote() as AuthRepository),
    // Provider(
    //   create:
    //       (context) => UserRepositoryRemote(sharedPreferencesService: context.read())
    //               as UserRepository,
    // ),
    ..._sharedProviders,
  ];
}

/// Configure dependencies for local data.
/// This dependency list uses repositories that provide local data.
/// The user is always logged in.
// List<SingleChildWidget> get providersLocal {
//   return [
//     ChangeNotifierProvider.value(value: AuthRepositoryDev() as AuthRepository),
//     Provider.value(value: LocalDataService()),
//     Provider(
//       create:
//           (context) => DestinationRepositoryLocal(localDataService: context.read()) as DestinationRepository,
//     ),
//     Provider(
//       create: (context) => ContinentRepositoryLocal(localDataService: context.read()) as ContinentRepository,
//     ),
//     Provider(
//       create: (context) => ActivityRepositoryLocal(localDataService: context.read()) as ActivityRepository,
//     ),
//     Provider(
//       create: (context) => BookingRepositoryLocal(localDataService: context.read()) as BookingRepository,
//     ),
//     Provider.value(value: ItineraryConfigRepositoryMemory() as ItineraryConfigRepository),
//     Provider(create: (context) => UserRepositoryLocal(localDataService: context.read()) as UserRepository),
//     ..._sharedProviders,
//   ];
// }
