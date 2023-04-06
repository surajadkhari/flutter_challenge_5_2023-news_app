import 'package:flutter/material.dart';
import '../../../../../const/app_const.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget(
      {super.key,
      required this.searchEditingController,
      required this.onChanged,
      required this.onPressed});
  final TextEditingController? searchEditingController;
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: const Color(0xFF013856).withAlpha(25),
              offset: const Offset(0, 1))
        ],
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: searchEditingController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: onPressed,
          ),
          hintText: AppConst.kSearchNews,
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.0),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.0, color: Colors.white)),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
