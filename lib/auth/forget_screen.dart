import 'package:flutter/material.dart';
import 'package:server_access/auth/confirm.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _forgetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Center(
          child: Text('Forget Password',
          style: TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
const SizedBox(height: 160,),
            const Center(
              child: Text('Enter Email Address',
              style: TextStyle(fontSize: 15,
              
              fontWeight: FontWeight.bold
              
              ),),
            ),
            const SizedBox(height: 30,),

 Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: ShapeDecoration(
        color: const Color(0xFFF7F1FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),
    child:  TextField(
                controller: _forgetController,
                obscureText: true,
                
                decoration: const InputDecoration(
            
                // labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
    
    
    ),
    ),
    SizedBox(height: 20,),
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: GestureDetector(


      onTap: (){
        Navigator.push(
            context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const Confirm(),
    ),
  
        );
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


          ],
      
      
        ),
      ),
    );
  }
}