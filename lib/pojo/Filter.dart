import 'package:pi6/pojo/Option.dart';

class Filter {
    String? type;
    List<Option?>? options;

    Filter({this.type, this.options}); 

    Filter.fromJson(Map<String, dynamic> json) {
        type = json['type'];
        if (json['options'] != null) {
         options = <Option>[];
         json['options'].forEach((v) {
         options!.add(Option.fromJson(v));
        });
      }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['type'] = type;
        data['options'] = options != null ? options!.map((v) => v?.toJson()).toList() : null;
        return data;
    }
}