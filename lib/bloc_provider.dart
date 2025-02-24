import 'package:defifundr_mobile/features/authentication/presentation/forgot_password/state/forgot_password_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';



List<SingleChildWidget> get appProviders {
  return [
    BlocProvider<ForgotPasswordBloc>(
      create: (context) => ForgotPasswordBloc(),
    ),
  
  ];
}
