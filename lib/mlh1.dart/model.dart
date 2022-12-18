import 'package:flutter/cupertino.dart';

class Question {
  final String text;
  final List options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool isCorrect;

  Option({required this.text, required this.isCorrect});
}

final question = <Question>[
  Question(
      text: "Alphabets are letter in english language. which is what ?",
      options: [
        Option(text: "ABCD", isCorrect: false),
        Option(text: "EFGH", isCorrect: false),
        Option(text: "IJKL", isCorrect: true),
        Option(text: "MNOP", isCorrect: false),
      ]),
  Question(
      text: "Alphabets are letter in english language. which is what ?",
      options: [
        Option(text: "ABCD", isCorrect: false),
        Option(text: "EFGH", isCorrect: false),
        Option(text: "IJKL", isCorrect: true),
        Option(text: "MNOP", isCorrect: false),
      ]),
  Question(
      text: "Alphabets are letter in english language. which is what ?",
      options: [
        Option(text: "ABCD", isCorrect: false),
        Option(text: "EFGH", isCorrect: false),
        Option(text: "IJKL", isCorrect: true),
        Option(text: "MNOP", isCorrect: false),
      ]),
  Question(
      text: "Alphabets are letter in english language. which is what ?",
      options: [
        Option(text: "ABCD", isCorrect: false),
        Option(text: "EFGH", isCorrect: false),
        Option(text: "IJKL", isCorrect: true),
        Option(text: "MNOP", isCorrect: false),
      ]),
  Question(
      text: "Alphabets are letter in english language. which is what ?",
      options: [
        Option(text: "ABCD", isCorrect: false),
        Option(text: "EFGH", isCorrect: false),
        Option(text: "IJKL", isCorrect: true),
        Option(text: "MNOP", isCorrect: false),
      ]),
];
