class LocationData {
  Data all;
  List<Data> area = [];

  void fromMap(dynamic data) {
    var keys = data.keys.toList();
    for (String k in keys) {
      if (k == "All") {
        all = Data(data["All"], null);
      } else {
        area.add(Data(data[k], k));
      }
    }
  }
}

class Data {
  String areaName;
  int confirmed;
  int recovered;
  int deaths;

  Data(dynamic data, String area) {
    areaName = area;
    confirmed = data["confirmed"];
    recovered = data["recovered"];
    deaths = data["deaths"];
  }
}
