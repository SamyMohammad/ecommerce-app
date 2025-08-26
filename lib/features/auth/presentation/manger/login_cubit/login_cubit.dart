// import 'package:bloc/bloc.dart';
// import 'package:ecommerce_app/data/model/auth_model/AuthResponse.dart';
// import 'package:ecommerce_app/data/model/auth_model/login_request/LoginRequest.dart';
// import 'package:ecommerce_app/domain/repos/AuthRepo/auth_repo.dart';
// import 'package:meta/meta.dart';
//
// part 'login_state.dart';
//
// class LoginCubit extends Cubit<LoginState> {
//   final AuthRepo authRepo;
//   LoginCubit(this.authRepo) : super(LoginInitial());
//
//   Future<void>login(LoginRequest loginRequest)async {
//     emit(LoginLoading());
//
//     var result=await authRepo.login(loginRequest);
//     result.fold((failure) {
//       emit(LoginError(failure.errorMassage ));
//     }, (authResponse) {
//       emit(LoginSuccess(authResponse));
//     });
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ecommerce_app/data/model/auth_model/AuthResponse.dart';
import 'package:ecommerce_app/data/model/auth_model/login_request/LoginRequest.dart';
import 'package:ecommerce_app/domain/repos/AuthRepo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit(this.authRepo) : super(LoginInitial());

  /// Handles user login and emits states accordingly.
  Future<void> login(LoginRequest loginRequest) async {
    emit(LoginLoading());

    try {
      final result = await authRepo.login(loginRequest);

      result.fold(
            (failure) => emit(LoginError( failure.errorMassage)),
            (authResponse) => emit(LoginSuccess(authResponse)),
      );
    } on Exception catch (e){
      // Catch any unexpected exception (e.g. parsing, connectivity, etc.)
      emit(LoginError(e.toString()));
    }
  }
}
