
import 'package:get_it/get_it.dart';

import '../features/authentication/presentation/states/lets_get_to_know_you/lets_get_to_know_you_bloc.dart';



final sl = GetIt.I;

Future<void> registerServices() async {
  sl.registerLazySingleton<LetsGetToKnowYouBloc>(() => LetsGetToKnowYouBloc());
}
