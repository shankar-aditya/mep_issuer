class CardNoInfo {
  final String cardnumber;
  final String name;
  final String expirydate;
  final String address;
  final String city;
  final String state;
  final String postal;
  final String cardtype;
  final String cardbrand;

  CardNoInfo({
    this.cardnumber,
    this.name,
    this.expirydate,
    this.address,
    this.city,
    this.state,
    this.postal,
    this.cardtype,
    this.cardbrand,
  });
}

class CardIdInfo {
  final String cardId;
  final String source;
  final String provider;

  CardIdInfo({
    this.cardId,
    this.source,
    this.provider,
  });
}
