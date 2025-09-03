import 'dart:convert';

import 'package:ecommerce_fruits/core/helper/shared_pref_helper.dart';
import 'package:ecommerce_fruits/features/auth/data/models/user_model.dart';
import 'package:ecommerce_fruits/features/auth/domain/entites/user_entity.dart';

UserEntity get userData {
  var jsonString = SharedPrefHelper().getValueForKey(
    key: SharedPrefKeys.userData,
    defaultValue: '{}',
  );
  return UserModel.fromJson(jsonDecode(jsonString));
}
