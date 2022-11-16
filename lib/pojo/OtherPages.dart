class OtherPages {
    String? p2;
    String? p3;
    String? p4;
    String? p5;
    String? p6;
    String? p7;
    String? p8;
    String? p9;
    String? p10;

    OtherPages({this.p2, this.p3, this.p4, this.p5, this.p6, this.p7, this.p8, this.p9, this.p10}); 

    OtherPages.fromJson(Map<String, dynamic> json) {
        p2 = json['2'];
        p3 = json['3'];
        p4 = json['4'];
        p5 = json['5'];
        p6 = json['6'];
        p7 = json['7'];
        p8 = json['8'];
        p9 = json['9'];
        p10 = json['10'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['2'] = 2;
        data['3'] = 3;
        data['4'] = 4;
        data['5'] = 5;
        data['6'] = 6;
        data['7'] = 7;
        data['8'] = 8;
        data['9'] = 9;
        data['10'] = 10;
        return data;
    }
}