/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
class InlineShoppingResult {
    String? position;
    String? blockposition;
    String? title;
    String? price;
    double? extractedprice;
    String? link;
    String? source;
    String? shipping;
    double? rating;
    int? reviews;
    String? thumbnail;
    List<String?>? extensions;

    InlineShoppingResult({this.position, this.blockposition, this.title, this.price, this.extractedprice, this.link, this.source, this.shipping, this.rating, this.reviews, this.thumbnail, this.extensions}); 

     InlineShoppingResult.fromJson(Map<String, dynamic> json) {
      position = json['position'];
      blockposition = json['block_position'];
      title = json['title'];
      price = json['price'];
      extractedprice = json['extracted_price'];
      link = json['link'];
      source = json['source'];
      shipping = json['shipping'];
      rating = json['rating'];
      reviews = json['reviews'];
      thumbnail = json['thumbnail'];
      if (json['extensions'] != null) {
        extensions = <String>[];
      }
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['position'] = position;
        data['block_position'] = blockposition;
        data['title'] = title;
        data['price'] = price;
        data['extracted_price'] = extractedprice;
        data['link'] = link;
        data['source'] = source;
        data['shipping'] = shipping;
        data['rating'] = rating;
        data['reviews'] = reviews;
        data['thumbnail'] = thumbnail;
        data['extensions'] = extensions;
        return data;
    }
}
