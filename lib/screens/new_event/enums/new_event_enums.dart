import 'package:senpai/l10n/resources.dart';
//TODO: Cosplay from BE
//required
//optional

enum CosplayRequired {
  required,
  optional,
  no;

  static CosplayRequired cosplayFromServer(String? cosplay) {
    if (cosplay == 'required') {
      return CosplayRequired.required;
    } else if (cosplay == 'optional') {
      return CosplayRequired.optional;
    } else {
      return CosplayRequired.no;
    }
  }
}

String cosplayToString(CosplayRequired cosplay) {
  if (cosplay == CosplayRequired.required) {
    return R.strings.yesButton.toUpperCase();
  } else if (cosplay == CosplayRequired.optional) {
    return R.strings.optionalButton.toUpperCase();
  } else {
    return R.strings.noButton.toUpperCase();
  }
}

String cosplayToServer(CosplayRequired cosplay) {
  if (cosplay == CosplayRequired.required) {
    return 'required';
  } else if (cosplay == CosplayRequired.optional) {
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
