import 'package:flutter/material.dart';
import 'package:vac_app/pages/Bcg.dart';
import 'package:vac_app/pages/chicken_pox.dart';
import 'package:vac_app/pages/typhoid.dart';
import 'package:vac_app/widgets/widgets.dart';


class VaccineInfo extends StatefulWidget {
  late String vacInfo;
  late String vacName;
  late dynamic page;
   VaccineInfo({super.key,required String vacInfo,required String vacName,required dynamic page}){
   this.vacInfo = vacInfo;
   this.vacName = vacName;
   this.page = page;
  }

  @override
  State<VaccineInfo> createState() => _VaccineInfoState();
}

class _VaccineInfoState extends State<VaccineInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 180,
                  height: 230,                                       
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(widget.vacName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        
                          ),                        
                        ),
                      ),
                      const SizedBox(height: 5,),
                       Align(
                        alignment: Alignment.topLeft,
                        child: Text(widget.vacInfo,
                        style: const TextStyle(
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
                              dynamic route = widget.page;
                              nextScreenReplace(context,  route);
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