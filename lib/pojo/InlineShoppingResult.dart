class InlineShoppingResult {
    int? position;
    String? blockposition;
    String? title;
    String? price;
    double? extractedprice;
    String? link;
    String? source;
    String? shipping;
    String? thumbnail;
    List<String?>? extensions;

    InlineShoppingResult({this.position, this.blockposition, this.title, this.price, this.extractedprice, this.link, this.source, this.shipping, this.thumbnail, this.extensions}); 

    InlineShoppingResult.fromJson(Map<String, dynamic> json) {
        position = json['position'];
        blockposition = json['block_position'];
        title = json['title'];
        price = json['price'];
        extractedprice = json['extracted_price'];
        link = json['link'];
        source = json['source'];
        shipping = json['shipping'];
        thumbnail = json['thumbnail'];
        if (json['extensions'] != null) {
         extensions = <String>[];
         json['extensions'].forEach((v) {
         extensions!.add(v);
        });
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
        data['thumbnail'] = thumbnail;
        data['extensions'] = extensions = null;// ? extensions!.map((v) => v?.toJson(extensions)).toList() : null;
        return data;
    }
}