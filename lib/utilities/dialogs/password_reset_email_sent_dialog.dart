import 'package:flutter/cupertino.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog<void>(
    context: context,
    title: 'Reset Password',
    content: 'Sent and Email, please check your email.',
    optionsBuilder: () => {
      'Ok': null,
    },
  );
}
