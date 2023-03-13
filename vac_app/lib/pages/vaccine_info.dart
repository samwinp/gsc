import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:vac_app/pages/Bcg.dart';
import 'package:vac_app/widgets/widgets.dart';


class VaccineInfo extends StatefulWidget {
  const VaccineInfo({super.key});

  @override
  State<VaccineInfo> createState() => _VaccineInfoState();
}

class _VaccineInfoState extends State<VaccineInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 210,                                       
                  decoration:  BoxDecoration(
                    border: Border.all(width: 8),
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),                  
                  ),   

                  

                  child: Column(
                    children:  [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset("assets/med.gif"),   

                        ),    
                      const SizedBox(height: 10,),                        
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text("Bcg",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        
                          ),                        
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text("This is a vaccine and it's info is",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        ),
                      ),
                      
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: TextButton(onPressed: (){
                              nextScreenReplace(context, const Bgc());
                            },
                             child: const Text("Read more"),
                            ),
                          ),
                         
                          ],
                        ),
                      )

                    ],                
                    ),                    
                  ), 
                ); 

    
  }
}