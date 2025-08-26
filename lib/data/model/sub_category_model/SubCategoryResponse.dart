import 'Metadata.dart';
import 'SubCategory.dart';

class SubCategoryResponse {
  SubCategoryResponse({
      this.results, 
      this.metadata, 
      this.data,});

  SubCategoryResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SubCategory.fromJson(v));
      });
    }
  }
  num? results;
  Metadata? metadata;
  List<SubCategory>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}