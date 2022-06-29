import 'package:flutter/material.dart';
import 'package:yonima/model/transaction.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final t1=Transaction('Envoyé', 'Sidi Ba', 'un sac', 'Plateau', 'en cours');
  final t2=Transaction('Envoyé', 'Malik Fall', 'ballon', 'Médina', 'effectué');
  final t3=Transaction('Reçu', 'Sidi Ba', 'un sac', 'Plateau', 'en cours');
  final t4=Transaction('Livraison', 'Maodo Diop', 'Serviette', 'Pikine', 'effectué');
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    final double topContainerHeight=height/2.5;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height:topContainerHeight,
              decoration:BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Top_backgroundImage.png'),
                  fit: BoxFit.cover,
                ),
                //color: Colors.blue,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: height/12,
                    left:width/2.5,
                    child: Column(
                      //height: 30,
                      children:[
                       CircleAvatar(
                      radius:40,
                      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
                      child: Icon(Icons.person,color: Colors.white,size:50),
                    ),
                        Text('Zack,Sy',style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic),)
                      ]
                    ),
              ),
                  Positioned(
                    width: width,
                    height: topContainerHeight/2.5,
                    bottom: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 189, 89, 1),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                          )
                        ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('40 points',style: TextStyle(color: Colors.white),textAlign: TextAlign.justify,),
                          Text('4 colis envoyés',style: TextStyle(color: Colors.white),),
                          Text('0 colis reçus',style: TextStyle(color: Colors.white),),
                          Divider(),
                          Divider(),
                          Row(
                            children: const [
                              Icon(Icons.settings,color: Colors.white),
                              VerticalDivider(
                                width: 300
                              ),
                              Icon(Icons.doorbell_outlined,color: Colors.white),

                            ],
                          )

                        ],
                      )
                      ))
          ],
              ),
            ),
            Divider(
              height:100,
              color: Colors.blue,
            ),
            Text('Récentes Opérations',style: TextStyle(fontWeight: FontWeight.bold),),
            Expanded(child: MediaQuery.removePadding(context: context,removeTop: true,
            child: ListView(
              children: [
              Container(
                height: 100,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromRGBO(240, 240, 240, 1)
                ),
                padding: const EdgeInsets.only(
                  left: 32,
                  //top: 50,
                  //bottom: 50
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(t1.typeTransaction,style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(t1.description),
                    Row(
                        children:[
                          Icon(Icons.location_on),
                          Text(t1.destination),
                        ]

                    ),
                    Text(t1.statut,style: TextStyle(color: Colors.blue),)
                  ],
                ),
              ),
                Divider(
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(240, 240, 240, 1)
                  ),
                  padding: const EdgeInsets.only(
                    left: 32,
                    //top: 50,
                    //bottom: 50
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(t1.typeTransaction,style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(t1.description),
                      Row(
                          children:[
                            Icon(Icons.location_on),
                            Text(t1.destination),
                          ]

                      ),
                      Text(t1.statut,style: TextStyle(color: Colors.blue),)
                    ],
                  ),
                ),
                Divider(
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(240, 240, 240, 1)
                  ),
                  padding: const EdgeInsets.only(
                    left: 32,
                    //top: 50,
                    //bottom: 50
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(t1.typeTransaction,style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(t1.description),
                      Row(
                          children:[
                            Icon(Icons.location_on),
                            Text(t1.destination),
                          ]

                      ),
                      Text(t1.statut,style: TextStyle(color: Colors.blue),)
                    ],
                  ),
                ),
                Divider(
                  height: 20,
                ),
                Container(
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromRGBO(240, 240, 240, 1)
                  ),
                  padding: const EdgeInsets.only(
                    left: 32,
                    //top: 50,
                    //bottom: 50
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(t1.typeTransaction,style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(t1.description),
                      Row(
                          children:[
                            Icon(Icons.location_on),
                            Text(t1.destination),
                          ]

                      ),
                      Text(t1.statut,style: TextStyle(color: Colors.blue),)
                    ],
                  ),
                ),
              ]
            ),

    )
            ),
          ],
        ),
    );
  }
}
