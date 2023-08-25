import 'dart:convert';

import 'package:flutter/foundation.dart';

class FlightsModel {
  final List<Flight> flights;
  FlightsModel({
    required this.flights,
  });

  FlightsModel copyWith({
    List<Flight>? flights,
  }) {
    return FlightsModel(
      flights: flights ?? this.flights,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'flights': flights.map((x) => x.toMap()).toList(),
    };
  }

  factory FlightsModel.fromMap(Map<String, dynamic> map) {
    return FlightsModel(
      flights: List<Flight>.from(
          map['flights']?.map((x) => Flight.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory FlightsModel.fromJson(String source) =>
      FlightsModel.fromMap(json.decode(source));

  @override
  String toString() => 'FlightsModel(flights: $flights)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FlightsModel && listEquals(other.flights, flights);
  }

  @override
  int get hashCode => flights.hashCode;
}

class Flight {
  final String flightNumber;
  final String airline;
  final String origin;
  final String destination;
  final String departureDate;
  final String arrivalDate;
  final String duration;
  final int price;
  final int seatsAvailable;
  Flight({
    required this.flightNumber,
    required this.airline,
    required this.origin,
    required this.destination,
    required this.departureDate,
    required this.arrivalDate,
    required this.duration,
    required this.price,
    required this.seatsAvailable,
  });

  Flight copyWith({
    String? flightNumber,
    String? airline,
    String? origin,
    String? destination,
    String? departureDate,
    String? arrivalDate,
    String? duration,
    int? price,
    int? seatsAvailable,
  }) {
    return Flight(
      flightNumber: flightNumber ?? this.flightNumber,
      airline: airline ?? this.airline,
      origin: origin ?? this.origin,
      destination: destination ?? this.destination,
      departureDate: departureDate ?? this.departureDate,
      arrivalDate: arrivalDate ?? this.arrivalDate,
      duration: duration ?? this.duration,
      price: price ?? this.price,
      seatsAvailable: seatsAvailable ?? this.seatsAvailable,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'flightNumber': flightNumber,
      'airline': airline,
      'origin': origin,
      'destination': destination,
      'departureDate': departureDate,
      'arrivalDate': arrivalDate,
      'duration': duration,
      'price': price,
      'seatsAvailable': seatsAvailable,
    };
  }

  factory Flight.fromMap(Map<String, dynamic> map) {
    return Flight(
      flightNumber: map['flightNumber'] ?? '',
      airline: map['airline'] ?? '',
      origin: map['origin'] ?? '',
      destination: map['destination'] ?? '',
      departureDate: map['departureDate'] ?? '',
      arrivalDate: map['arrivalDate'] ?? '',
      duration: map['duration'] ?? '',
      price: map['price']?.toInt() ?? 0,
      seatsAvailable: map['seatsAvailable']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Flight.fromJson(String source) => Flight.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Flight(flightNumber: $flightNumber, airline: $airline, origin: $origin, destination: $destination, departureDate: $departureDate, arrivalDate: $arrivalDate, duration: $duration, price: $price, seatsAvailable: $seatsAvailable)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Flight &&
        other.flightNumber == flightNumber &&
        other.airline == airline &&
        other.origin == origin &&
        other.destination == destination &&
        other.departureDate == departureDate &&
        other.arrivalDate == arrivalDate &&
        other.duration == duration &&
        other.price == price &&
        other.seatsAvailable == seatsAvailable;
  }

  @override
  int get hashCode {
    return flightNumber.hashCode ^
        airline.hashCode ^
        origin.hashCode ^
        destination.hashCode ^
        departureDate.hashCode ^
        arrivalDate.hashCode ^
        duration.hashCode ^
        price.hashCode ^
        seatsAvailable.hashCode;
  }
}
