import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/pages.dart';

class ShowClient extends StatefulWidget {
  final String nom;

  const ShowClient({Key? key, required this.nom}) : super(key: key);

  @override
  _ShowElementState createState() => _ShowElementState();
}

class _ShowElementState extends State<ShowClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Hero(
        tag: 'tag',
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 10,
                offset: const Offset(0, 10))
          ]),
          child: Stack(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: IconButton(
                            onPressed: () =>
                              Get.toNamed(Routes.CLIENTS),
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 255, 255, 1)),
                      child: const Center(
                        child: Icon(
                          Icons.person,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: 800,
                child: FadeInUp(
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.9),
                            Colors.black.withOpacity(.0),
                          ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FadeInUp(
                              duration: const Duration(milliseconds: 1300),
                              child: Text(
                                widget.nom,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold),
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          FadeInUp(
                              duration: const Duration(milliseconds: 1400),
                              child: const Text(
                                "Telephone",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          FadeInUp(
                              duration: const Duration(milliseconds: 1500),
                              child: const Text(
                                "Telephone",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          FadeInUp(
                              duration: const Duration(milliseconds: 1600),
                              child: const Text(
                                "Telephone",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          FadeInUp(
                              duration: const Duration(milliseconds: 1700),
                              child: const Text(
                                "Telephone",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          FadeInUp(
                              duration: const Duration(milliseconds: 1800),
                              child: const Text(
                                "Telephone",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          FadeInUp(
                              duration: const Duration(milliseconds: 1900),
                              child: const Text(
                                "Telephone",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          const SizedBox(
                            height: 60,
                          ),
                          FadeInUp(
                              duration: const Duration(milliseconds: 2000),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Text(
                                  'Modifier',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
