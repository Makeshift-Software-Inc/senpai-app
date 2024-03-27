import 'package:senpai/l10n/resources.dart';
//TODO: Cosplay from BE
//required
//optional

enum CosplayStatus {
  required,
  optional,
  no;

  static CosplayStatus cosplayFromServer(String? cosplay) {
    if (cosplay == 'required') {
      return CosplayStatus.required;
    } else if (cosplay == 'optional') {
      return CosplayStatus.optional;
    } else {
      return CosplayStatus.no;
    }
  }
}

String cosplayToString(CosplayStatus cosplay) {
  if (cosplay == CosplayStatus.required) {
    return R.strings.yesButton.toUpperCase();
  } else if (cosplay == CosplayStatus.optional) {
    return R.strings.optionalButton.toUpperCase();
  } else {
    return R.strings.noButton.toUpperCase();
  }
}

bool isCosplayRequired(CosplayStatus? type) {
  return type == CosplayStatus.required || type == CosplayStatus.optional;
}

String cosplayToServer(CosplayStatus? cosplay) {
  if (cosplay == CosplayStatus.required) {
    return 'required';
  } else if (cosplay == CosplayStatus.optional) {
    return 'optional';
  } else {
    return 'no';
  }
}

enum PaymentRequired {
  required,
  no;
}

String paymentToString(PaymentRequired payment) {
  if (payment == PaymentRequired.required) {
    return R.strings.yesButton.toUpperCase();
  } else {
    return R.strings.noButton.toUpperCase();
  }
}
