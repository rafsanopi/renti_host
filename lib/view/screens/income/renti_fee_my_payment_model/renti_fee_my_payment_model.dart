class RentiFeeMyPaymentModel {
  String? message;
  int? myPayment;
  int? rentiFee;
  List<UserPaymentList>? userPaymentList;
  Pagination? pagination;

  RentiFeeMyPaymentModel(
      {this.message,
      this.myPayment,
      this.rentiFee,
      this.userPaymentList,
      this.pagination});

  RentiFeeMyPaymentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    myPayment = json['myPayment'];
    rentiFee = json['rentiFee'];
    if (json['userPaymentList'] != null) {
      userPaymentList = <UserPaymentList>[];
      json['userPaymentList'].forEach((v) {
        userPaymentList!.add(new UserPaymentList.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['myPayment'] = this.myPayment;
    data['rentiFee'] = this.rentiFee;
    if (this.userPaymentList != null) {
      data['userPaymentList'] =
          this.userPaymentList!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class UserPaymentList {
  Income? income;
  bool? status;
  String? carOwner;
  int? totalAmount;
  int? myPayment;
  int? stripeFee;
  int? rentiFee;
  String? time;
  String? method;
  String? rentTripNumbers;

  UserPaymentList(
      {this.income,
      this.status,
      this.carOwner,
      this.totalAmount,
      this.myPayment,
      this.stripeFee,
      this.rentiFee,
      this.time,
      this.method,
      this.rentTripNumbers});

  UserPaymentList.fromJson(Map<String, dynamic> json) {
    income =
        json['income'] != null ? new Income.fromJson(json['income']) : null;
    status = json['status'];
    carOwner = json['carOwner'];
    totalAmount = json['totalAmount'];
    myPayment = json['myPayment'];
    stripeFee = json['stripeFee'];
    rentiFee = json['rentiFee'];
    time = json['time'];
    method = json['method'];
    rentTripNumbers = json['rentTripNumbers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.income != null) {
      data['income'] = this.income!.toJson();
    }
    data['status'] = this.status;
    data['carOwner'] = this.carOwner;
    data['totalAmount'] = this.totalAmount;
    data['myPayment'] = this.myPayment;
    data['stripeFee'] = this.stripeFee;
    data['rentiFee'] = this.rentiFee;
    data['time'] = this.time;
    data['method'] = this.method;
    data['rentTripNumbers'] = this.rentTripNumbers;
    return data;
  }
}

class Income {
  String? sId;
  PaymentData? paymentData;
  String? userId;
  String? hostId;
  String? carId;
  String? rentId;
  bool? payout;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Income(
      {this.sId,
      this.paymentData,
      this.userId,
      this.hostId,
      this.carId,
      this.rentId,
      this.payout,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Income.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    paymentData = json['paymentData'] != null
        ? new PaymentData.fromJson(json['paymentData'])
        : null;
    userId = json['userId'];
    hostId = json['hostId'];
    carId = json['carId'];
    rentId = json['rentId'];
    payout = json['payout'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.paymentData != null) {
      data['paymentData'] = this.paymentData!.toJson();
    }
    data['userId'] = this.userId;
    data['hostId'] = this.hostId;
    data['carId'] = this.carId;
    data['rentId'] = this.rentId;
    data['payout'] = this.payout;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class PaymentData {
  String? id;
  String? object;
  int? amount;
  int? amountCaptured;
  int? amountRefunded;
  Null? application;
  Null? applicationFee;
  Null? applicationFeeAmount;
  String? balanceTransaction;
  BillingDetails? billingDetails;
  String? calculatedStatementDescriptor;
  bool? captured;
  int? created;
  String? currency;
  String? customer;
  String? description;
  Null? destination;
  Null? dispute;
  bool? disputed;
  Null? failureBalanceTransaction;
  Null? failureCode;
  Null? failureMessage;
  Null? invoice;
  bool? livemode;
  Null? onBehalfOf;
  Null? order;
  Outcome? outcome;
  bool? paid;
  Null? paymentIntent;
  String? paymentMethod;
  PaymentMethodDetails? paymentMethodDetails;
  String? receiptEmail;
  Null? receiptNumber;
  String? receiptUrl;
  bool? refunded;
  Null? review;
  Shipping? shipping;
  Source? source;
  Null? sourceTransfer;
  Null? statementDescriptor;
  Null? statementDescriptorSuffix;
  String? status;
  Null? transferData;
  Null? transferGroup;

  PaymentData(
      {this.id,
      this.object,
      this.amount,
      this.amountCaptured,
      this.amountRefunded,
      this.application,
      this.applicationFee,
      this.applicationFeeAmount,
      this.balanceTransaction,
      this.billingDetails,
      this.calculatedStatementDescriptor,
      this.captured,
      this.created,
      this.currency,
      this.customer,
      this.description,
      this.destination,
      this.dispute,
      this.disputed,
      this.failureBalanceTransaction,
      this.failureCode,
      this.failureMessage,
      this.invoice,
      this.livemode,
      this.onBehalfOf,
      this.order,
      this.outcome,
      this.paid,
      this.paymentIntent,
      this.paymentMethod,
      this.paymentMethodDetails,
      this.receiptEmail,
      this.receiptNumber,
      this.receiptUrl,
      this.refunded,
      this.review,
      this.shipping,
      this.source,
      this.sourceTransfer,
      this.statementDescriptor,
      this.statementDescriptorSuffix,
      this.status,
      this.transferData,
      this.transferGroup});

  PaymentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    amount = json['amount'];
    amountCaptured = json['amount_captured'];
    amountRefunded = json['amount_refunded'];
    application = json['application'];
    applicationFee = json['application_fee'];
    applicationFeeAmount = json['application_fee_amount'];
    balanceTransaction = json['balance_transaction'];
    billingDetails = json['billing_details'] != null
        ? new BillingDetails.fromJson(json['billing_details'])
        : null;
    calculatedStatementDescriptor = json['calculated_statement_descriptor'];
    captured = json['captured'];
    created = json['created'];
    currency = json['currency'];
    customer = json['customer'];
    description = json['description'];
    destination = json['destination'];
    dispute = json['dispute'];
    disputed = json['disputed'];
    failureBalanceTransaction = json['failure_balance_transaction'];
    failureCode = json['failure_code'];
    failureMessage = json['failure_message'];
    invoice = json['invoice'];
    livemode = json['livemode'];
    onBehalfOf = json['on_behalf_of'];
    order = json['order'];
    outcome =
        json['outcome'] != null ? new Outcome.fromJson(json['outcome']) : null;
    paid = json['paid'];
    paymentIntent = json['payment_intent'];
    paymentMethod = json['payment_method'];
    paymentMethodDetails = json['payment_method_details'] != null
        ? new PaymentMethodDetails.fromJson(json['payment_method_details'])
        : null;
    receiptEmail = json['receipt_email'];
    receiptNumber = json['receipt_number'];
    receiptUrl = json['receipt_url'];
    refunded = json['refunded'];
    review = json['review'];
    shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
    sourceTransfer = json['source_transfer'];
    statementDescriptor = json['statement_descriptor'];
    statementDescriptorSuffix = json['statement_descriptor_suffix'];
    status = json['status'];
    transferData = json['transfer_data'];
    transferGroup = json['transfer_group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['amount'] = this.amount;
    data['amount_captured'] = this.amountCaptured;
    data['amount_refunded'] = this.amountRefunded;
    data['application'] = this.application;
    data['application_fee'] = this.applicationFee;
    data['application_fee_amount'] = this.applicationFeeAmount;
    data['balance_transaction'] = this.balanceTransaction;
    if (this.billingDetails != null) {
      data['billing_details'] = this.billingDetails!.toJson();
    }
    data['calculated_statement_descriptor'] =
        this.calculatedStatementDescriptor;
    data['captured'] = this.captured;
    data['created'] = this.created;
    data['currency'] = this.currency;
    data['customer'] = this.customer;
    data['description'] = this.description;
    data['destination'] = this.destination;
    data['dispute'] = this.dispute;
    data['disputed'] = this.disputed;
    data['failure_balance_transaction'] = this.failureBalanceTransaction;
    data['failure_code'] = this.failureCode;
    data['failure_message'] = this.failureMessage;
    data['invoice'] = this.invoice;
    data['livemode'] = this.livemode;
    data['on_behalf_of'] = this.onBehalfOf;
    data['order'] = this.order;
    if (this.outcome != null) {
      data['outcome'] = this.outcome!.toJson();
    }
    data['paid'] = this.paid;
    data['payment_intent'] = this.paymentIntent;
    data['payment_method'] = this.paymentMethod;
    if (this.paymentMethodDetails != null) {
      data['payment_method_details'] = this.paymentMethodDetails!.toJson();
    }
    data['receipt_email'] = this.receiptEmail;
    data['receipt_number'] = this.receiptNumber;
    data['receipt_url'] = this.receiptUrl;
    data['refunded'] = this.refunded;
    data['review'] = this.review;
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    data['source_transfer'] = this.sourceTransfer;
    data['statement_descriptor'] = this.statementDescriptor;
    data['statement_descriptor_suffix'] = this.statementDescriptorSuffix;
    data['status'] = this.status;
    data['transfer_data'] = this.transferData;
    data['transfer_group'] = this.transferGroup;
    return data;
  }
}

class BillingDetails {
  Address? address;
  Null? email;
  Null? name;
  Null? phone;

  BillingDetails({this.address, this.email, this.name, this.phone});

  BillingDetails.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['email'] = this.email;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}

class Address {
  Null? city;
  Null? country;
  Null? line1;
  Null? line2;
  Null? postalCode;
  Null? state;

  Address(
      {this.city,
      this.country,
      this.line1,
      this.line2,
      this.postalCode,
      this.state});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
    line1 = json['line1'];
    line2 = json['line2'];
    postalCode = json['postal_code'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['country'] = this.country;
    data['line1'] = this.line1;
    data['line2'] = this.line2;
    data['postal_code'] = this.postalCode;
    data['state'] = this.state;
    return data;
  }
}

class Outcome {
  String? networkStatus;
  Null? reason;
  String? riskLevel;
  int? riskScore;
  String? sellerMessage;
  String? type;

  Outcome(
      {this.networkStatus,
      this.reason,
      this.riskLevel,
      this.riskScore,
      this.sellerMessage,
      this.type});

  Outcome.fromJson(Map<String, dynamic> json) {
    networkStatus = json['network_status'];
    reason = json['reason'];
    riskLevel = json['risk_level'];
    riskScore = json['risk_score'];
    sellerMessage = json['seller_message'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['network_status'] = this.networkStatus;
    data['reason'] = this.reason;
    data['risk_level'] = this.riskLevel;
    data['risk_score'] = this.riskScore;
    data['seller_message'] = this.sellerMessage;
    data['type'] = this.type;
    return data;
  }
}

class PaymentMethodDetails {
  Card? card;
  String? type;

  PaymentMethodDetails({this.card, this.type});

  PaymentMethodDetails.fromJson(Map<String, dynamic> json) {
    card = json['card'] != null ? new Card.fromJson(json['card']) : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.card != null) {
      data['card'] = this.card!.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}

class Card {
  int? amountAuthorized;
  String? brand;
  Checks? checks;
  String? country;
  int? expMonth;
  int? expYear;
  ExtendedAuthorization? extendedAuthorization;
  String? fingerprint;
  String? funding;
  ExtendedAuthorization? incrementalAuthorization;
  Null? installments;
  String? last4;
  Null? mandate;
  ExtendedAuthorization? multicapture;
  String? network;
  NetworkToken? networkToken;
  Overcapture? overcapture;
  Null? threeDSecure;
  Null? wallet;

  Card(
      {this.amountAuthorized,
      this.brand,
      this.checks,
      this.country,
      this.expMonth,
      this.expYear,
      this.extendedAuthorization,
      this.fingerprint,
      this.funding,
      this.incrementalAuthorization,
      this.installments,
      this.last4,
      this.mandate,
      this.multicapture,
      this.network,
      this.networkToken,
      this.overcapture,
      this.threeDSecure,
      this.wallet});

  Card.fromJson(Map<String, dynamic> json) {
    amountAuthorized = json['amount_authorized'];
    brand = json['brand'];
    checks =
        json['checks'] != null ? new Checks.fromJson(json['checks']) : null;
    country = json['country'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    extendedAuthorization = json['extended_authorization'] != null
        ? new ExtendedAuthorization.fromJson(json['extended_authorization'])
        : null;
    fingerprint = json['fingerprint'];
    funding = json['funding'];
    incrementalAuthorization = json['incremental_authorization'] != null
        ? new ExtendedAuthorization.fromJson(json['incremental_authorization'])
        : null;
    installments = json['installments'];
    last4 = json['last4'];
    mandate = json['mandate'];
    multicapture = json['multicapture'] != null
        ? new ExtendedAuthorization.fromJson(json['multicapture'])
        : null;
    network = json['network'];
    networkToken = json['network_token'] != null
        ? new NetworkToken.fromJson(json['network_token'])
        : null;
    overcapture = json['overcapture'] != null
        ? new Overcapture.fromJson(json['overcapture'])
        : null;
    threeDSecure = json['three_d_secure'];
    wallet = json['wallet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount_authorized'] = this.amountAuthorized;
    data['brand'] = this.brand;
    if (this.checks != null) {
      data['checks'] = this.checks!.toJson();
    }
    data['country'] = this.country;
    data['exp_month'] = this.expMonth;
    data['exp_year'] = this.expYear;
    if (this.extendedAuthorization != null) {
      data['extended_authorization'] = this.extendedAuthorization!.toJson();
    }
    data['fingerprint'] = this.fingerprint;
    data['funding'] = this.funding;
    if (this.incrementalAuthorization != null) {
      data['incremental_authorization'] =
          this.incrementalAuthorization!.toJson();
    }
    data['installments'] = this.installments;
    data['last4'] = this.last4;
    data['mandate'] = this.mandate;
    if (this.multicapture != null) {
      data['multicapture'] = this.multicapture!.toJson();
    }
    data['network'] = this.network;
    if (this.networkToken != null) {
      data['network_token'] = this.networkToken!.toJson();
    }
    if (this.overcapture != null) {
      data['overcapture'] = this.overcapture!.toJson();
    }
    data['three_d_secure'] = this.threeDSecure;
    data['wallet'] = this.wallet;
    return data;
  }
}

class Checks {
  Null? addressLine1Check;
  Null? addressPostalCodeCheck;
  String? cvcCheck;

  Checks({this.addressLine1Check, this.addressPostalCodeCheck, this.cvcCheck});

  Checks.fromJson(Map<String, dynamic> json) {
    addressLine1Check = json['address_line1_check'];
    addressPostalCodeCheck = json['address_postal_code_check'];
    cvcCheck = json['cvc_check'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_line1_check'] = this.addressLine1Check;
    data['address_postal_code_check'] = this.addressPostalCodeCheck;
    data['cvc_check'] = this.cvcCheck;
    return data;
  }
}

class ExtendedAuthorization {
  String? status;

  ExtendedAuthorization({this.status});

  ExtendedAuthorization.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}

class NetworkToken {
  bool? used;

  NetworkToken({this.used});

  NetworkToken.fromJson(Map<String, dynamic> json) {
    used = json['used'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['used'] = this.used;
    return data;
  }
}

class Overcapture {
  int? maximumAmountCapturable;
  String? status;

  Overcapture({this.maximumAmountCapturable, this.status});

  Overcapture.fromJson(Map<String, dynamic> json) {
    maximumAmountCapturable = json['maximum_amount_capturable'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maximum_amount_capturable'] = this.maximumAmountCapturable;
    data['status'] = this.status;
    return data;
  }
}

class Shipping {
  Address? address;
  Null? carrier;
  String? name;
  Null? phone;
  Null? trackingNumber;

  Shipping(
      {this.address, this.carrier, this.name, this.phone, this.trackingNumber});

  Shipping.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    carrier = json['carrier'];
    name = json['name'];
    phone = json['phone'];
    trackingNumber = json['tracking_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['carrier'] = this.carrier;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['tracking_number'] = this.trackingNumber;
    return data;
  }
}

class Source {
  String? id;
  String? object;
  Null? addressCity;
  Null? addressCountry;
  Null? addressLine1;
  Null? addressLine1Check;
  Null? addressLine2;
  Null? addressState;
  Null? addressZip;
  Null? addressZipCheck;
  String? brand;
  String? country;
  String? customer;
  String? cvcCheck;
  Null? dynamicLast4;
  int? expMonth;
  int? expYear;
  String? fingerprint;
  String? funding;
  String? last4;
  Null? name;
  Null? tokenizationMethod;
  Null? wallet;

  Source(
      {this.id,
      this.object,
      this.addressCity,
      this.addressCountry,
      this.addressLine1,
      this.addressLine1Check,
      this.addressLine2,
      this.addressState,
      this.addressZip,
      this.addressZipCheck,
      this.brand,
      this.country,
      this.customer,
      this.cvcCheck,
      this.dynamicLast4,
      this.expMonth,
      this.expYear,
      this.fingerprint,
      this.funding,
      this.last4,
      this.name,
      this.tokenizationMethod,
      this.wallet});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    addressCity = json['address_city'];
    addressCountry = json['address_country'];
    addressLine1 = json['address_line1'];
    addressLine1Check = json['address_line1_check'];
    addressLine2 = json['address_line2'];
    addressState = json['address_state'];
    addressZip = json['address_zip'];
    addressZipCheck = json['address_zip_check'];
    brand = json['brand'];
    country = json['country'];
    customer = json['customer'];
    cvcCheck = json['cvc_check'];
    dynamicLast4 = json['dynamic_last4'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    fingerprint = json['fingerprint'];
    funding = json['funding'];
    last4 = json['last4'];
    name = json['name'];
    tokenizationMethod = json['tokenization_method'];
    wallet = json['wallet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['address_city'] = this.addressCity;
    data['address_country'] = this.addressCountry;
    data['address_line1'] = this.addressLine1;
    data['address_line1_check'] = this.addressLine1Check;
    data['address_line2'] = this.addressLine2;
    data['address_state'] = this.addressState;
    data['address_zip'] = this.addressZip;
    data['address_zip_check'] = this.addressZipCheck;
    data['brand'] = this.brand;
    data['country'] = this.country;
    data['customer'] = this.customer;
    data['cvc_check'] = this.cvcCheck;
    data['dynamic_last4'] = this.dynamicLast4;
    data['exp_month'] = this.expMonth;
    data['exp_year'] = this.expYear;
    data['fingerprint'] = this.fingerprint;
    data['funding'] = this.funding;
    data['last4'] = this.last4;
    data['name'] = this.name;
    data['tokenization_method'] = this.tokenizationMethod;
    data['wallet'] = this.wallet;
    return data;
  }
}

class Pagination {
  int? totalDocuments;
  int? totalPage;
  int? currentPage;
  Null? previousPage;
  Null? nextPage;

  Pagination(
      {this.totalDocuments,
      this.totalPage,
      this.currentPage,
      this.previousPage,
      this.nextPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalDocuments = json['totalDocuments'];
    totalPage = json['totalPage'];
    currentPage = json['currentPage'];
    previousPage = json['previousPage'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalDocuments'] = this.totalDocuments;
    data['totalPage'] = this.totalPage;
    data['currentPage'] = this.currentPage;
    data['previousPage'] = this.previousPage;
    data['nextPage'] = this.nextPage;
    return data;
  }
}
