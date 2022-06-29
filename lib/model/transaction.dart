class Transaction{
  String typeTransaction='';
  String livreur='';
  String description='';
  String destination='';
  String statut='';
  Transaction(String t,String l, String desc,String dest, String s){
    this.typeTransaction=t;
    this.livreur=l;
    this.description=desc;
    this.destination=dest;
    this.statut=s;
  }
}