class QuizQuestion {
  const QuizQuestion(this.text, this.answers, this.imagePath);

  final String text;
  final List<String> answers;
  final List<String> imagePath;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }

  List<String> getShuffledImages() {
    final shuffledImageList = List.of(imagePath);
    shuffledImageList.shuffle();
    return shuffledImageList;
  }
}
