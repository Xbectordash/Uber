class GetSuggestion {
  String? _message;
  List<Suggestions>? _suggestions;

  GetSuggestion({String? message, List<Suggestions>? suggestions}) {
    if (message != null) {
      this._message = message;
    }
    if (suggestions != null) {
      this._suggestions = suggestions;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  List<Suggestions>? get suggestions => _suggestions;
  set suggestions(List<Suggestions>? suggestions) => _suggestions = suggestions;

  GetSuggestion.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    if (json['suggestions'] != null) {
      _suggestions = <Suggestions>[];
      json['suggestions'].forEach((v) {
        _suggestions!.add(new Suggestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this._message;
    if (this._suggestions != null) {
      data['suggestions'] = this._suggestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suggestions {
  String? _description;
  String? _placeId;

  Suggestions({String? description, String? placeId}) {
    if (description != null) {
      this._description = description;
    }
    if (placeId != null) {
      this._placeId = placeId;
    }
  }

  String? get description => _description;
  set description(String? description) => _description = description;
  String? get placeId => _placeId;
  set placeId(String? placeId) => _placeId = placeId;

  Suggestions.fromJson(Map<String, dynamic> json) {
    _description = json['description'];
    _placeId = json['place_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this._description;
    data['place_id'] = this._placeId;
    return data;
  }
}
