/* 
CUBIT: Simplefied version of Bloc for easy state management


*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:testapp/sampleForTest/get_api_respository.dart';
import 'package:testapp/sampleForTest/user_model.dart';

class CounterCubit extends Cubit<int>{
  

  CounterCubit(super.initialState);
  final UserRepository userRepository = UserRepository(Client());
  List<UserModel> userModel = <UserModel>[];


  //increment 
  void increment() => emit(state + 1);

   //decrement 
  void decrement() => emit(state - 1);


  void reset() => emit(0);
  

  Future<void> getUserData () async {

    try {
      emit(5);
    final response = await userRepository.getUserData();
    userModel.addAll(response);
    emit(0);
    } catch (e) {
      
    }
  }
  
  
  @override
  void onChange(Change<int> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
  }
}
