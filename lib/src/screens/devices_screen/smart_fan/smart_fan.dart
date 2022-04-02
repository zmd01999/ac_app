import 'package:maple/provider/base_view.dart';
import 'package:maple/src/screens/devices_screen/smart_fan/components/expandable_bottom_sheet.dart';
import 'package:maple/view/smart_fan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'components/body.dart';

class SmartFan extends StatelessWidget {
  static String routeName = '/smart-fan';
  const SmartFan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SmartFanViewModel>(
        onModelReady: (model) => {},
        builder: (context, model, child) {
          return Material(
            child: SlidingUpPanel(
              controller: model.pc,
              backdropEnabled: true,
              boxShadow: const [],
              minHeight: 30,
              body: Scaffold(
                backgroundColor: const Color(0xFFF2F2F2),
                body: Body(
                  model: model,
                ),
              ),
              panel: ExpandableBottomSheet(model: model),
            ),
          );
        });
  }
}
