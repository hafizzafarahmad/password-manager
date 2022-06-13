import 'package:antilostaccount/core/styles/colors.dart';
import 'package:antilostaccount/core/styles/size.dart';
import 'package:antilostaccount/core/widget/dialogToConfirm.dart';
import 'package:antilostaccount/features/myAccount/domain/entities/myaccount_entity.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/delete_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_bloc.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_event.dart';
import 'package:antilostaccount/features/myAccount/presentation/pages/add_account_page.dart';
import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemAccount extends StatefulWidget {
  final MyAccountEntity myAccountEntity;
  const ItemAccount({Key? key, required this.myAccountEntity}) : super(key: key);

  @override
  _ItemAccountState createState() => _ItemAccountState();
}

class _ItemAccountState extends State<ItemAccount> {

  bool _obsecurePass = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: Pigment.fromString(lightGrey),
          borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(8),
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 1.0,
                      spreadRadius: 2.0,
                      offset: Offset(0.0, 1.0)
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            child: Image.asset("assets/ic_${widget.myAccountEntity.category}.png",),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.myAccountEntity.name,
                      style:TextStyle(
                          fontSize: autoSizedWidth(context, 0.035),
                          color: Colors.black
                      ),
                    ),
                    PopupMenuButton<int>(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 0,
                          child: Row(
                            children: const <Widget>[
                              Icon(Icons.edit, size: 18, ),
                              SizedBox(width: 10,),
                              Text(
                                "Edit",
                                style: TextStyle(
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: Row(
                            children: const <Widget>[
                              Icon(Icons.delete_outline_outlined, size: 18, color: Colors.red),
                              SizedBox(width: 10,),
                              Text(
                                "Delete",
                                style: TextStyle(
                                    color: Colors.red
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      icon: const Icon(Icons.more_horiz, size: 18, ),
                      offset: const Offset(0, 0),
                      onSelected: (value){
                        if(value == 0){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              AddAccountPage(myAccountEntity: widget.myAccountEntity,)));
                        }else{
                          dialogToConfirm(context, message: 'Delete ${widget.myAccountEntity.name}?', onTap: (){
                            context.read<MyAccountBloc>().add(DeleteAccountEvent(
                                context: context,
                                paramsDeleteAccount: ParamsDeleteAccount(
                                    id: widget.myAccountEntity.id
                                )));
                          });
                        }
                      },
                    ),
                  ],
                ),
                Text(widget.myAccountEntity.username,
                  style:TextStyle(
                      fontSize: autoSizedWidth(context, 0.03),
                      color: Colors.black
                  ),
                ),
                Row(
                  children: [
                    Text(!_obsecurePass ? widget.myAccountEntity.password : "********",
                      style:TextStyle(
                          fontSize: autoSizedWidth(context, 0.03),
                          color: Colors.black
                      ),
                    ),
                    IconButton(onPressed: (){
                      setState(() {
                        _obsecurePass = !_obsecurePass;
                      });
                    },
                        icon: const Icon(Icons.remove_red_eye_sharp, size: 20, color: Colors.black,)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

