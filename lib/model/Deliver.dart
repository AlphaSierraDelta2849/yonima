import 'package:yonima/model/User.dart';

class Deliver{
  var description;
  var statut;
  var code;
  User delivered_from;
  User delivered_by;
  var nom_destinataire;
  var location_destinataire;
  Deliver(this.description, this.statut, this.delivered_from, this.delivered_by,this.nom_destinataire, this.location_destinataire);
}