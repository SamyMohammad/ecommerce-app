import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/data/model/auth_model/AuthResponse.dart';
import 'package:ecommerce_app/data/model/auth_model/signup_model/SignUpRequest.dart';
import 'package:ecommerce_app/domain/repos/AuthRepo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_upcubit_state.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit(this.authRepo) : super(SignupCubitInitial());
  final AuthRepo authRepo;

  Future<void>signUp(SignUpRequest signUpRequest)async {
    emit(SignupCubitLoading());

    try {
      final result=await authRepo.signUp(signUpRequest);

      result.fold(
            (failure) => emit(SignupCubitError(failure.errorMassage)),
            (authResponse) => emit(SignupCubitSuccess(authResponse)),
      );
    } on Exception catch (e) {
      print(e);
      emit(SignupCubitError(e.toString()));
    }
  }
}


