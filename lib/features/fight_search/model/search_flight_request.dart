import 'dart:convert';

class SearchFlightRequest {
  final String origin;
  final String destination;
  final DateTime date;
  SearchFlightRequest({
    required this.origin,
    required this.destination,
    required this.date,
  });

  SearchFlightRequest copyWith({
    String? origin,
    String? destination,
    DateTime? date,
  }) {
    return SearchFlightRequest(
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'origin': origin,
      'destination': destination,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory SearchFlightRequest.fromMap(Map<String, dynamic> map) {
    return SearchFlightRequest(
      origin: map['origin'] ?? '',
      destination: map['destination'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchFlightRequest.fromJson(String source) =>
      SearchFlightRequest.fromMap(json.decode(source));

  @override
  String toString() =>
      'SearchFlightRequest(origin: $origin, destination: $destination, date: $date)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchFlightRequest &&
        other.origin == origin &&
        other.destination == destination &&
        other.date == date;
  }

  @override
  int get hashCode => origin.hashCode ^ destination.hashCode ^ date.hashCode;
}
