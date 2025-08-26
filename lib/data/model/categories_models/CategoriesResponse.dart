import 'paginationInfo.dart';
import 'category.dart';

class CategoriesResponse {
  CategoriesResponse({
      this.results, 
      this.metadata, 
      this.data,});

  CategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null ? PaginationInfo.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Category.fromJson(v));
      });
    }
  }
  num? results;
  PaginationInfo? metadata;
  List<Category>? data;

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