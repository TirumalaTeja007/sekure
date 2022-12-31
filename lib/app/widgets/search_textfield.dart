import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartsocket/constants/constants.dart';
import 'package:smartsocket/utils/debouncer.dart';
import 'package:smartsocket/utils/responsive.dart';
import 'package:smartsocket/constants/color_constants.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget(
      this.searchController, this.searchedKeyword, this.searchDebouncer,
      {Key? key})
      : super(key: key);
  final TextEditingController searchController;
  final RxString searchedKeyword;
  final Debouncer searchDebouncer;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          SizedBox(
            width: kSearchFieldWidth(context),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              readOnly: false,
              onSaved: (value) => searchController.text = value!,
              onFieldSubmitted: (value) => searchController.text = value,
              onChanged: (value) {
                print(value);
                searchDebouncer.run(() {
                  if (value.isNotEmpty) {
                    searchedKeyword.value = value;
                  } else {
                    searchedKeyword.value = "";
                  }
                });
              },
              textAlign: TextAlign.start,
              enableInteractiveSelection: true,
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                  color: kPrimaryTextColor,
                  fontSize: 16,
                  fontFamily: 'MontserratRegular'),
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  counterText: "",
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  isDense: true,
                  filled: true,
                  errorMaxLines: 2,
                  fillColor: Colors.white24,
                  border: outlineBorder(),
                  enabledBorder: outlineBorder(),
                  focusedBorder: outlineBorder(),
                  labelText: "Search",
                  labelStyle: const TextStyle(
                      fontFamily: 'MontserratRegular',
                      color: kPrimaryTextColorShade),
                  errorStyle: const TextStyle(height: 1),
                  floatingLabelBehavior: FloatingLabelBehavior.auto),
              keyboardType: TextInputType.text,
              controller: searchController,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: kPrimaryTextColor),
        borderRadius: BorderRadius.circular(8.0));
  }
}
