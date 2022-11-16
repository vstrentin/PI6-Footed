class MenuItem {
    int? position;
    String? title;
    String? link;
    String? serpapilink;

    MenuItem({this.position, this.title, this.link, this.serpapilink}); 

    MenuItem.fromJson(Map<String, dynamic> json) {
        position = json['position'];
        title = json['title'];
        link = json['link'];
        serpapilink = json['serpapi_link'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['position'] = position;
        data['title'] = title;
        data['link'] = link;
        data['serpapi_link'] = serpapilink;
        return data;
    }
}