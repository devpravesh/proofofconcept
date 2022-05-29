import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:proofofconecpt/category.dart';
import 'package:proofofconecpt/main.dart';
import 'package:proofofconecpt/searchcity.dart';
import 'package:proofofconecpt/valuestoring.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

var gender;
var _setDate;
String? dateTime;

DateTime selectedDate = DateTime.now();

TextEditingController _dateController = TextEditingController();
StoredValue _controller = Get.put(StoredValue());

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      log("refresh");
      super.initState();
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // title: const Text(""),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () async {
              Get.to(() => Category());
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.green,
            child: const SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  "NEXT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: const [
                        Text(
                          "Let's create your",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.network(
                      "https://assets.materialup.com/uploads/e0cb0535-69d3-423e-a920-b7c05a2e5a33/attachment.jpg"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter First Name: ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(0)),
                      hintText: "Full Name",
                      suffixIcon: const Icon(Icons.person),
                      suffixIconColor: Colors.green,
                      label: Text("Full Name"),
                      hintStyle: const TextStyle(color: Colors.green),
                    ),
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: TextEditingController(
                        text: _controller.selectedDate.value),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        suffixIcon: const Icon(Icons.calendar_today),
                        hintText: "Date of Birth",
                        hintStyle: const TextStyle(color: Colors.green),
                        filled: true,
                        labelText: "Date of Birth"),
                    readOnly: true,
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    value: gender,
                    items:
                        <String>['Male', 'Female', 'Other'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        gender = value;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      hintText: "Gender",
                      hintStyle: const TextStyle(color: Colors.green),
                      filled: true,
                      label: Text("Gender"),
                    ),
                    elevation: 0,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: InkWell(
                      onTap: (() => Get.to(() => SearchPage())),
                      child: Container(
                        width: Get.width,
                        height: 50,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_controller.selectedcity.value != ''
                                    ? _controller.selectedcity.value
                                    : 'Job City'),
                                const Icon(Icons.search),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (_controller.selectedLocation.value != '')
                    Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Container(
                        width: Get.width,
                        height: 50,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(_controller.selectedLocation.value != ''
                                    ? _controller.selectedLocation.value
                                    : 'Job Location'),
                                const Icon(Icons.search),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(
        DateTime.now().year - 14,
      ),
      firstDate: DateTime(1950),
      lastDate: DateTime(DateTime.now().year - 13),
    );
    if (picked != null && picked != selectedDate) {
      String convertedDateTime =
          "${picked.year.toString()}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      _controller.selectedDate.value = convertedDateTime;
      // isSelected.value = true;
      _setDate = _controller.selectedDate.value;
    }
  }
}
