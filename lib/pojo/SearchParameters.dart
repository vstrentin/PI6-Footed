class SearchParameters {
    String? engine;
    String? q;
    String? locationrequested;
    String? locationused;
    String? googledomain;
    String? hl;
    String? gl;
    String? num;
    String? device;
    String? tbm;

    SearchParameters({this.engine, this.q, this.locationrequested, this.locationused, this.googledomain, this.hl, this.gl, this.num, this.device, this.tbm}); 

    SearchParameters.fromJson(Map<String, dynamic> json) {
        engine = json['engine'];
        q = json['q'];
        locationrequested = json['location_requested'];
        locationused = json['location_used'];
        googledomain = json['google_domain'];
        hl = json['hl'];
        gl = json['gl'];
        num = json['num'];
        device = json['device'];
        tbm = json['tbm'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['engine'] = engine;
        data['q'] = q;
        data['location_requested'] = locationrequested;
        data['location_used'] = locationused;
        data['google_domain'] = googledomain;
        data['hl'] = hl;
        data['gl'] = gl;
        data['num'] = num;
        data['device'] = device;
        data['tbm'] = tbm;
        return data;
    }
}