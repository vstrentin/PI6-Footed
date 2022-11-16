import 'package:pi6/pojo/MenuItem.dart';

class SearchInformation {
    String? shoppingresultsstate;
    String? querydisplayed;
    List<MenuItem?>? menuitems;

    SearchInformation({this.shoppingresultsstate, this.querydisplayed, this.menuitems}); 

    SearchInformation.fromJson(Map<String, dynamic> json) {
        shoppingresultsstate = json['shopping_results_state'];
        querydisplayed = json['query_displayed'];
        if (json['menu_items'] != null) {
         menuitems = <MenuItem>[];
         json['menu_items'].forEach((v) {
         menuitems!.add(MenuItem.fromJson(v));
        });
      }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['shopping_results_state'] = shoppingresultsstate;
        data['query_displayed'] = querydisplayed;
        data['menu_items'] = MenuItem != null ? menuitems!.map((v) => v?.toJson()).toList() : null;
        return data;
    }
}