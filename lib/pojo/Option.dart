class Option {
    String? text;
    String? tbs;

    Option({this.text, this.tbs}); 

    Option.fromJson(Map<String, dynamic> json) {
        text = json['text'];
        tbs = json['tbs'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['text'] = text;
        data['tbs'] = tbs;
        return data;
    }
}