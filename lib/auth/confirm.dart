import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:server_access/auth/newpassword_screen.dart';
class Confirm extends StatefulWidget {
  const Confirm({super.key});

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Center(
          child: Text('Verification',
          style: TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      backgroundColor: Colors.white,

      body: Column(children: [
const SizedBox(height: 160,),
            const Center(
              child: Text('Enter Verification Code',
              style: TextStyle(fontSize: 15,
              
              fontWeight: FontWeight.bold
              
              ),),
            ),
            const SizedBox(height: 30,),
PinCodeFields(
    length: 4,
    fieldBorderStyle:  FieldBorderStyle.square,
    responsive: false,
    fieldHeight: 60.0,
    fieldWidth: 60.0,
    borderWidth: 5.0,
    activeBorderColor: Colors.white,
    activeBackgroundColor: Colors.white,
    //borderRadius: BorderRadius.circular(20.0),
    keyboardType: TextInputType.number,
    autoHideKeyboard: false,
    fieldBackgroundColor: Colors.white,
    borderColor: const Color(0xFF985ACE),
    textStyle: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
    ),
    onComplete: (output) {
        // Your logic with pin code
        print(output);
    },
),
    const SizedBox(height: 20,),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: GestureDetector(

        onTap: (){

          Navigator.push(  context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const NewPassword (),
    ),);
        },
        child: Container(
        width: MediaQuery.of(context).size.width,
        height: 38,
        decoration: ShapeDecoration(
        color: const Color(0xFF985ACE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
          child: const Center(
        child:   Text('send',
        
        
        
        style: TextStyle(
        
            color: Colors.white,
        
            fontSize: 12,
        
            fontFamily: 'HelveticaNeue',
        
            fontWeight: FontWeight.w700,
        
            
        
          ),
        
        ),
          ),
          
          ),
      ),
    ),

      ],),
    );
  }
}