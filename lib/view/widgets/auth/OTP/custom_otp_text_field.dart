// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class CustomOtpTextField extends StatelessWidget {
//   const CustomOtpTextField({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final textController = TextEditingController();
//
//     return SizedBox(
//       height: 50.5,
//       width: 46,
//       child: TextFormField(
//         decoration: InputDecoration(hintText: '0'),
//         onSaved: (newValue) {
//
//         },
//         onChanged: (value) {
//           if (value.length == 1) {
//             FocusScope.of(context).nextFocus();
//           }
//         },
//         controller: textController,
//         style: Theme.of(context).textTheme.headlineSmall,
//         keyboardType: TextInputType.number,
//         textAlign: TextAlign.center,
//         inputFormatters: [
//           LengthLimitingTextInputFormatter(1),
//           FilteringTextInputFormatter.digitsOnly,
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOtpTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  const CustomOtpTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.5,
      width: 46,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        decoration: const InputDecoration(
          hintText: '.',
          border: OutlineInputBorder(),
        ),
        style: Theme.of(context).textTheme.headlineSmall,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.isNotEmpty) {
            nextFocusNode?.requestFocus(); // Move to next field
          } else {
            focusNode.previousFocus(); // Move back if empty
          }
        },
      ),
    );
  }
}
