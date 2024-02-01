import 'package:flutter/material.dart';

import 'login_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   TextEditingController _nameController = TextEditingController();
    TextEditingController _passWordController = TextEditingController();
   TextEditingController _confirmPassowrdController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
  
    TextEditingController _surnameController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
backgroundColor: Colors.white,
body: SafeArea(
  child:   SingleChildScrollView(
    child: Column(children: [
    const SizedBox(height: 60,),
    const Center(child: Text('Create Account',
    style: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Colors.black
    ),)),
    const SizedBox(height: 20,),
    
  
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 70),
      child: Align(alignment: Alignment.topLeft,
        child: Text('Name',
        style: TextStyle(color: Colors.black,
        
          
        
          fontSize:16,fontWeight: FontWeight.w400 ),),
      ),
    ),
    
    const SizedBox(height: 5,),
  
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
                controller: _nameController,
                
                decoration: const InputDecoration(
            
                // labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
    
    
    ),
    ),
    const SizedBox(height: 10,),
    
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 70),
      child: Align(alignment: Alignment.topLeft,
        child: Text('Surname',
        style: TextStyle(color: Colors.black,
        
          
        
          fontSize:16,fontWeight: FontWeight.w400 ),),
      ),
    ),
    
    const SizedBox(height: 5,),
  
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
                controller: _surnameController,
                
                decoration: const InputDecoration(
            
                // labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
    
    
    ),
    ),
    const SizedBox(height: 10,),
    
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 70),
      child: Align(alignment: Alignment.topLeft,
        child: Text('Email',
        style: TextStyle(color: Colors.black,
        
          
        
          fontSize:16,fontWeight: FontWeight.w400 ),),
      ),
    ),
    
    const SizedBox(height: 5,),
  
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
                controller: _emailController,
                
                decoration: const InputDecoration(
            
                // labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
    
    
    ),
    ),
    const SizedBox(height: 10,),
    
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 70),
      child: Align(alignment: Alignment.topLeft,
        child: Text('Password',
        style: TextStyle(color: Colors.black,
        
          
        
          fontSize:16,fontWeight: FontWeight.w400 ),),
      ),
    ),
    
    const SizedBox(height: 5,),
  
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
                controller: _passWordController,
                obscureText: true,
                
                decoration: const InputDecoration(
            
                // labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
    
    
    ),
    ),
    const SizedBox(height: 10,),
    
    const Padding(
      padding: EdgeInsets.symmetric(horizontal: 70),
      child: Align(alignment: Alignment.topLeft,
        child: Text('Confirm Password',
        style: TextStyle(color: Colors.black,
        
          
        
          fontSize:16,fontWeight: FontWeight.w400 ),),
      ),
    ),
    
    const SizedBox(height: 5,),
  
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
                controller: _confirmPassowrdController,
                obscureText: true,
                
                decoration: const InputDecoration(
            
                // labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
    
    
    ),
    ),
    
  
    const SizedBox(height: 40,),
    GestureDetector(
       onTap: (){
          Navigator.push( context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const Login_screen  (),
      ),);
       },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70),
        child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: ShapeDecoration(
          color: const Color(0xFF985ACE),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        ),
        
        child: const Center(
          child: Text('Register',
           style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'HelveticaNeue',
              fontWeight: FontWeight.w700,
              height: 0,
            ),),
        ),
        ),
      ),
    ),
    const SizedBox(height: 30,),
    
  const Padding(
    padding: EdgeInsets.symmetric(horizontal: 70),
    child:   Divider(
    
      color: Colors.black,
    
      thickness: 2,
    
    ),
  ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70 ),
        child: Container(
        width: MediaQuery.of(context).size.width,
        height: 38,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFF985ACE)),
        borderRadius: BorderRadius.circular(7),
          ),
        ),
        child: Row(

          children: [

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 40),
  child:   Image.asset('assets/google.png'),
),
const Align(alignment: Alignment.centerLeft,
  child:   Text(' Contiue with Google',
  
  style: TextStyle(
  
              color: Colors.black,
  
              fontSize: 12,
  
              fontFamily: 'HelveticaNeue',
  
              fontWeight: FontWeight.w400,
  
            
  
            ),
  
  
  
  ),
)


          ],
        ),
      ),
      )
    
    ],),
  ),
),

    );
  }
}