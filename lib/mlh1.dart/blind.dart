import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supportthon/mlh1.dart/model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ----------- BLIND ---------------

class Blind extends StatefulWidget {
  const Blind({super.key});

  @override
  State<Blind> createState() => _BlindState();
}

class _BlindState extends State<Blind> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    const url = "https://www.youtube.com/watch?v=GQyWIur03aw&t=12s";
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        mute: true,
        loop: false,
        autoPlay: false,
      ),
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  void deactivate() {
    controller.pause();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) => YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller,
        ),
        builder: (context, player) => Scaffold(
          appBar: AppBar(title: const Text("Talk to the Blind")),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // youtube player
                const SizedBox(height: 20),
                player,
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // options for video
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          controller.play();
                        },
                        child: const Text("Play")),
                    const SizedBox(width: 15),
                    ElevatedButton(
                        onPressed: () {
                          controller.pause();
                        },
                        child: const Text("Pause")),
                    const SizedBox(width: 15),
                    ElevatedButton(
                        onPressed: () {
                          controller.mute();
                        },
                        child: const Text("Mute")),
                    const SizedBox(width: 15),
                    ElevatedButton(
                        onPressed: () {
                          controller.unMute();
                        },
                        child: const Text("Un-Mute"))
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Full Screen")),
                const Spacer(),
                // next button
                SizedBox(
                  width: 110,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffF47E2C)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BlindQuiz()));
                      },
                      child: Row(
                        children: [
                          Text(
                            "Next",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    // color: Color(0xff24285B),
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const Spacer(),
                          const SizedBox(
                              height: 20,
                              child: Image(
                                image: AssetImage("assets/next_page.png"),
                                fit: BoxFit.fill,
                              ))
                        ],
                      )),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
}

// -------BLIND QUIZ-----------

class BlindQuiz extends StatefulWidget {
  const BlindQuiz({super.key});

  @override
  State<BlindQuiz> createState() => _BlindQuizState();
}

class _BlindQuizState extends State<BlindQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz Time")),
      body: const QuestionWidget(),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int _questionNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 32),
          Text('Question $_questionNumber/${question.length}'),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          Expanded(
              child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: question.length,
            itemBuilder: ((context, index) {
              final _question = question[index];
              return buildQuestion(_question);
            }),
          )),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          question.text,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 32),
        Expanded(
            child: OptionWidget(
          question: question,
          onClickedOption: (option) {
            if (question.isLocked) {
              return;
            } else {
              setState(() {
                question.isLocked = true;
                question.selectedOption = option;
              });
            }
          },
        ))
      ],
    );
  }
}

class OptionWidget extends StatelessWidget {
  final question;
  final ValueChanged<Option> onClickedOption;
  const OptionWidget(
      {super.key, required this.question, required this.onClickedOption});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
          child: Column(
        children: question,
        // children: question.options
        //     .map((option) => buildOption(context, option))
        //     .toList()),
      ));

  buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option.text,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }
}
