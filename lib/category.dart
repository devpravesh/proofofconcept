import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      style: TextStyle(fontSize: 22, color: Colors.white)),
                  const Text("You have to choose atleast one category",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: const Color(0xffffffff),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF2E3192)),
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        // [
                        //   Image.network('https://picsum.photos/250?image=1'),
                        //   Image.network('https://picsum.photos/250?image=2'),
                        //   Image.network('https://picsum.photos/250?image=3'),
                        //   Image.network('https://picsum.photos/250?image=4'),
                        // ];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text([index].toString()),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        );
                        ;
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
