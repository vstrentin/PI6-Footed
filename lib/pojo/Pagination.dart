import 'package:pi6/pojo/OtherPages.dart';

class Pagination {
    int? current;
    String? next;
    OtherPages? otherpages;

    Pagination({this.current, this.next, this.otherpages}); 

    Pagination.fromJson(Map<String, dynamic> json) {
        current = json['current'];
        next = json['next'];
        otherpages = json['other_pages'] != null ? OtherPages?.fromJson(json['other_pages']) : null;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['current'] = current;
        data['next'] = next;
        data['other_pages'] = otherpages!.toJson();
        return data;
    }
}