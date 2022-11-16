class SearchMetadata {
    String? id;
    String? status;
    String? jsonendpoint;
    String? createdat;
    String? processedat;
    String? googleurl;
    String? rawhtmlfile;
    double? totaltimetaken;

    SearchMetadata({this.id, this.status, this.jsonendpoint, this.createdat, this.processedat, this.googleurl, this.rawhtmlfile, this.totaltimetaken}); 

    SearchMetadata.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        status = json['status'];
        jsonendpoint = json['json_endpoint'];
        createdat = json['created_at'];
        processedat = json['processed_at'];
        googleurl = json['google_url'];
        rawhtmlfile = json['raw_html_file'];
        totaltimetaken = json['total_time_taken'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['status'] = status;
        data['json_endpoint'] = jsonendpoint;
        data['created_at'] = createdat;
        data['processed_at'] = processedat;
        data['google_url'] = googleurl;
        data['raw_html_file'] = rawhtmlfile;
        data['total_time_taken'] = totaltimetaken;
        return data;
    }
}
