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
      padding: const EdgeInsets.only(bottom: 10.0, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
            ? MainAxisAlignment.end
            : MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(" Search",
                  style: TextStyle(
                      fontFamily: 'MontserratMedium',
                      color: kBgShade,
                      fontSize: ResponsiveWidget.isLargeScreen(
                          context)
                          ? 14
                          : 12)),
              const SizedBox(height: 2),
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
                        width: kFilterButtonWidth(context),
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
                              color: kPrimaryTextColor,
                              fontSize: ResponsiveWidget.isLargeScreen(
                                  context)
                                  ? 14
                                  : 12,
                              fontFamily: 'MontserratRegular'),
                          decoration: InputDecoration(
                              counterText: "",
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 18),
                              isDense: true,
                              filled: true,
                              errorMaxLines: 2,
                              fillColor: Colors.white,
                              border: outlineBorder(),
                              enabledBorder: outlineBorder(),
                              focusedBorder: outlineBorder(),
                              hintText: "Search...",
                              hintStyle: const TextStyle(
                                  fontFamily: 'MontserratRegular',
                                  color: kPrimaryTextColorShade),
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
        ],
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8.0));
  }
}
