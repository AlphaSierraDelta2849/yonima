import 'package:yonima/model/User.dart';

class Deliver{
  final description;
  final statut;
  User delivered_from;
  User delivered_by;
  final nom_destinataire;
  final location_destinataire;
  Deliver(this.description, this.statut, this.delivered_from, this.delivered_by,
      this.nom_destinataire, this.location_destinataire);
}