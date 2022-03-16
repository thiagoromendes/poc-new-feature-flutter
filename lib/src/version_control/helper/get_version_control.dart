import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:poc_new_feature/src/version_control/model/feature_control_model.dart';

class GetVersionControl {
  static Future<String> _getRootBundleFile(String path) async {
    return await rootBundle.loadString(path);
  }

  static Future<List<FeatureControlModel>> fromJson(String path) async {
    final String jsonString = await _getRootBundleFile(path);
    final dynamic jsonResponse = json.decode(jsonString);

    final List<FeatureControlModel> listFeatureModel =
        (jsonResponse as List<dynamic>)
            .map(
              (dynamic featureItem) =>
                  FeatureControlModel.fromJson(featureItem),
            )
            .toList();

    return listFeatureModel;
  }
}
