import 'package:defifundr_mobile/features/authentication/presentation/forgot_password/state/forgot_password_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> registerServices() async {
  sl.registerLazySingleton<ForgotPasswordBloc>(() => ForgotPasswordBloc());
}
