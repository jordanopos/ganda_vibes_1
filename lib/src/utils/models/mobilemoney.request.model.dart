import 'dart:convert';

FlutterwaveRequestModel flutterwaveRequestModelFromJson(String str) =>
    FlutterwaveRequestModel.fromJson(json.decode(str));

String flutterwaveRequestModelToJson(FlutterwaveRequestModel data) =>
    json.encode(data.toJson());

class FlutterwaveRequestModel {
  FlutterwaveRequestModel({
    required this.cardNumber,
    required this.cvv,
    required this.expiryMonth,
    required this.expiryYear,
    required this.currency,
    required this.amount,
    required this.fullname,
    required this.email,
    required this.txRef,
    required this.redirectUrl,
    required this.authorization,
  });

  String cardNumber;
  String cvv;
  String expiryMonth;
  String expiryYear;
  String currency;
  String amount;
  String fullname;
  String email;
  String txRef;
  String redirectUrl;
  Authorization authorization;

  factory FlutterwaveRequestModel.fromJson(Map<String, dynamic> json) {
    return FlutterwaveRequestModel(
        cardNumber: json["card_number"],
        cvv: json["cvv"],
        expiryMonth: json["expiry_month"],
        expiryYear: json["expiry_year"],
        currency: json["currency"],
        amount: json["amount"],
        fullname: json["fullname"],
        email: json["email"],
        txRef: json["tx_ref"],
        redirectUrl: json["redirect_url"],
        authorization: Authorization.fromJson(json["authorization"]),
      );
  }

  Map<String, dynamic> toJson() => {
        "card_number": cardNumber,
        "cvv": cvv,
        "expiry_month": expiryMonth,
        "expiry_year": expiryYear,
        "currency": currency,
        "amount": amount,
        "fullname": fullname,
        "email": email,
        "tx_ref": txRef,
        "redirect_url": redirectUrl,
        "authorization": authorization.toJson(),
      };
}

class Authorization {
  Authorization({
    required this.mode,
    required this.pin,
  });

  String mode;
  String pin;

  factory Authorization.fromJson(Map<String, dynamic> json) => Authorization(
        mode: json["mode"],
        pin: json["pin"],
      );

  Map<String, dynamic> toJson() => {
        "mode": mode,
        "pin": pin,
      };
}
