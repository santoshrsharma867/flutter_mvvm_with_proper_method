// import 'package:flutter/foundation.dart';
// import '../data/services/api_services.dart';
// import '../utils/utils.dart';

// class HomeRepository {
//   final _networkService = NetworkApiService();
//   userApicall(context) async {
//     try {
//       final response = await _networkService
//           .getGetApiResponse(
//               'https://reqres.in/api/udfkdskjfkdskf/fdskjfkjd/sdfkj')
//           .catchError((error, stackTrace) {
//         Utils.showMyDialog(error.toString(), context);
//         if (kDebugMode) {
//           print(error.toString());
//         }
//       });

//       return response;
//     } catch (e) {
//       throw e;
//     }
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:mvvm_complete/data/services/api_services.dart';
import 'package:mvvm_complete/model/user_model.dart';
import 'package:mvvm_complete/utils/utils.dart';

class HomeRepository {
  final _networkService = NetworkApiService();

  Future<userModel> userApicall(context) async {
    try {
      dynamic response = await _networkService
          .getGetApiResponse('https://reqres.in/api/users/')
          .catchError((error, stackTrace) {
        Utils.showMyDialog(error.toString(), context);
        if (kDebugMode) {
          print(error.toString());
        }
      });

      return response = userModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
