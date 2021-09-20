class Tea {
  final String name;
  final int reference;
  final int totalQuantity;
  final String description;
  final double buyingPrice;
  final String lane;
  final String column;
  final String height;
  final String box;
  final String qrCode;
  final String flavor;

  Tea({
    required this.name,
    required this.reference,
    required this.totalQuantity,
    required this.description,
    required this.buyingPrice,
    required this.lane,
    required this.column,
    required this.height,
    required this.box,
    required this.qrCode,
    required this.flavor,
  });

  factory Tea.fromJson(Map<String, dynamic> json) {
    return Tea(
        name: json['name'],
        reference: json['reference'] == null
            ? 0
            : json['reference'] == ""
                ? 0
                : json['reference'],
        totalQuantity: json['totalQuantity'] == null
            ? 0
            : json['totalQuantity'] == ""
                ? 0
                : json['totalQuantity'],
        description:
            json['description'] == null ? "" : json['description'].toString(),
        buyingPrice:
            json['buyingPrice'] == null ? 0.0 : json['buyingPrice'].toDouble(),
        lane: json['lane'] == null ? "" : json['lane'].toString(),
        column: json['column'] == null ? "" : json['column'].toString(),
        height: json['height'] == null ? "" : json['height'].toString(),
        box: json['box'] == null ? "" : json['box'].toString(),
        qrCode: json['qrCode'] == null ? "" : json['qrCode'].toString(),
        flavor: json['flavor'] == null ? "" : json['flavor'].toString());
  }
}
