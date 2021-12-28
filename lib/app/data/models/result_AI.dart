class ResultAi {
  ResultAi({
    this.faceIsnTDetected,
    this.happy,
    this.neutral,
    this.sad,
  });

  double? faceIsnTDetected;
  double? happy;
  double? neutral;
  double? sad;

  factory ResultAi.fromJson(Map<String, dynamic> json) => ResultAi(
        faceIsnTDetected: json["Face isn`t detected"].toDouble(),
        happy: json["happy"].toDouble(),
        neutral: json["neutral"].toDouble(),
        sad: json["sad"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "Face isn`t detected": faceIsnTDetected,
        "happy": happy,
        "neutral": neutral,
        "sad": sad,
      };
}
