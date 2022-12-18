import 'dart:ui';

import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          height: height,
          width: width,
          color: const Color(0xffF8C12E),
          child: Column(
            children: [
              Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/wallpaper.png"),
                          fit: BoxFit.fill),
                      color: Colors.teal)),
              const SizedBox(height: 20),
              const Text(
                "Supporting Stick",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0F2E4C)),
              ),
              const Spacer(
                flex: 6,
              ),
              const Text(
                "Login",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage("assets/google search.png")),
                          border: Border.all(
                              color: const Color(0xff39B995), width: 3),
                          shape: BoxShape.circle),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 50),
                  GestureDetector(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/apple white.png"),
                            scale: 5,
                          ),
                          border: Border.all(
                              color: const Color(0xff39B995), width: 3),
                          shape: BoxShape.circle),
                    ),
                    onTap: () {},
                  )
                ],
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10),
                  )),
              const Spacer(
                flex: 1,
              ),
              Row(children: [
                const Spacer(),
                GestureDetector(
                  child: Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const Image(
                        image: AssetImage("assets/arrow.png"),
                      )),
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
