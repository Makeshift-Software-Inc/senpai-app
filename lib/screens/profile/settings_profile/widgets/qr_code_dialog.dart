import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:senpai/l10n/resources.dart';
import 'package:senpai/screens/profile_fill/widgets/custom_close_button.dart';
import 'package:senpai/utils/constants.dart';
import 'package:senpai/utils/methods/utils.dart';

class QRCodeDialog extends StatelessWidget {
  const QRCodeDialog({Key? key, required this.qrData}) : super(key: key);

  final String qrData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: $constants.referral.qrDialogContainerHeight2,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: $constants.referral.qrDialogContainerHeight,
              margin: EdgeInsets.symmetric(horizontal: $constants.insets.sm),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular($constants.corners.xlg),
                color: $constants.palette.lightBlue,
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: $constants.insets.md, left: $constants.insets.sm),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      R.strings.scanQRCodeTitle,
                      style: getTextTheme(context)
                          .headlineSmall
                          ?.copyWith(fontSize: 20),
                    ),
                    SizedBox(height: $constants.insets.md),
                    Container(
                      padding: EdgeInsets.all($constants.insets.xxxs),
                      decoration: BoxDecoration(
                        gradient: $constants.palette.lineGradient,
                        borderRadius:
                            BorderRadius.circular($constants.corners.xl),
                      ),
                      child: Container(
                        padding: EdgeInsets.all($constants.insets.md),
                        decoration: BoxDecoration(
                          color: $constants.palette.lightBlue,
                          borderRadius:
                              BorderRadius.circular($constants.corners.xl),
                        ),
                        child: QrImageView(
                            data: qrData,
                            version: QrVersions.auto,
                            backgroundColor: $constants.palette.white,
                            size: $constants.referral.qrCodeSize),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: $constants.insets.sm,
            child: CustomCloseButton(
              borderColor: $constants.palette.black.withOpacity(0.6),
              backgroundColor: $constants.palette.appBackground,
              onTapButton: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
