import 'package:maple/popups/popup_form.dart';
import 'package:maple/popups/popup_widgets.dart';
import 'package:flutter/material.dart';

class AddEventDialog extends StatelessWidget {
  const AddEventDialog({
    Key? key,
    required this.controller,
    required this.onAccept,
    required this.onCancel,
  }) : super(key: key);

  final TextEditingController controller;
  final VoidCallback onAccept;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PopupForm(
        popupTitle: '添加任务',
        popupSubtitle: 'Add an event to mark it on the calendar',
        popupFormContent: [
          PopupFormField(
            popupHintText: '您的任务',
            popupIcon: const Icon(Icons.event_rounded),
            textController: controller,
          ),
        ],
        popupFormActions: <Widget>[
          PopupOutlinedButton(
            onPressed: onCancel,
            text: '取消',
          ),
          PopupFilledButton(
            onPressed: onAccept,
            text: '确认',
          ),
        ],
      ),
    );
  }
}