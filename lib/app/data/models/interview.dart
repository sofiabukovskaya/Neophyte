class Interview {
  Interview(
      {required this.id,
      required this.candidateId,
      required this.interviewTime,
      required this.link});

  final int id;
  final int candidateId;
  final String interviewTime;
  final String link;

  // ignore: sort_constructors_first
  factory Interview.fromJson(Map<String, dynamic> json) => Interview(
      id: json['id'],
      candidateId: json['candidate'],
      interviewTime: json['datetime'],
      link: json['link']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'candidate': candidateId,
        'datetime': interviewTime,
        'link': link,
      };
}
