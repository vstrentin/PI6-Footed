class ShoppingResult {
    int? position;
    String? title;
    String? link;
    String? productlink;
    String? productid;
    String? serpapiproductapi;
    String? source;
    String? price;
    double? extractedprice;
    String? thumbnail;
    String? delivery;

    ShoppingResult({this.position, this.title, this.link, this.productlink, this.productid, this.serpapiproductapi, this.source, this.price, this.extractedprice, this.thumbnail, this.delivery}); 

    ShoppingResult.fromJson(Map<String, dynamic> json) {
        position = json['position'];
        title = json['title'];
        link = json['link'];
        productlink = json['product_link'];
        productid = json['product_id'];
        serpapiproductapi = json['serpapi_product_api'];
        source = json['source'];
        price = json['price'];
        extractedprice = json['extracted_price'];
        thumbnail = json['thumbnail'];
        delivery = json['delivery'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['position'] = position;
        data['title'] = title;
        data['link'] = link;
        data['product_link'] = productlink;
        data['product_id'] = productid;
        data['serpapi_product_api'] = serpapiproductapi;
        data['source'] = source;
        data['price'] = price;
        data['extracted_price'] = extractedprice;
        data['thumbnail'] = thumbnail;
        data['delivery'] = delivery;
        return data;
    }

    getThumbnail(){
      return thumbnail.toString();
    }

    getTitle(){
      return title.toString();
    }

    getPrice(){
      return price.toString();
    }

    getSource(){
      return source.toString();
    }

    getDelivery(){
      return delivery.toString();
    }
}