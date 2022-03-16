class FeatureControlModel {
  String? featureId;

  FeatureControlModel({this.featureId});

  FeatureControlModel.fromJson(Map<String, dynamic> json) {
    featureId = json['featureId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['featureId'] = featureId;

    return data;
  }
}
