// ignore_for_file: public_member_api_docs, sort_constructors_first
class PaymentDetails {
  bool? success;
  Data? data;
  String? message;

  PaymentDetails({this.success, this.data, this.message});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }

  @override
  String toString() =>
      'PaymentDetails(success: $success, data: $data, message: $message)';
}

class Data {
  String? authorizationUrl;
  String? accessCode;
  String? reference;

  Data({this.authorizationUrl, this.accessCode, this.reference});

  Data.fromJson(Map<String, dynamic> json) {
    authorizationUrl = json['authorization_url'];
    accessCode = json['access_code'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authorization_url'] = authorizationUrl;
    data['access_code'] = accessCode;
    data['reference'] = reference;
    return data;
  }

  @override
  String toString() =>
      'Data(authorizationUrl: $authorizationUrl, accessCode: $accessCode, reference: $reference)';
}
