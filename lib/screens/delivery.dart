import 'package:flutter/material.dart';
import 'package:yonima/main.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  int currentStep=0;
  bool isCompleted=false;
  final firstName= TextEditingController();
  final lastName=TextEditingController();
  final address = TextEditingController();
  final postCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(primary: Colors.blue)
            ),
        child :Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: (){
            final isLastStep=currentStep==getSteps().length-1;
            if(isLastStep) {
              print('Completed');
              //send data to server
              confirmDelivery();
            }
              else {
              setState(() => currentStep += 1);
            }
          },
          onStepCancel: currentStep == 0 ? null: ()=>setState(()=>currentStep-=1),
          onStepTapped: (step)=>setState(()=>currentStep=step),
          controlsBuilder: (BuildContext context, details){
            final isLastStep=currentStep==getSteps().length-1;
            return Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text(isLastStep? 'Confirm':'Suivant'),
                      onPressed: details.onStepContinue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  if(currentStep!=0)
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Retour'),
                      onPressed: details.onStepCancel,
                    ),
                  )
                ],
              ),
            );
          },
        ),
    ),
    );
  }
  void confirmDelivery(){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ),
    );
      }
  List<Step> getSteps()=>[
    Step(
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive:currentStep >= 0,
        title: Text('Account'),
        content: Column(
          children: [
            TextFormField(
              controller: firstName ,
              decoration: InputDecoration(
                icon: Icon(Icons.contact_mail),
                labelText: 'Prénom',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                )
              ),
            ),
            TextFormField(
              controller: lastName ,
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: 'Nom',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  )
              ),
            )
          ],
        ),
    ),
    Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive:currentStep >= 1,
        title: Text('Adresse'),
        content: Column(
          children: [
            TextFormField(
              controller: address ,
              decoration: InputDecoration(
                  icon: Icon(Icons.map,color: Colors.grey,),
                  labelText: 'Adresse',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  )
              ),
            )
          ],
        )
    ),
    Step(
        isActive:currentStep >= 2,
        title: Text('Confirm'),
        content: Column(
          children: [
            TextFormField(
              controller: postCode ,
              decoration: InputDecoration(
                  icon: Icon(Icons.local_post_office_outlined, color: Colors.blue,),
                  labelText: 'Code Postale',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  )
              ),
            )
          ],
        )
    ),
  ];
}

