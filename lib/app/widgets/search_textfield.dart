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
    return SizedBox(
      width: kSearchFieldWidth(context),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: ResponsiveWidget.isLargeScreen(context) ? 22 : 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.5),
                    child: SizedBox(
                      width: ResponsiveWidget.isSmallScreen(context) ? 120 : 200,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        readOnly: false,
                        onSaved: (value) => searchController.text = value!,
                        onFieldSubmitted: (value) =>
                            searchController.text = value,
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
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ResponsiveWidget.isSmallScreen(
                                context)
                                ? 11
                                : 13,
                            fontFamily: 'MontserratRegular'),
                        decoration: InputDecoration(
                            counterText: "",
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 16),
                            isDense: true,
                            filled: true,
                            errorMaxLines: 2,
                            fillColor: kBgColor,
                            border: outlineBorder(),
                            enabledBorder: outlineBorder(),
                            focusedBorder: outlineBorder(),
                            hintText: "Search",
                            hintStyle: const TextStyle(
                                fontFamily: 'MontserratRegular',
                                color: Colors.white54),
                            errorStyle: const TextStyle(height: 1),
                            floatingLabelBehavior:
                                FloatingLabelBehavior.auto),
                        keyboardType: TextInputType.text,
                        controller: searchController,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: kBgColor),
        borderRadius: BorderRadius.circular(8.0));
  }
}
