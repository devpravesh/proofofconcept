import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proofofconecpt/model.dart';
import 'package:proofofconecpt/searchcity.dart';
import 'package:proofofconecpt/services.dart';
import 'package:proofofconecpt/valuestoring.dart';

class Fetching extends GetxController {
  Rxn<Poc> responcelist = Rxn<Poc>();
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchdetails();
    // getSum();
    super.onInit();
  }

  void fetchdetails() async {
    isLoading(true);
    try {
      var orderList = await Services.pocservices();
      if (orderList.isBlank != null) {
        responcelist.value = orderList;
      }
    } finally {
      isLoading(false);
    }
  }
}

class CustomSearchDelegate extends SearchDelegate {
  StoredValue _controller = Get.find<StoredValue>();

  var suggestion = ["Agra", "Mumbai"];
  List<String> searchResult = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchResult.clear();
    searchResult = _controller.allNames
        .where((element) => element.startsWith(query))
        .toList();
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          scrollDirection: Axis.vertical,
          children: List.generate(searchResult.length, (index) {
            var item = searchResult[index];
            return InkWell(
              onTap: () {
                _controller.selectedcity(item);
                //it comes after search
                Get.back();
              },
              child: Card(
                color: Colors.white,
                child: Container(
                    padding: const EdgeInsets.all(16), child: Text(item)),
              ),
            );
          })),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? suggestion
        : _controller.allNames
            .where((element) => element.startsWith(query))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          if (query.isEmpty) {
            query = suggestion[index];
            _controller.selectedcity(suggestion[index]);
            Get.back();
          } else {
            _controller.selectedcity(suggestionList[index]);
            Get.back();
          }
        },
        leading: Icon(query.isEmpty ? Icons.history : Icons.search),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: const TextStyle(color: Colors.black),
              )
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}

class CustomSearchLocation extends SearchDelegate {
  StoredValue _controller = Get.find<StoredValue>();

  var suggestion = ["Bhandup", "Kalwa"];
  List<String> searchResult = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchResult.clear();
    searchResult = _controller.allLocation
        .where((element) => element.startsWith(query))
        .toList();
    return Container(
      margin: const EdgeInsets.all(20),
      child: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          scrollDirection: Axis.vertical,
          children: List.generate(searchResult.length, (index) {
            var item = searchResult[index];
            return InkWell(
              onTap: () {
                _controller.selectedLocation(item);
                //it comes after search
                Get.back();
              },
              child: Card(
                color: Colors.white,
                child: Container(
                    padding: const EdgeInsets.all(16), child: Text(item)),
              ),
            );
          })),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? suggestion
        : _controller.allLocation
            .where((element) => element.startsWith(query))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          if (query.isEmpty) {
            query = suggestion[index];
            _controller.selectedLocation(suggestion[index]);
            Get.back();
          } else {
            _controller.selectedLocation(suggestionList[index]);
            Get.back();
          }
        },
        leading: Icon(query.isEmpty ? Icons.history : Icons.search),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: const TextStyle(color: Colors.black),
              )
            ])),
      ),
      itemCount: suggestionList.length,
    );
  }
}
