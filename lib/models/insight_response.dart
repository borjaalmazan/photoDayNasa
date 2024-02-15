import 'dart:convert';

class InsightResponse {
    List<dynamic> solKeys;
    ValidityChecks validityChecks;

    InsightResponse({
        required this.solKeys,
        required this.validityChecks,
    });

    factory InsightResponse.fromRawJson(String str) => InsightResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory InsightResponse.fromJson(Map<String, dynamic> json) => InsightResponse(
        solKeys: List<dynamic>.from(json["sol_keys"].map((x) => x)),
        validityChecks: ValidityChecks.fromJson(json["validity_checks"]),
    );

    Map<String, dynamic> toJson() => {
        "sol_keys": List<dynamic>.from(solKeys.map((x) => x)),
        "validity_checks": validityChecks.toJson(),
    };
}

class ValidityChecks {
    The1219 the1219;
    int solHoursRequired;
    List<String> solsChecked;

    ValidityChecks({
        required this.the1219,
        required this.solHoursRequired,
        required this.solsChecked,
    });

    factory ValidityChecks.fromRawJson(String str) => ValidityChecks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ValidityChecks.fromJson(Map<String, dynamic> json) => ValidityChecks(
        the1219: The1219.fromJson(json["1219"]),
        solHoursRequired: json["sol_hours_required"],
        solsChecked: List<String>.from(json["sols_checked"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "1219": the1219.toJson(),
        "sol_hours_required": solHoursRequired,
        "sols_checked": List<dynamic>.from(solsChecked.map((x) => x)),
    };
}

class The1219 {
    At at;
    At hws;
    At pre;
    At wd;

    The1219({
        required this.at,
        required this.hws,
        required this.pre,
        required this.wd,
    });

    factory The1219.fromRawJson(String str) => The1219.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory The1219.fromJson(Map<String, dynamic> json) => The1219(
        at: At.fromJson(json["AT"]),
        hws: At.fromJson(json["HWS"]),
        pre: At.fromJson(json["PRE"]),
        wd: At.fromJson(json["WD"]),
    );

    Map<String, dynamic> toJson() => {
        "AT": at.toJson(),
        "HWS": hws.toJson(),
        "PRE": pre.toJson(),
        "WD": wd.toJson(),
    };
}

class At {
    List<int> solHoursWithData;
    bool valid;

    At({
        required this.solHoursWithData,
        required this.valid,
    });

    factory At.fromRawJson(String str) => At.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory At.fromJson(Map<String, dynamic> json) => At(
        solHoursWithData: List<int>.from(json["sol_hours_with_data"].map((x) => x)),
        valid: json["valid"],
    );

    Map<String, dynamic> toJson() => {
        "sol_hours_with_data": List<dynamic>.from(solHoursWithData.map((x) => x)),
        "valid": valid,
    };
}
