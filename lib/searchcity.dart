import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proofofconecpt/valuestoring.dart';
import 'controller.dart';
import 'main.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  StoredValue _controller = Get.find<StoredValue>();

  final myController = TextEditingController();

  var appbartext = "Select Job City";
  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.text = _controller.selectedcity.value;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            appbartext,
            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InkWell(
                      onTap: () {
                        showSearch(
                            context: context, delegate: CustomSearchDelegate());
                      },
                      child: Container(
                        width: Get.width,
                        height: 50,
                        child: Center(
                          child: Row(
                            children: [
                              const Icon(Icons.search),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(_controller.selectedcity.value != ''
                                  ? _controller.selectedcity.value
                                  : 'Search...'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Text(_controller.selectedcity.value),
                if (_controller.selectedcity.value != '')
                  Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                          onTap: () {
                            showSearch(
                                context: context,
                                delegate: CustomSearchLocation());
                          },
                          child: Container(
                            width: Get.width,
                            height: 50,
                            child: Center(
                              child: Row(
                                children: [
                                  const Icon(Icons.search),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(_controller.selectedLocation.value != ''
                                      ? _controller.selectedLocation.value
                                      : "Search..."),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
