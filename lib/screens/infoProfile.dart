import 'package:flutter/material.dart';
import 'package:yonima/main.dart';
import 'package:yonima/model/User.dart';

class FormProfile extends StatefulWidget {
  const FormProfile({Key? key}) : super(key: key);

  @override
  State<FormProfile> createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile> {
  int currentStep=0;
  bool isCompleted=false;
  final firstName= TextEditingController();
  final lastName= TextEditingController();
  final mail=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Theme(
        data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: Colors.blue)
        ),
        child :Stepper(
          type: StepperType.vertical,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: (){
            final isLastStep=currentStep==getSteps().length-1;
            if(isLastStep) {
              print('Completed');
              //send data to server
              final nomComplet=firstName.text+' '+lastName.text;
              final user= User(nom: nomComplet,isDeliverer: false,mail: mail);
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
      title: Text('Compte'),
      content: Column(
        children: [
          Divider(
            height: 100,
          ),
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
          Divider(
            height: 100,
          ),
          TextFormField(
            controller: lastName,
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
        title: Text('Mail'),
        content: Column(
          children: [
            TextFormField(
              controller: mail ,
              decoration: InputDecoration(
                  icon: Icon(Icons.mail,color: Colors.grey,),
                  labelText: 'Votre mail',
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
            Row(
              children: [
                Text('Nom Complet : ',style: TextStyle(fontWeight: FontWeight.bold),),
                Text(firstName.text+ ' '+lastName.text,style: TextStyle(),),
              ],

            ),
            Row(
              children: [
                Text('Mail : ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Text(mail.text,style: TextStyle(),),
              ],

            ),
          ],
        )
    ),
  ];
}
