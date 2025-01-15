// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sonmit/components/card.dart';

class FormTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget? prefixIcon;
  final bool hassuffixIcon;
  bool obscureText;
  TextInputType? keyboardType;
  void Function(String value)? onChanged;
  FormFieldValidator<String>? validator;
  int? maxLength;
  int? maxlines;
  int? minlines;
  final bool filled;
  List<TextInputFormatter>? inputFormatters;
  final Color? filledColor;
  void Function(String value)? onFieldSubmitted;
  bool autofocus;
  FocusNode? focusNode;
  void Function(PointerDownEvent)? onTapOutside;

  FormTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
    this.onChanged,
    this.prefixIcon,
    this.hassuffixIcon = false,
    this.keyboardType,
    this.validator,
    this.maxLength,
    this.maxlines,
    this.minlines,
    this.inputFormatters,
    this.filled = false,
    this.filledColor,
    this.onFieldSubmitted,
    this.autofocus = false,
    this.focusNode,
    this.onTapOutside,
  });

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.key,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      onTapOutside:widget.onTapOutside??(event) => FocusScope.of(context).unfocus(),
      maxLines: widget.maxlines,
      minLines: widget.minlines,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: TextInputAction.done,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        // labelText: "Password",
        filled: widget.filled,
        fillColor: widget.filledColor,
        hintText: widget.hintText,
        
        // filled: true,
        counter: const SizedBox(
          height: 0,
        ),
        // hintStyle: TextStyle(
        //   color: Theme.of(context).colorScheme.surface,
        // ),
        // labelStyle: TextStyle(
        //   color: Theme.of(context).colorScheme.surface,
        // ),
        // errorStyle: TextStyle(
        //   color: Theme.of(context).colorScheme.onError,
        // ),
        // prefixIconColor: Theme.of(context).colorScheme.surface,
        // focusColor: Theme.of(context).colorScheme.surface,
        // hoverColor: Theme.of(context).colorScheme.surface,
        // suffixIconColor: Theme.of(context).colorScheme.surface,

        prefixIcon: widget.prefixIcon,
        // focusedBorder: OutlineInputBorder(
        //   color: Theme.of(context).colorScheme.
        //   borderRadius: BorderRadius.circular(5.0),
        // ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        suffixIcon: widget.hassuffixIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
                icon: Icon(widget.obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined),
              )
            : null,
      ),
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class ElevatedFormTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final bool hassuffixIcon;
  bool obscureText;
  TextInputType? keyboardType;
  void Function(String value)? onChanged;
  FormFieldValidator<String>? validator;
  int? maxLength;
  final bool filled;
  List<TextInputFormatter>? inputFormatters;
  final Color? filledColor;

  ElevatedFormTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
    this.labelText,
    this.onChanged,
    this.prefixIcon,
    this.hassuffixIcon = false,
    this.keyboardType,
    this.validator,
    this.maxLength,
    this.inputFormatters,
    this.filled = false,
    this.filledColor,
  });

  @override
  State<ElevatedFormTextField> createState() => _ElevatedFormTextFieldState();
}

class _ElevatedFormTextFieldState extends State<ElevatedFormTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: ElevatedCard(
        padding: EdgeInsets.all(0),
        borderRadius: BorderRadius.circular(30),
        shadowColorLow: Color(0xFFF1A873),
        shadowColorHigh: Color(0xFF984001),
        child: TextFormField(
          key: widget.key,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          onChanged: widget.onChanged,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 122, 51, 0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Color(0xFFFFF1E7),
              ),
            ),
            // labelText: "Password",
            filled: widget.filled,
            fillColor: widget.filledColor,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Color(0xFFFFF1E7),
            ),
            labelStyle: TextStyle(
              color: Color(0xFFFFF1E7),
            ),
            errorStyle: TextStyle(
              color: Color(0xFFFFF1E7),
            ),

            prefixIconColor: Color(0xFFFFF1E7),
            focusColor: Color(0xFFFFF1E7),
            hoverColor: Color.fromARGB(255, 223, 93, 1),
            suffixIconColor: Color(0xFFFFF1E7),
            labelText: widget.labelText,
            // hintText: "Enter your code",
            // prefixIcon: const Icon(Icons.vpn_key_outlined),
            // filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            // filled: true,
            counter: const SizedBox(
              height: 0,
            ),
            // hintStyle: TextStyle(
            //   color: Theme.of(context).colorScheme.surface,
            // ),
            // labelStyle: TextStyle(
            //   color: Theme.of(context).colorScheme.surface,
            // ),
            // errorStyle: TextStyle(
            //   color: Theme.of(context).colorScheme.onError,
            // ),
            // prefixIconColor: Theme.of(context).colorScheme.surface,
            // focusColor: Theme.of(context).colorScheme.surface,
            // hoverColor: Theme.of(context).colorScheme.surface,
            // suffixIconColor: Theme.of(context).colorScheme.surface,

            prefixIcon: widget.prefixIcon,
            // focusedBorder: OutlineInputBorder(
            //   color: Theme.of(context).colorScheme.
            //   borderRadius: BorderRadius.circular(5.0),
            // ),

            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(5.0),
            // ),
            suffixIcon: widget.hassuffixIcon
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText;
                      });
                    },
                    icon: Icon(widget.obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                  )
                : null,
          ),
          style: TextStyle(
            color: Color(0xFFFFF1E7),
          ),
        ),
      ),
    );
  }
}
