library flexible_text_editing_controller;

import 'package:flutter/widgets.dart';

class FlexibleTextEditingController extends TextEditingController {
  /// a custom controller based on [TextEditingController] used to actively style input text based on the styler you set.
  /// {@tool snippet}
  ///TextSpan styler(String text, TextStyle? defaultStyle) {
  ///  List<TextSpan> children = [];
  ///   for (int i = 0; i < text.length; i++) {
  ///     i % 2 == 0
  ///      ? children.add(TextSpan(
  ///          text: text.substring(i, i + 1),
  ///          style: TextStyle(color: Colors.red)))
  ///       :children.add(TextSpan(
  ///           text: text.substring(i, i + 1),
  ///           style: TextStyle(color: Colors.blue)));
  ///   }
  ///   return TextSpan(style: defaultStyle, children: children);
  /// };
  /// /// FlexibleTextEditingController controller = FlexibleTextEditingController();
  /// ```
  /// {@end-tool}
  FlexibleTextEditingController({required this.styler, String? text }):
    super(text: text);

  TextSpan Function(String, TextStyle?) styler;


  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    return styler(text, style);
  }
}
