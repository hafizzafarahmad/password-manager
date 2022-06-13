import 'package:antilostaccount/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

void dialogToConfirm(BuildContext context,{message, required GestureTapCallback onTap}) {
  Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '$message',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black,
                fontFamily: 'PoppinsMedium'
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child:
                  Card(
                    color: Colors.transparent,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15.0),
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Pigment.fromString(primaryColor))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.close, size: MediaQuery.of(context).size.width*0.04,
                                color: Pigment.fromString(primaryColor)),
                              Text(
                                '  Cancel',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width*0.04,
                                  color: Pigment.fromString(primaryColor),
                                  fontFamily: 'PoppinsMedium',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                      ),
                    ),
                  )
                ),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 5,
                  child:
                  Card(
                    color: Pigment.fromString(primaryColor),
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15.0),
                      onTap: onTap,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.check, size: MediaQuery.of(context).size.width*0.04,
                                color: Colors.white,),
                              Text(
                                '  Yes',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width*0.04,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )
  );
  showDialog(
      context: context, builder: (BuildContext context) => simpleDialog);
}