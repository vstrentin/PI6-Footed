import 'package:pi6/pojo/OtherPages.dart';

class SerpapiPagination {
    int? current;
    String? nextlink;
    String? next;
    OtherPages? otherpages;

    SerpapiPagination({this.current, this.nextlink, this.next, this.otherpages}); 

    SerpapiPagination.fromJson(Map<String, dynamic> json) {
        current = json['current'];
        nextlink = json['next_link'];
        next = json['next'];
        otherpages = json['other_pages'] != null ? OtherPages?.fromJson(json['other_pages']) : null;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['current'] = current;
        data['next_link'] = nextlink;
        data['next'] = next;
        data['other_pages'] = otherpages!.toJson();
        return data;
    }
}