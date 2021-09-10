import 'package:booster/booster.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newuiproject/presentation/views/connection_options.dart';
import 'package:newuiproject/presentation/views/terms_and_conditions.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool isChecked = false;
  bool isDateSelected = false;
  String countryName = "";
  String? _selectedGender;
  List<String> _genderList = ["Male", "Female", "No-Binary"];

  toggleCheck() {
    isChecked = !isChecked;
    setState(() {});
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        isDateSelected = true;
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Booster.verticalSpace(42),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 113,
                    width: 113,
                  ),
                ],
              ),
              Booster.verticalSpace(47),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Card(
                  elevation: 3,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              Booster.verticalSpace(18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Card(
                  elevation: 3,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              Booster.verticalSpace(18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Card(
                  elevation: 3,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              Booster.verticalSpace(18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Card(
                  elevation: 3,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
              ),
              Booster.verticalSpace(18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 3,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "First Name",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    Booster.horizontalSpace(5),
                    Expanded(
                      child: Card(
                        elevation: 3,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Last Name",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Booster.verticalSpace(24),
              Padding(
                padding: const EdgeInsets.only(left: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Booster.dynamicFontSize(
                        label: 'Optional',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff010101)),
                  ],
                ),
              ),
              Booster.verticalSpace(18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Card(
                            elevation: 3,
                            child: Container(
                              height: 50,
                              child: Center(
                                child: Text(!isDateSelected
                                    ? "BOD"
                                    : DateFormat('dd/MM/yyyy')
                                        .format(selectedDate)),
                              ),
                            )),
                      ),
                    ),
                    Booster.horizontalSpace(5),
                    _getGenderDropDown(context),
                    Booster.horizontalSpace(5),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: true,
                            // optional. Shows phone code before the country name.
                            onSelect: (Country country) {
                              countryName = country.name;
                              setState(() {});
                              print('Select country: ${country.displayName}');
                            },
                          );
                        },
                        child: Card(
                            elevation: 3,
                            child: Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                    countryName == "" ? "Origin" : countryName),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Booster.verticalSpace(21),
              Padding(
                padding: const EdgeInsets.only(left: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          toggleCheck();
                        },
                        child: Icon(!isChecked
                            ? Icons.check_box_outline_blank
                            : Icons.check_box)),
                    Booster.horizontalSpace(5),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsAndConditions()));
                      },
                      child: Booster.dynamicFontSize(
                        label: 'Terms and Conditions',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Booster.verticalSpace(23),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConnectionOptions()));
                  },
                  child: Container(
                    width: Booster.screenWidth(context),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black),
                    child: Booster.paddedWidget(
                        top: 17,
                        bottom: 15,
                        child: Booster.dynamicFontSize(
                            label: "Create Account",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ),
              Booster.verticalSpace(30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getGenderDropDown(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 3,
        child: Container(
          height: 50,
          child: Padding(
            padding: EdgeInsets.only(left: 4, right: 4),
            child: DropdownButton<String?>(
              value: _selectedGender,
              items: _genderList.map((value) {
                return DropdownMenuItem<String>(
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 12),
                  ),
                  value: value,
                );
              }).toList(),
              onChanged: (item) {
                _selectedGender = item;
                setState(() {});
              },
              underline: SizedBox(),
              hint: Text("SEX"),
              isExpanded: true,
            ),
          ),
        ),
      ),
    );
  }
}
