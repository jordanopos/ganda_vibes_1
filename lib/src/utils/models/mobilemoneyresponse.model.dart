import 'dart:convert';

FlutterwaveResponseModel flutterwaveResponseModelFromJson(String str) => FlutterwaveResponseModel.fromJson(json.decode(str));

String flutterwaveResponseModelToJson(FlutterwaveResponseModel data) => json.encode(data.toJson());

class FlutterwaveResponseModel {
    FlutterwaveResponseModel({
        required this.status,
        required this.message,
        required this.data,
        required this.meta,
    });

    String status;
    String message;
    Data data;
    Meta meta;

    factory FlutterwaveResponseModel.fromJson(Map<String, dynamic> json) => FlutterwaveResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "meta": meta.toJson(),
    };
}

class Data {
    Data({
        required this.id,
        required this.txRef,
        required this.flwRef,
        required this.deviceFingerprint,
        required this.amount,
        required this.chargedAmount,
        required this.appFee,
        required this.merchantFee,
        required this.processorResponse,
        required this.authModel,
        required this.currency,
        required this.ip,
        required this.narration,
        required this.status,
        required this.authUrl,
        required this.paymentType,
        required this.fraudStatus,
        required this.chargeType,
        required this.createdAt,
        required this.accountId,
        required this.customer,
        required this.card,
    });

    int id;
    String txRef;
    String flwRef;
    String deviceFingerprint;
    int amount;
    int chargedAmount;
    double appFee;
    int merchantFee;
    String processorResponse;
    String authModel;
    String currency;
    String ip;
    String narration;
    String status;
    String authUrl;
    String paymentType;
    String fraudStatus;
    String chargeType;
    DateTime createdAt;
    int accountId;
    Customer customer;
    Card card;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        txRef: json["tx_ref"],
        flwRef: json["flw_ref"],
        deviceFingerprint: json["device_fingerprint"],
        amount: json["amount"],
        chargedAmount: json["charged_amount"],
        appFee: json["app_fee"].toDouble(),
        merchantFee: json["merchant_fee"],
        processorResponse: json["processor_response"],
        authModel: json["auth_model"],
        currency: json["currency"],
        ip: json["ip"],
        narration: json["narration"],
        status: json["status"],
        authUrl: json["auth_url"],
        paymentType: json["payment_type"],
        fraudStatus: json["fraud_status"],
        chargeType: json["charge_type"],
        createdAt: DateTime.parse(json["created_at"]),
        accountId: json["account_id"],
        customer: Customer.fromJson(json["customer"]),
        card: Card.fromJson(json["card"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tx_ref": txRef,
        "flw_ref": flwRef,
        "device_fingerprint": deviceFingerprint,
        "amount": amount,
        "charged_amount": chargedAmount,
        "app_fee": appFee,
        "merchant_fee": merchantFee,
        "processor_response": processorResponse,
        "auth_model": authModel,
        "currency": currency,
        "ip": ip,
        "narration": narration,
        "status": status,
        "auth_url": authUrl,
        "payment_type": paymentType,
        "fraud_status": fraudStatus,
        "charge_type": chargeType,
        "created_at": createdAt.toIso8601String(),
        "account_id": accountId,
        "customer": customer.toJson(),
        "card": card.toJson(),
    };
}

class Card {
    Card({
        required this.first6Digits,
        required this.last4Digits,
        required this.issuer,
        required this.country,
        required this.type,
        required this.expiry,
    });

    String first6Digits;
    String last4Digits;
    String issuer;
    String country;
    String type;
    String expiry;

    factory Card.fromJson(Map<String, dynamic> json) => Card(
        first6Digits: json["first_6digits"],
        last4Digits: json["last_4digits"],
        issuer: json["issuer"],
        country: json["country"],
        type: json["type"],
        expiry: json["expiry"],
    );

    Map<String, dynamic> toJson() => {
        "first_6digits": first6Digits,
        "last_4digits": last4Digits,
        "issuer": issuer,
        "country": country,
        "type": type,
        "expiry": expiry,
    };
}

class Customer {
    Customer({
        required this.id,
        required this.phoneNumber,
        required this.name,
        required this.email,
        required this.createdAt,
    });

    int id;
    dynamic phoneNumber;
    String name;
    String email;
    DateTime createdAt;

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        phoneNumber: json["phone_number"],
        name: json["name"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phone_number": phoneNumber,
        "name": name,
        "email": email,
        "created_at": createdAt.toIso8601String(),
    };
}

class Meta {
    Meta({
        required this.authorization,
    });

    Authorization authorization;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        authorization: Authorization.fromJson(json["authorization"]),
    );

    Map<String, dynamic> toJson() => {
        "authorization": authorization.toJson(),
    };
}

class Authorization {
    Authorization({
        required this.mode,
        required this.endpoint,
    });

    String mode;
    String endpoint;

    factory Authorization.fromJson(Map<String, dynamic> json) => Authorization(
        mode: json["mode"],
        endpoint: json["endpoint"],
    );

    Map<String, dynamic> toJson() => {
        "mode": mode,
        "endpoint": endpoint,
    };
}
