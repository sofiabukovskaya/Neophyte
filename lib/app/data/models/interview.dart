class Interview {
  Interview({
    this.id,
    required this.candidate,
    required this.datetime,
    required this.link,
  });

  final int? id;
  final int candidate;
  final String datetime;
  final String link;

  // ignore: sort_constructors_first
  factory Interview.fromJson(Map<String, dynamic> json) => Interview(
      id: json['id'],
      candidate: json['candidate'],
      datetime: json['datetime'],
      link: json['link']);

  Map<String, dynamic> toJson() => {
        'candidate': candidate.toString(),
        'datetime': datetime,
        'link': link,
      };
}
