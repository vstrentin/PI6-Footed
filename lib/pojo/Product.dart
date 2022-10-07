import 'package:pi6/pojo/Filter.dart';
import 'package:pi6/pojo/InlineShoppingResult.dart';
import 'package:pi6/pojo/Pagination.dart';
import 'package:pi6/pojo/SearchInformation.dart';
import 'package:pi6/pojo/SearchMetadata.dart';
import 'package:pi6/pojo/SearchParameters.dart';
import 'package:pi6/pojo/SerpapiPagination.dart';
import 'package:pi6/pojo/ShoppingResult.dart';

class Product {
    SearchMetadata? searchmetadata;
    SearchParameters? searchparameters;
    SearchInformation? searchinformation;
    List<Filter?>? filters;
    List<InlineShoppingResult?>? inlineshoppingresults;
    List<ShoppingResult?>? shoppingresults;
    Pagination? pagination;
    SerpapiPagination? serpapipagination;

    Product({this.searchmetadata, this.searchparameters, this.searchinformation, this.filters, this.inlineshoppingresults, this.shoppingresults, this.pagination, this.serpapipagination}); 

    Product.fromJson(Map<String, dynamic> json) {
        searchmetadata = json['search_metadata'] != null ? SearchMetadata?.fromJson(json['search_metadata']) : null;
        searchparameters = json['search_parameters'] != null ? SearchParameters?.fromJson(json['search_parameters']) : null;
        searchinformation = json['search_information'] != null ? SearchInformation?.fromJson(json['search_information']) : null;
        if (json['filters'] != null) {
         filters = <Filter>[];
         json['filters'].forEach((v) {
         filters!.add(Filter.fromJson(v));
        });
      }
        if (json['inline_shopping_results'] != null) {
         inlineshoppingresults = <InlineShoppingResult>[];
         json['inline_shopping_results'].forEach((v) {
         inlineshoppingresults!.add(InlineShoppingResult.fromJson(v));
        });
      }
        if (json['shopping_results'] != null) {
         shoppingresults = <ShoppingResult>[];
         json['shopping_results'].forEach((v) {
         shoppingresults!.add(ShoppingResult.fromJson(v));
        });
      }
        pagination = json['pagination'] != null ? Pagination?.fromJson(json['pagination']) : null;
        serpapipagination = json['serpapi_pagination'] != null ? SerpapiPagination?.fromJson(json['serpapi_pagination']) : null;
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['search_metadata'] = searchmetadata!.toJson();
        data['search_parameters'] = searchparameters!.toJson();
        data['search_information'] = searchinformation!.toJson();
        data['filters'] =filters != null ? filters!.map((v) => v?.toJson()).toList() : null;
        data['inline_shopping_results'] = inlineshoppingresults != null ? inlineshoppingresults!.map((v) => v?.toJson()).toList() : null;
        data['shopping_results'] = shoppingresults != null ? shoppingresults!.map((v) => v?.toJson()).toList() : null;
        data['pagination'] = pagination!.toJson();
        data['serpapi_pagination'] = serpapipagination!.toJson();
        return data;
    }
}
