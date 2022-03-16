import 'package:poc_new_feature/src/shared/storage/local_data.dart';
import 'package:poc_new_feature/src/version_control/helper/get_version_control.dart';
import 'package:poc_new_feature/src/version_control/model/feature_control_model.dart';

class VersionControl {
  final LocalData localData = LocalData();

  Future<void> setListFeatureId() async {
    List<String> listFeatureId = await _getListFeatureId();
    await localData.setStringList('listFeatureId', listFeatureId);
  }

  Future<List<String>> _getListFeatureId() async {
    List<String> listFeatureId = [];

    List<FeatureControlModel> listFeatureIdModel =
        await GetVersionControl.fromJson('assets/data/new_features.json');

    listFeatureIdModel.forEach((value) {
      listFeatureId.add(value.featureId!);
    });

    return listFeatureId;
  }

  Future<bool> hasList() async {
    return await localData.listItems('listFeatureId') != null ? true : false;
  }

  Future<bool> hasNewFeature(String id) async {
    List<String>? listFeatureId = await localData.listItems('listFeatureId');

    return listFeatureId?.contains(id) ?? false ? true : false;
  }

  void removeItemList(String id) async {
    List<String>? listFeatureId = await localData.listItems('listFeatureId');
    listFeatureId?.removeWhere((element) => element == id);
    localData.removeData('listFeatureId');
    if (listFeatureId!.isNotEmpty) {
      localData.setStringList('listFeatureId', listFeatureId);
    }
  }
}
