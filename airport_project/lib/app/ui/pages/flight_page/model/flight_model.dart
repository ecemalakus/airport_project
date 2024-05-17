// To parse this JSON data, do
//
//     final airportModel = airportModelFromJson(jsonString);

import 'dart:convert';

AirportModel airportModelFromJson(String str) => AirportModel.fromJson(json.decode(str));

String airportModelToJson(AirportModel data) => json.encode(data.toJson());

class AirportModel {
    List<Datum>? data;
    Dictionaries? dictionaries;
    Meta? meta;

    AirportModel({
        this.data,
        this.dictionaries,
        this.meta,
    });

    factory AirportModel.fromJson(Map<String, dynamic> json) => AirportModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        dictionaries: json["dictionaries"] == null ? null : Dictionaries.fromJson(json["dictionaries"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "dictionaries": dictionaries?.toJson(),
        "meta": meta?.toJson(),
    };
}

class Datum {
    String? type;
    String? origin;
    String? destination;
    DateTime? departureDate;
    DateTime? returnDate;
    Price? price;
    DatumLinks? links;

    Datum({
        this.type,
        this.origin,
        this.destination,
        this.departureDate,
        this.returnDate,
        this.price,
        this.links,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json["type"],
        origin: json["origin"],
        destination: json["destination"],
        departureDate: json["departureDate"] == null ? null : DateTime.parse(json["departureDate"]),
        returnDate: json["returnDate"] == null ? null : DateTime.parse(json["returnDate"]),
        price: json["price"] == null ? null : Price.fromJson(json["price"]),
        links: json["links"] == null ? null : DatumLinks.fromJson(json["links"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "origin": origin,
        "destination": destination,
        "departureDate": "${departureDate!.year.toString().padLeft(4, '0')}-${departureDate!.month.toString().padLeft(2, '0')}-${departureDate!.day.toString().padLeft(2, '0')}",
        "returnDate": "${returnDate!.year.toString().padLeft(4, '0')}-${returnDate!.month.toString().padLeft(2, '0')}-${returnDate!.day.toString().padLeft(2, '0')}",
        "price": price?.toJson(),
        "links": links?.toJson(),
    };
}

class DatumLinks {
    String? flightDates;
    String? flightOffers;

    DatumLinks({
        this.flightDates,
        this.flightOffers,
    });

    factory DatumLinks.fromJson(Map<String, dynamic> json) => DatumLinks(
        flightDates: json["flightDates"],
        flightOffers: json["flightOffers"],
    );

    Map<String, dynamic> toJson() => {
        "flightDates": flightDates,
        "flightOffers": flightOffers,
    };
}

class Price {
    String? total;

    Price({
        this.total,
    });

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
    };
}

class Dictionaries {
    Currencies? currencies;
    Locations? locations;

    Dictionaries({
        this.currencies,
        this.locations,
    });

    factory Dictionaries.fromJson(Map<String, dynamic> json) => Dictionaries(
        currencies: json["currencies"] == null ? null : Currencies.fromJson(json["currencies"]),
        locations: json["locations"] == null ? null : Locations.fromJson(json["locations"]),
    );

    Map<String, dynamic> toJson() => {
        "currencies": currencies?.toJson(),
        "locations": locations?.toJson(),
    };
}

class Currencies {
    String? eur;

    Currencies({
        this.eur,
    });

    factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        eur: json["EUR"],
    );

    Map<String, dynamic> toJson() => {
        "EUR": eur,
    };
}

class Locations {
    Ath? ewr;
    Ath? mia;
    Ath? cdg;
    Ath? saw;
    Ath? tun;
    Ath? bcn;
    Ath? dxb;
    Ath? opo;
    Ath? lin;
    Ath? mad;
    Ath? yul;
    Ath? fco;
    Ath? ath;
    Ath? ory;
    Ath? lis;
    Ath? rak;
    Ath? sfo;

    Locations({
        this.ewr,
        this.mia,
        this.cdg,
        this.saw,
        this.tun,
        this.bcn,
        this.dxb,
        this.opo,
        this.lin,
        this.mad,
        this.yul,
        this.fco,
        this.ath,
        this.ory,
        this.lis,
        this.rak,
        this.sfo,
    });

    factory Locations.fromJson(Map<String, dynamic> json) => Locations(
        ewr: json["EWR"] == null ? null : Ath.fromJson(json["EWR"]),
        mia: json["MIA"] == null ? null : Ath.fromJson(json["MIA"]),
        cdg: json["CDG"] == null ? null : Ath.fromJson(json["CDG"]),
        saw: json["SAW"] == null ? null : Ath.fromJson(json["SAW"]),
        tun: json["TUN"] == null ? null : Ath.fromJson(json["TUN"]),
        bcn: json["BCN"] == null ? null : Ath.fromJson(json["BCN"]),
        dxb: json["DXB"] == null ? null : Ath.fromJson(json["DXB"]),
        opo: json["OPO"] == null ? null : Ath.fromJson(json["OPO"]),
        lin: json["LIN"] == null ? null : Ath.fromJson(json["LIN"]),
        mad: json["MAD"] == null ? null : Ath.fromJson(json["MAD"]),
        yul: json["YUL"] == null ? null : Ath.fromJson(json["YUL"]),
        fco: json["FCO"] == null ? null : Ath.fromJson(json["FCO"]),
        ath: json["ATH"] == null ? null : Ath.fromJson(json["ATH"]),
        ory: json["ORY"] == null ? null : Ath.fromJson(json["ORY"]),
        lis: json["LIS"] == null ? null : Ath.fromJson(json["LIS"]),
        rak: json["RAK"] == null ? null : Ath.fromJson(json["RAK"]),
        sfo: json["SFO"] == null ? null : Ath.fromJson(json["SFO"]),
    );

    Map<String, dynamic> toJson() => {
        "EWR": ewr?.toJson(),
        "MIA": mia?.toJson(),
        "CDG": cdg?.toJson(),
        "SAW": saw?.toJson(),
        "TUN": tun?.toJson(),
        "BCN": bcn?.toJson(),
        "DXB": dxb?.toJson(),
        "OPO": opo?.toJson(),
        "LIN": lin?.toJson(),
        "MAD": mad?.toJson(),
        "YUL": yul?.toJson(),
        "FCO": fco?.toJson(),
        "ATH": ath?.toJson(),
        "ORY": ory?.toJson(),
        "LIS": lis?.toJson(),
        "RAK": rak?.toJson(),
        "SFO": sfo?.toJson(),
    };
}

class Ath {
    String? subType;
    String? detailedName;

    Ath({
        this.subType,
        this.detailedName,
    });

    factory Ath.fromJson(Map<String, dynamic> json) => Ath(
        subType: json["subType"],
        detailedName: json["detailedName"],
    );

    Map<String, dynamic> toJson() => {
        "subType": subType,
        "detailedName": detailedName,
    };
}

class Meta {
    String? currency;
    MetaLinks? links;
    Defaults? defaults;

    Meta({
        this.currency,
        this.links,
        this.defaults,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currency: json["currency"],
        links: json["links"] == null ? null : MetaLinks.fromJson(json["links"]),
        defaults: json["defaults"] == null ? null : Defaults.fromJson(json["defaults"]),
    );

    Map<String, dynamic> toJson() => {
        "currency": currency,
        "links": links?.toJson(),
        "defaults": defaults?.toJson(),
    };
}

class Defaults {
    String? departureDate;
    bool? oneWay;
    String? duration;
    bool? nonStop;
    String? viewBy;

    Defaults({
        this.departureDate,
        this.oneWay,
        this.duration,
        this.nonStop,
        this.viewBy,
    });

    factory Defaults.fromJson(Map<String, dynamic> json) => Defaults(
        departureDate: json["departureDate"],
        oneWay: json["oneWay"],
        duration: json["duration"],
        nonStop: json["nonStop"],
        viewBy: json["viewBy"],
    );

    Map<String, dynamic> toJson() => {
        "departureDate": departureDate,
        "oneWay": oneWay,
        "duration": duration,
        "nonStop": nonStop,
        "viewBy": viewBy,
    };
}

class MetaLinks {
    String? self;

    MetaLinks({
        this.self,
    });

    factory MetaLinks.fromJson(Map<String, dynamic> json) => MetaLinks(
        self: json["self"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
    };
}
