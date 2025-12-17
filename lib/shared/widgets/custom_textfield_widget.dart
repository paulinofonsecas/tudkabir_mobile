import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tudkabir/shared/utils/theming.dart';
import 'package:tudkabir/shared/widgets/context_extension.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    required this.hintText,
    super.key,
    this.backgroundColor,
    this.preffixIconParam,
    this.textInputAction,
    this.labelText = '',
    this.suffixIconParam,
    this.inputFormatters,
    this.validator,
    this.isPassword = false,
    this.onPresentPassword,
    this.onChanged,
    this.focusNode,
    this.onEditingComplete,
    this.keyboardType,
  });
  final TextEditingController controller;
  final Color? backgroundColor;
  final String hintText;
  final bool? isPassword;
  final ValueChanged<bool>? onPresentPassword;

  final PreffixIconParam? preffixIconParam;
  final SuffixIconParam? suffixIconParam;
  final String labelText;
  final VoidCallback? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final FocusNode? _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode;
    _focusNode?.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _focusNode?.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _focusNode?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.backgroundColor ?? AppTheme.secondaryColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty) ...[
          Text(widget.labelText, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
        ],
        TextFormField(
          onEditingComplete: widget.onEditingComplete,
          focusNode: _focusNode,
          validator: widget.validator,
          onChanged: widget.onChanged,
          obscureText: widget.isPassword ?? false,
          textInputAction: widget.textInputAction,
          inputFormatters: widget.inputFormatters,
          controller: widget.controller,
          cursorColor: context.colorScheme.secondary,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: backgroundColor,
            hintText: widget.hintText,
            hintStyle: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSurface.withAlpha(100),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                width: 1.5,
                color: context.colorScheme.secondary,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppTheme.borderTextFieldColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppTheme.borderTextFieldColor,
              ),
            ),
            prefixIcon: (widget.preffixIconParam != null)
                ? Padding(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset(
                      widget.preffixIconParam!.icon ?? '',
                      colorFilter: ColorFilter.mode(
                        widget.preffixIconParam?.iconColor ??
                            context.colorScheme.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : null,
            suffixIcon: (widget.suffixIconParam != null)
                ? GestureDetector(
                    onTap: widget.suffixIconParam?.onTap,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child:
                          widget.suffixIconParam?.icon.runtimeType == IconData
                          ? Icon(
                              widget.suffixIconParam?.icon as IconData,
                              color: context.colorScheme.onSurface.withAlpha(
                                100,
                              ),
                              size: 18,
                            )
                          : SvgPicture.asset(
                              widget.suffixIconParam!.icon as String? ?? '',
                              width: 18,
                              colorFilter: ColorFilter.mode(
                                context.colorScheme.onSurface.withAlpha(100),
                                BlendMode.srcIn,
                              ),
                            ),
                    ),
                  )
                : null,
          ),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class PreffixIconParam {
  PreffixIconParam({this.icon, this.onTap, this.color, this.iconColor});
  String? icon;
  VoidCallback? onTap;
  Color? color;
  Color? iconColor;
}

class SuffixIconParam {
  SuffixIconParam({this.icon, this.onTap, this.color});
  dynamic icon;
  VoidCallback? onTap;
  Color? color;
}
