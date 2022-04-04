import 'package:maple/popups/popup_warning.dart';
import 'package:maple/popups/popup_widgets/popup_filled_button.dart';
import 'package:flutter/material.dart';

class SelectDayDialog extends StatelessWidget {
  const SelectDayDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupWarning(
      popupTitle: '请选择一个时间!',
      popupSubtitle: 'Select by tapping on a day',
      popupActions: <Widget>[
        PopupFilledButton(
          onPressed: () => Navigator.pop(context),
          text: '确定',
        ),
      ],
    );
  }
}