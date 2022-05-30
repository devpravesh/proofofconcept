import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proofofconecpt/controller.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

Fetching _controller = Get.put(Fetching());

class _CategoryState extends State<Category> {
  @override
  void initState() {
    _controller.onInit();
    super.initState();
  }

  var StoreCat = [].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(
        () => _controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                        child: Text(
                      "Let's Start by Selecting \n  Your area of Interest",
                      style: TextStyle(fontSize: 25),
                    )),
                    const SizedBox(
                      height: 100,
                    ),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Choose Your Category",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white)),
                          const Text("You have to choose atleast one category",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: const Color(0xffffffff),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFF2E3192)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                suffixIcon: const Icon(Icons.search),
                                hintText: "Search...",
                                hintStyle: const TextStyle(color: Colors.green),
                                filled: true,
                                // labelText: "Search",
                              ),
                              textCapitalization: TextCapitalization.words,
                            ),
                          ),
                          GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              // scrollDirection: Axis.vertical,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount:
                                  _controller.responcelist.value!.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var indexstore;
                                return Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Obx(() => Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  radius: 50,
                                                  child: Image.network(
                                                      _controller
                                                          .responcelist
                                                          .value!
                                                          .data![index]
                                                          .image
                                                          .toString()),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      if (StoreCat.contains(
                                                          _controller
                                                              .responcelist
                                                              .value!
                                                              .data![index]
                                                              .id)) {
                                                        StoreCat.remove(
                                                            _controller
                                                                .responcelist
                                                                .value!
                                                                .data![index]
                                                                .id);
                                                      } else {
                                                        StoreCat.add(_controller
                                                            .responcelist
                                                            .value!
                                                            .data![index]
                                                            .id
                                                            .toString());
                                                      }
                                                      print(StoreCat);
                                                    },
                                                    icon: Icon(StoreCat.contains(
                                                            _controller
                                                                .responcelist
                                                                .value!
                                                                .data![index]
                                                                .id)
                                                        ? Icons.check_box
                                                        : Icons
                                                            .check_box_outline_blank))
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              _controller.responcelist.value!
                                                  .data![index].name
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      )),
                                );
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      )),
    );
  }
}
