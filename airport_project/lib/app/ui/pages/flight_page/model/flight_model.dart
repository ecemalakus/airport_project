import 'dart:convert';

AirportModel airportModelFromJson(String str) =>
    AirportModel.fromJson(json.decode(str));

String airportModelToJson(AirportModel data) => json.encode(data.toJson());

class AirportModel {
  String? ident;
  String? type;
  String? name;
  double? latitudeDeg;
  double? longitudeDeg;
  String? elevationFt;
  String? continent;
  String? isoCountry;
  String? isoRegion;
  String? municipality;
  String? scheduledService;
  String? gpsCode;
  String? iataCode;
  String? localCode;
  String? homeLink;
  String? wikipediaLink;
  String? keywords;
  String? icaoCode;
  List<Runway>? runways;
  List<Frequency>? freqs;

  AirportModel({
    this.ident,
    this.type,
    this.name,
    this.latitudeDeg,
    this.longitudeDeg,
    this.elevationFt,
    this.continent,
    this.isoCountry,
    this.isoRegion,
    this.municipality,
    this.scheduledService,
    this.gpsCode,
    this.iataCode,
    this.localCode,
    this.homeLink,
    this.wikipediaLink,
    this.keywords,
    this.icaoCode,
    this.runways,
    this.freqs,
  });

  factory AirportModel.fromJson(Map<String, dynamic> json) => AirportModel(
        ident: json["ident"],
        type: json["type"],
        name: json["name"],
        latitudeDeg: _toDouble(json["latitude_deg"]),
        longitudeDeg: _toDouble(json["longitude_deg"]),
        elevationFt: json["elevation_ft"],
        continent: json["continent"],
        isoCountry: json["iso_country"],
        isoRegion: json["iso_region"],
        municipality: json["municipality"],
        scheduledService: json["scheduled_service"],
        gpsCode: json["gps_code"],
        iataCode: json["iata_code"],
        localCode: json["local_code"],
        homeLink: json["home_link"],
        wikipediaLink: json["wikipedia_link"],
        keywords: json["keywords"],
        icaoCode: json["icao_code"],
        runways: json["runways"] == null
            ? []
            : List<Runway>.from(
                json["runways"]!.map((x) => Runway.fromJson(x))),
        freqs: json["freqs"] == null
            ? []
            : List<Frequency>.from(
                json["freqs"]!.map((x) => Frequency.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ident": ident,
        "type": type,
        "name": name,
        "latitude_deg": latitudeDeg,
        "longitude_deg": longitudeDeg,
        "elevation_ft": elevationFt,
        "continent": continent,
        "iso_country": isoCountry,
        "iso_region": isoRegion,
        "municipality": municipality,
        "scheduled_service": scheduledService,
        "gps_code": gpsCode,
        "iata_code": iataCode,
        "local_code": localCode,
        "home_link": homeLink,
        "wikipedia_link": wikipediaLink,
        "keywords": keywords,
        "icao_code": icaoCode,
        "runways": runways == null
            ? []
            : List<dynamic>.from(runways!.map((x) => x.toJson())),
        "freqs": freqs == null
            ? []
            : List<dynamic>.from(freqs!.map((x) => x.toJson())),
      };

  static double? _toDouble(dynamic value) {
    if (value is String) {
      return double.tryParse(value);
    } else if (value is num) {
      return value.toDouble();
    } else {
      return null;
    }
  }
}

class Runway {
  String? id;
  String? airportRef;
  String? airportIdent;
  String? lengthFt;
  String? widthFt;
  String? surface;
  String? lighted;
  String? closed;
  String? leIdent;
  double? leLatitudeDeg;
  double? leLongitudeDeg;
  String? leElevationFt;
  String? leHeadingDegT;
  String? leDisplacedThresholdFt;
  String? heIdent;
  double? heLatitudeDeg;
  double? heLongitudeDeg;
  String? heElevationFt;
  String? heHeadingDegT;
  String? heDisplacedThresholdFt;
  Ils? leIls;
  Ils? heIls;

  Runway({
    this.id,
    this.airportRef,
    this.airportIdent,
    this.lengthFt,
    this.widthFt,
    this.surface,
    this.lighted,
    this.closed,
    this.leIdent,
    this.leLatitudeDeg,
    this.leLongitudeDeg,
    this.leElevationFt,
    this.leHeadingDegT,
    this.leDisplacedThresholdFt,
    this.heIdent,
    this.heLatitudeDeg,
    this.heLongitudeDeg,
    this.heElevationFt,
    this.heHeadingDegT,
    this.heDisplacedThresholdFt,
    this.leIls,
    this.heIls,
  });

  factory Runway.fromJson(Map<String, dynamic> json) => Runway(
        id: json["id"],
        airportRef: json["airport_ref"],
        airportIdent: json["airport_ident"],
        lengthFt: json["length_ft"],
        widthFt: json["width_ft"],
        surface: json["surface"],
        lighted: json["lighted"],
        closed: json["closed"],
        leIdent: json["le_ident"],
        leLatitudeDeg: _toDouble(json["le_latitude_deg"]),
        leLongitudeDeg: _toDouble(json["le_longitude_deg"]),
        leElevationFt: json["le_elevation_ft"],
        leHeadingDegT: json["le_heading_degT"],
        leDisplacedThresholdFt: json["le_displaced_threshold_ft"],
        heIdent: json["he_ident"],
        heLatitudeDeg: _toDouble(json["he_latitude_deg"]),
        heLongitudeDeg: _toDouble(json["he_longitude_deg"]),
        heElevationFt: json["he_elevation_ft"],
        heHeadingDegT: json["he_heading_degT"],
        heDisplacedThresholdFt: json["he_displaced_threshold_ft"],
        leIls: json["le_ils"] == null ? null : Ils.fromJson(json["le_ils"]),
        heIls: json["he_ils"] == null ? null : Ils.fromJson(json["he_ils"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "airport_ref": airportRef,
        "airport_ident": airportIdent,
        "length_ft": lengthFt,
        "width_ft": widthFt,
        "surface": surface,
        "lighted": lighted,
        "closed": closed,
        "le_ident": leIdent,
        "le_latitude_deg": leLatitudeDeg,
        "le_longitude_deg": leLongitudeDeg,
        "le_elevation_ft": leElevationFt,
        "le_heading_degT": leHeadingDegT,
        "le_displaced_threshold_ft": leDisplacedThresholdFt,
        "he_ident": heIdent,
        "he_latitude_deg": heLatitudeDeg,
        "he_longitude_deg": heLongitudeDeg,
        "he_elevation_ft": heElevationFt,
        "he_heading_degT": heHeadingDegT,
        "he_displaced_threshold_ft": heDisplacedThresholdFt,
        "le_ils": leIls?.toJson(),
        "he_ils": heIls?.toJson(),
      };
}

class Ils {
  double? freq;
  int? course;

  Ils({
    this.freq,
    this.course,
  });

  factory Ils.fromJson(Map<String, dynamic> json) => Ils(
        freq: _toDouble(json["freq"]),
        course: json["course"],
      );

  Map<String, dynamic> toJson() => {
        "freq": freq,
        "course": course,
      };
}

class Frequency {
  String? id;
  String? airportRef;
  String? airportIdent;
  String? type;
  String? description;
  String? frequencyMhz;

  Frequency({
    this.id,
    this.airportRef,
    this.airportIdent,
    this.type,
    this.description,
    this.frequencyMhz,
  });

  factory Frequency.fromJson(Map<String, dynamic> json) => Frequency(
        id: json["id"],
        airportRef: json["airport_ref"],
        airportIdent: json["airport_ident"],
        type: json["type"],
        description: json["description"],
        frequencyMhz: json["frequency_mhz"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "airport_ref": airportRef,
        "airport_ident": airportIdent,
        "type": type,
        "description": description,
        "frequency_mhz": frequencyMhz,
      };
}

double? _toDouble(dynamic value) {
  if (value is String) {
    return double.tryParse(value);
  } else if (value is num) {
    return value.toDouble();
  } else {
    return null;
  }
}
