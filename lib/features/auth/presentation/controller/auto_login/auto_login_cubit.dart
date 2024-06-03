import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../home/presentation/controllers/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import '../../../domain/usecases/get_user_type_usecase.dart';
import '../../../domain/usecases/remove_access_token_usecase.dart';
import '../../../domain/usecases/save_access_token_usecase.dart';
import '../../../domain/usecases/save_user_type_usecase.dart';

part 'auto_login_state.dart';

class AutoLoginCubit extends Cubit<AutoLoginState> {
  final GetUserTypeUseCase getUserTypeUseCase;
  final SaveUserTypeUseCase saveUserTypeUseCase;
  final SaveAccessTokenUseCase saveAccessTokenUseCase;
  final RemoveAccessTokenUseCase removeAccessTokenUseCase;

  AutoLoginCubit({
    required this.getUserTypeUseCase,
    required this.saveUserTypeUseCase,
    required this.saveAccessTokenUseCase,
    required this.removeAccessTokenUseCase,
  }) : super(const AutoLoginInitialState());

  UserType userType = UserType.firstOpen;

  Future<void> getUserType() async {
    emit(const AutoLoginInitialState());
    final Either<Failure, UserType> result = await getUserTypeUseCase(NoParams());
    await Future<void>.delayed(const Duration(milliseconds: 0), (){
      result.fold((Failure fail) {
        emit(AutoLoginErrorState(message: 'getUserType ERROR: ${fail.message}'));
      }, (UserType value){
        userType = value;
        emit(AutoLoginSuccessState(userType: userType));
      });
      // emit(AutoLoginState(userType: userType));
    });

  }

  Future<void> saveUserType({required UserType type}) async {
    emit(const AutoLoginInitialState());
    final Either<Failure, void> result = await saveUserTypeUseCase(SaveUserTypeParams(type: type));
    await Future<void>.delayed(const Duration(milliseconds: 0), (){
      result.fold((Failure fail) {
        emit(AutoLoginErrorState(message: 'saveUserType ERROR: ${fail.message}'));
      }, (void value){
        userType = type;
        emit(AutoLoginSuccessState(userType: userType));
      });
    });
  }

  Future<void> saveAccessToken({required String token}) async {
    emit(const AutoLoginInitialState());
    final Either<Failure, bool> result = await saveAccessTokenUseCase(SaveAccessTokenParams(token: token));
    await Future<void>.delayed(const Duration(milliseconds: 0), (){
      result.fold((Failure fail) {
        emit(AutoLoginErrorState(message: 'saveAccessToken ERROR: ${fail.message}'));
      }, (bool value){
        // emit(AutoLoginState(userType: userType));
      });
    });
  }

  Future<void> removeAccessToken() async {
    emit(const AutoLoginInitialState());
    final Either<Failure, bool> result = await removeAccessTokenUseCase(NoParams());
    await Future<void>.delayed(const Duration(milliseconds: 0), (){
      result.fold((Failure fail) {
        emit(AutoLoginErrorState(message: 'removeAccessToken ERROR: ${fail.message}'));
      }, (bool value){
        // emit(AutoLoginState(userType: userType));
      });
    });
  }

  void fLoggedUser({required String accessToken, required BuildContext context}) async{
    context.read<BottomNavBarCubit>().changeCurrentScreen(index: 0);
    await saveAccessToken(token: accessToken);
    await saveUserType(type: UserType.user);
  }

  void fLoggedGuest({required BuildContext context}) async{
    context.read<BottomNavBarCubit>().changeCurrentScreen(index: 0);
    await saveUserType(type: UserType.guest);
  }

  void fLogout() async{
    await removeAccessToken();
    await saveUserType(type: UserType.login);
  }
}
