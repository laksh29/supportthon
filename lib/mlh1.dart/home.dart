import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// -----------HOME PAGE ---------------------------
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _headingFont = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xff24285B));
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Start-a-thon"),
      ),
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.orange, width: 2.0)),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Heyyo !",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0F2E4C))),
                      Text(
                        "Laksh",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffF47E2C)),
                      )
                    ],
                  )
                ],
              ),
              // const SizedBox(height: 50),
              const Spacer(),
              options(context, "assets/sign language.png", "Sign Language",
                  "/sign"),
              const Spacer(),
              options(context, "assets/handicapped.png", "Handicapped",
                  "/handicapped"),
              const Spacer(),
              options(context, "assets/calm music.png", "Calm Music", "/music"),
            ],
          ),
        ),
      )),
    );
  }

// ---------- GESTURE DETECTOR -------------------
  GestureDetector options(
      BuildContext context, String picture, String heading, String next) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        height: 180,
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.blue),
        child: Column(children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(picture))),
          ),
          const SizedBox(height: 30),
          Text(
            heading,
            style: _headingFont,
            textAlign: TextAlign.center,
          ),
        ]),
      ),
      onTap: () {
        Navigator.pushNamed(context, next);
      },
    );
  }
}

// ----------- SIGN LANGUAGE ----------------------

class SignLanguage extends StatefulWidget {
  const SignLanguage({super.key});

  @override
  State<SignLanguage> createState() => _SignLanguageState();
}

class _SignLanguageState extends State<SignLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Language"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Text(
              "Sign Langugae is the way a normal human commuicates with people who can't see (blind) and who can hear (deaf).",
              style: GoogleFonts.poppins(
                  fontSize: 18, color: const Color(0xff0F2E4C)),
            ),
            // const SizedBox(height: 30),
            const Spacer(),
            learnGesture("Blind", "assets/blind.png", "/blind"),
            const SizedBox(height: 20),
            learnGesture("Deaf", "assets/deaf.png", "/deaf"),
            const SizedBox(height: 50),
          ],
        ),
      )),
    );
  }

  GestureDetector learnGesture(
      String learnFor, String learnPicture, String nextTo) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.blue),
        child: Row(children: [
          SizedBox(
              height: 80,
              width: 100,
              child: Image(image: AssetImage(learnPicture))),
          const SizedBox(width: 20),
          RichText(
              text: TextSpan(
                  text: "Learn to ",
                  style: GoogleFonts.poppins(color: const Color(0xff24285B)),
                  children: [
                TextSpan(
                    text: "\ncommunicate ",
                    style: GoogleFonts.poppins(color: const Color(0xff24285B))),
                TextSpan(
                    text: "\nwith the ",
                    style: GoogleFonts.poppins(color: const Color(0xff24285B))),
                TextSpan(
                    text: learnFor,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff24285B))))
              ])),
          const Spacer(),
          Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/next_page.png"),
                    fit: BoxFit.fill)),
          )
        ]),
      ),
      onTap: () {
        Navigator.pushNamed(context, nextTo);
      },
    );
  }
}



// ------------DEAF--------------------

class Deaf extends StatefulWidget {
  const Deaf({super.key});

  @override
  State<Deaf> createState() => _DeafState();
}

class _DeafState extends State<Deaf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Talk to Deaf")),
      body: const Center(child: Text("deaf")),
    );
  }
}

// -----------------handicapped--------------------

class Handicapped extends StatefulWidget {
  const Handicapped({super.key});

  @override
  State<Handicapped> createState() => HhandicappedState();
}

class HhandicappedState extends State<Handicapped> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Guid to the handicapped")),
      body: const Center(child: Text("handicapped")),
    );
  }
}

// ----------------MUSIC-------------------

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calm Music")),
      body: const Center(child: Text("music")),
    );
  }
}
