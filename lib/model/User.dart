class User{
  final nom;
  final numero;
  bool isDeliverer;
  final mail;
  final totalDelivers;
  var location;
  User({this.nom,this.numero,this.isDeliverer=false,this.location,this.totalDelivers=0,this.mail});
}