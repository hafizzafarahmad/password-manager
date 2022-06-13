import 'package:antilostaccount/core/platform/scroll_behavior.dart';
import 'package:antilostaccount/core/styles/colors.dart';
import 'package:antilostaccount/core/styles/size.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_bloc.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_event.dart';
import 'package:antilostaccount/features/myAccount/presentation/bloc/myaccount_state.dart';
import 'package:antilostaccount/features/myAccount/presentation/pages/add_account_page.dart';
import 'package:antilostaccount/features/myAccount/presentation/pages/list_account_page.dart';
import 'package:antilostaccount/features/myAccount/presentation/pages/widget/item_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pigment/pigment.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<MyAccountBloc>().add(GetAccountEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: autoSizedHeight(context, 1),
                  decoration: BoxDecoration(
                    color: Pigment.fromString(primaryColor),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  height: autoSizedHeight(context, 0.4),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        opacity: 0.4,
                        image: AssetImage("assets/home-pattern.png",),
                        fit: BoxFit.fill,
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.menu, size: 30, color: Colors.white70,)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome Home",
                            style:TextStyle(
                                fontSize: autoSizedWidth(context, 0.055),
                                color: Colors.white70,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 15,),
                          Text("Manage your saved passwords, securely stored in your phone.",
                            style:TextStyle(
                              fontSize: autoSizedWidth(context, 0.03),
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),

                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          const LatestAccountPage(search: true,)
                          ));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          height: 50,
                          decoration: const  BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.search, color: Colors.black54,),
                              SizedBox(width: 10,),
                              Text("Search",
                                style:TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: autoSizedHeight(context, 0.38),
                  child: Container(
                    width: autoSizedWidth(context, 1),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25), topRight: Radius.circular(25))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: autoSizedHeight(context, 0.21),
                          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Category",
                                    style:TextStyle(
                                        fontSize: autoSizedWidth(context, 0.035),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Wrap(
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
                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                            const LatestAccountPage(filter: "Streaming",)
                                            ));
                                          },
                                          child: Image.asset("assets/ic_streaming.png",),
                                          style: ElevatedButton.styleFrom(
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
                                          color: Colors.black,
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
                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                            const LatestAccountPage(filter: "Social",)
                                            ));
                                          },
                                          child: Image.asset("assets/ic_social.png",),
                                          style: ElevatedButton.styleFrom(
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(50),)
                                              ),
                                              primary: Colors.white,
                                              shadowColor: Colors.white
                                          ),
                                        ),
                                      ),
                                      Text("Social",
                                        style:TextStyle(
                                          fontSize: autoSizedWidth(context, 0.03),
                                          color: Colors.black,
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
                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                            const LatestAccountPage(filter: "Finance",)
                                            ));
                                          },
                                          child: Image.asset("assets/ic_finance.png",),
                                          style: ElevatedButton.styleFrom(
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
                                          color: Colors.black,
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
                                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                            const LatestAccountPage(filter: "Other",)
                                            ));
                                          },
                                          child: Image.asset("assets/ic_other.png",),
                                          style: ElevatedButton.styleFrom(
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
                                          color: Colors.black,
                                        ),
                                      )
                                    ],
                                  ),

                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: autoSizedWidth(context, 1),
                          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25), topRight: Radius.circular(25))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Latest Account",
                                    style:TextStyle(
                                        fontSize: autoSizedWidth(context, 0.035),
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                      const LatestAccountPage()
                                      ));
                                    },
                                    child: Text("Show More",
                                      style:TextStyle(
                                        fontSize: autoSizedWidth(context, 0.03),
                                        color: Pigment.fromString(primaryColor),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 5,),
                              SizedBox(
                                  height: autoSizedHeight(context, 0.36),
                                  child: ScrollConfiguration(
                                    behavior: MyScrollBehavior(),
                                    child: BlocBuilder<MyAccountBloc, MyAccountState>(
                                        builder: (context, state){
                                          if(state is MyAccountLoadingState){
                                            return const Center(child: CircularProgressIndicator(),);
                                          } else if (state is MyAccountListState){
                                            return
                                              state.list.isEmpty ?
                                              Container(
                                                margin: const EdgeInsets.only(top: 30),
                                                child: const Text("No Data"),
                                              ) :
                                              ListView.builder(
                                                padding: const EdgeInsets.only(bottom: 100, top: 15),
                                                shrinkWrap: true,
                                                addAutomaticKeepAlives: true,
                                                itemCount: state.list.length > 2 ? 2 : state.list.length,
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
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            )
          ],
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
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
