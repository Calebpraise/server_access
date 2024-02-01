import 'package:flutter/material.dart';

import 'login_screen.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
   TextEditingController _newpController = TextEditingController();
    TextEditingController _newpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Center(
          child: Text('New Password',
          style: TextStyle(color: Colors.black),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
      
      const SizedBox(height: 90,),


      
const Padding(
  padding: EdgeInsets.symmetric(horizontal: 72),
  child:   Align(alignment: Alignment.topLeft,
  
    child:   Text('New password',
  
    
  
    style: TextStyle(color: Colors.black,
  
    
  
    fontSize:16,fontWeight: FontWeight.w400 ),),
  
  ),
),
const SizedBox(height: 5,),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: ShapeDecoration(
          color: const Color(0xFFF7F1FF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        child: Column(children: [

  TextField(
            controller: _newpController,
            
            decoration: const InputDecoration(
        //      suffixIcon: Image.asset("assets/Group 1.png") ,
             // labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),


        ],),
      ),
      ),
      const SizedBox(height: 10,),
      
const Padding(
  padding: EdgeInsets.symmetric(horizontal: 72),
  child:   Align(alignment: Alignment.topLeft,
  
    child:   Text('Password',
  
    
  
    style: TextStyle(color: Colors.black,
  
    
  
    fontSize:16,fontWeight: FontWeight.w400 ),),
  
  ),
),
const SizedBox(height: 5,),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: ShapeDecoration(
          color: const Color(0xFFF7F1FF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        child: Column(children: [

  TextField(
            controller: _newpassController,
            obscureText: true,
            decoration:  const InputDecoration(
            
             // labelText: 'Email',

            
              border: OutlineInputBorder(),
            ),
          ),




        ],),
      ),
      ),
      const SizedBox(height: 20,),
        const SizedBox(height: 20,),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: GestureDetector(

        onTap: (){

          Navigator.push(  context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const Login_screen(),
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
      ),
    );
  }
}