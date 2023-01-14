// import 'dart:developer';

// import 'package:flutter/cupertino.dart';

// import '../repository/home_repo.dart';

// class Homenotifier extends ChangeNotifier {
//   List _userData = [];
//   List get userData => _userData;
//   final _homeRepo = HomeRepository();

//   bool loading = false;

//   userApiCall(BuildContext context) async {
//     loading = true;
//     try {
//       final response = await _homeRepo.userApicall(context);
//       _userData = response['data'];
//       loading = false;
//       notifyListeners();
//     } catch (e) {
//       log('Erroer $e');
//     }
//   }
// }

import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:mvvm_complete/data/response/api_response.dart';
import 'package:mvvm_complete/model/user_model.dart';

import '../repository/home_repo.dart';

class Homenotifier extends ChangeNotifier {
  List _userData = [];
  List get userData => _userData;
  final _homeRepo = HomeRepository();

  bool loading = false;

  ApiResponse<userModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<userModel> response) {
    moviesList = response;
  }

  userApiCall(BuildContext context) async {
    setMoviesList(ApiResponse.loading());
    // notifyListeners();
    try {
      await _homeRepo.userApicall(context).then((value) {
        setMoviesList(ApiResponse.completed(value));
      });

      notifyListeners();
    } catch (e) {
      setMoviesList(ApiResponse.error(e.toString()));
      notifyListeners();
      log('Erroer $e');
    }
    notifyListeners();
  }
}
