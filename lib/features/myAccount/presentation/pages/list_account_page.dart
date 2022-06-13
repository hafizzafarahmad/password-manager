import 'package:antilostaccount/core/platform/scroll_behavior.dart';
import 'package:antilostaccount/core/styles/colors.dart';
import 'package:antilostaccount/core/styles/size.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_bloc.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_event.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_state.dart';
import 'package:antilostaccount/features/myAccount/presentation/pages/widget/item_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pigment/pigment.dart';

import 'add_account_page.dart';

class LatestAccountPage extends StatefulWidget {
  final String? filter;
  final bool search;
  const LatestAccountPage({Key? key, this.filter, this.search = false}) : super(key: key);

  @override
  _LatestAccountPageState createState() => _LatestAccountPageState();
}

class _LatestAccountPageState extends State<LatestAccountPage> {

  final FocusNode _searchFocus = FocusNode();
  final TextEditingController _searchInput = TextEditingController();
  bool isSearch = false;

  @override
  void initState() {
    context.read<MyAccountBloc>().add(GetAccountEvent(filter: widget.filter));
    if(widget.search){
      _searchFocus.requestFocus();
    }
    super.initState();
  }

  @override
  void dispose() {
    _searchFocus.dispose();
    _searchInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Pigment.fromString(primaryColor),
        centerTitle: true,
        title: Text(widget.filter == null ? 'My Account' : widget.filter!),
        leading: IconButton(
          onPressed: (){
            context.read<MyAccountBloc>().add(GetAccountEvent());
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: TextFormField(
                  controller: _searchInput,
                  focusNode: _searchFocus,
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.left,
                  onChanged: (val){
                    setState(() {
                      context.read<MyAccountBloc>().add(GetAccountEvent(query: val, filter: widget.filter));
                      if(val.isEmpty){
                        isSearch = false;
                      }else{
                        isSearch = true;
                      }
                    });

                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0),),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Pigment.fromString(primaryColor)),
                        borderRadius: BorderRadius.circular(20.0),),
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: (!isSearch) ? const SizedBox() :
                      InkWell(
                        onTap: (){
                          setState(() {
                            _searchInput.clear();
                            isSearch = false;
                            context.read<MyAccountBloc>().add(GetAccountEvent(filter: widget.filter));
                          });
                        },
                        child: const Icon(Icons.close, size: 15,),
                      )
                  ),
                ),
              ),
              SizedBox(
                  height: autoSizedHeight(context, 0.84),
                  child:
                  BlocBuilder<MyAccountBloc, MyAccountState>(
                      builder: (context, state){
                        if(state is MyAccountLoadingState){
                          return const Center(child: CircularProgressIndicator(),);
                        } else if (state is MyAccountListState){
                          return
                            state.list.isEmpty ?
                            const SizedBox(
                              height: 200,
                              child: Text("No Data"),
                            ) :

                            ListView.builder(
                              padding: const EdgeInsets.only(bottom: 100, top: 0, left: 15, right: 15),
                              shrinkWrap: true,
                              addAutomaticKeepAlives: true,
                              itemCount: state.list.length,
                              itemBuilder: (context, i){
                                return ItemAccount(myAccountEntity: state.list[i]);
                              }
                          );
                        } else {
                          return Container();
                        }

                      }
                  )

              )
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>
            const AddAccountPage()
          ));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child:  Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.add, color: Colors.white, size: 18,),
              SizedBox(width: 5,),
              Text("Add Account",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Pigment.fromString(primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  offset: Offset(1.0, 5.0)
              )
            ]
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
