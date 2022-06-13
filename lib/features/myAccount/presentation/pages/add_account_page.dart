import 'package:antilostaccount/core/platform/scroll_behavior.dart';
import 'package:antilostaccount/core/styles/colors.dart';
import 'package:antilostaccount/core/styles/size.dart';
import 'package:antilostaccount/features/myAccount/domain/entities/myaccount_entity.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/add_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/domain/usecase/edit_account_usecase.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_bloc.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_event.dart';
import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAccountPage extends StatefulWidget {
  final MyAccountEntity? myAccountEntity;
  const AddAccountPage({Key? key, this.myAccountEntity}) : super(key: key);

  @override
  _AddAccountPageState createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {

  bool _obscureText = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameInput = TextEditingController();
  final TextEditingController _usernameInput = TextEditingController();
  final TextEditingController _passwordInput = TextEditingController();
  String _category = "social";

  @override
  void initState() {
    if(widget.myAccountEntity != null){
      _nameInput.text = widget.myAccountEntity!.name;
      _usernameInput.text = widget.myAccountEntity!.username;
      _passwordInput.text = widget.myAccountEntity!.password;
      _category = widget.myAccountEntity!.category;
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameInput.dispose();
    _usernameInput.dispose();
    _passwordInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Pigment.fromString(primaryColor),
        centerTitle: true,
        title: Text((widget.myAccountEntity == null ? 'Add New Account' : 'Edit Account')),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Name website/Apps
                  const Text(
                    'Name website/Apps',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _nameInput,
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.left,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Name website/Apps cannot be blank";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Pigment.fromString(primaryColor)),
                      borderRadius: BorderRadius.circular(10.0),),
                      prefixIcon: const Icon(Icons.airplay_outlined),
                      hintText: 'Name website/Apps'
                    ),
                  ),
                  const SizedBox(height: 30,),

                  ///Username/Email/Phone Number
                  const Text(
                    'Username/Email/Phone Number',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _usernameInput,
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.left,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Username/Email/Phone Number cannot be blank";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Pigment.fromString(primaryColor)),
                          borderRadius: BorderRadius.circular(10.0),),
                        prefixIcon: const Icon(Icons.account_circle_outlined),
                        hintText: 'Username/Email/Phone Number'
                    ),
                  ),
                  const SizedBox(height: 30,),

                  ///Password
                  const Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _passwordInput,
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.left,
                    obscureText: _obscureText,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Password cannot be blank";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Pigment.fromString(primaryColor)),
                          borderRadius: BorderRadius.circular(10.0),),
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                            icon: _obscureText == true
                                ? const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.black,
                            )
                                : const Icon(
                              Icons.visibility_outlined,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            })
                    ),
                  ),
                  const SizedBox(height: 30,),

                  ///Category Account
                  const Text(
                    'Category Account',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: autoSizedWidth(context, 0.1), // gap between adjacent chips
                      runSpacing: 20.0, // gap between lines
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              width: 55,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _category = "streaming";
                                  });
                                },
                                child: Image.asset("assets/ic_streaming.png",),
                                style: ElevatedButton.styleFrom(
                                  side: _category == "streaming" ? BorderSide(width: 3, color: Pigment.fromString(primaryColor),) : null,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(50),)
                                  ),
                                  primary: Colors.white,
                                  shadowColor: Colors.white
                                ),
                              ),
                            ),
                            Text("Streaming",
                              style:TextStyle(
                                fontSize: autoSizedWidth(context, 0.03),
                                fontWeight: _category == "streaming" ? FontWeight.bold : FontWeight.normal,
                                color: _category == "streaming" ? Pigment.fromString(primaryColor) : Colors.black,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              width: 55,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _category = "social";
                                  });
                                },
                                child: Image.asset("assets/ic_social.png",),
                                style: ElevatedButton.styleFrom(
                                  side: _category == "social" ? BorderSide(width: 3, color: Pigment.fromString(primaryColor),) : null,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(50),),
                                  ),
                                  primary: Colors.white,
                                  shadowColor: Colors.white
                                ),
                              ),
                            ),
                            Text("Social",
                              style:TextStyle(
                                fontSize: autoSizedWidth(context, 0.03),
                                fontWeight: _category == "social" ? FontWeight.bold : FontWeight.normal,
                                color: _category == "social" ? Pigment.fromString(primaryColor) : Colors.black,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              width: 55,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _category = "finance";
                                  });
                                },
                                child: Image.asset("assets/ic_finance.png",),
                                style: ElevatedButton.styleFrom(
                                  side: _category == "finance" ? BorderSide(width: 3, color: Pigment.fromString(primaryColor),) : null,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(50),)
                                  ),
                                  primary: Colors.white,
                                  shadowColor: Colors.white
                                ),
                              ),
                            ),
                            Text("Finance",
                              style:TextStyle(
                                fontSize: autoSizedWidth(context, 0.03),
                                fontWeight: _category == "finance" ? FontWeight.bold : FontWeight.normal,
                                color: _category == "finance" ? Pigment.fromString(primaryColor) : Colors.black,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              width: 55,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _category = "other";
                                  });
                                },
                                child: Image.asset("assets/ic_other.png",),
                                style: ElevatedButton.styleFrom(
                                  side: _category == "other" ? BorderSide(width: 3, color: Pigment.fromString(primaryColor),) : null,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(50),)
                                  ),
                                  primary: Colors.white,
                                  shadowColor: Colors.white
                                ),
                              ),
                            ),
                            Text("Other",
                              style:TextStyle(
                                fontSize: autoSizedWidth(context, 0.03),
                                fontWeight: _category == "other" ? FontWeight.bold : FontWeight.normal,
                                color: _category == "other" ? Pigment.fromString(primaryColor) : Colors.black,
                              ),
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 70,),

                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {

                        if(_formKey.currentState!.validate()){

                          if(widget.myAccountEntity == null){
                            context.read<MyAccountBloc>().add(
                                AddAccountEvent(
                                    context: context,
                                    paramsAddAccount: ParamsAddAccount(
                                      name: _nameInput.text,
                                      username: _usernameInput.text,
                                      password: _passwordInput.text,
                                      category: _category
                                    )));
                          } else {
                            context.read<MyAccountBloc>().add(
                                EditAccountEvent(
                                    context: context,
                                    paramsEditAccount: ParamsEditAccount(
                                      id: widget.myAccountEntity!.id,
                                      name: _nameInput.text,
                                      username: _usernameInput.text,
                                      password: _passwordInput.text,
                                      category: _category
                                    )));
                          }
                        }

                      },
                      child: Text(widget.myAccountEntity == null ? "Save Account" : "Edit Account",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          side:  BorderSide(width: 3, color: Pigment.fromString(primaryColor),),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10),)
                          ),
                          primary: Pigment.fromString(primaryColor),
                          shadowColor: Colors.white
                      ),

                    ),
                  )
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
