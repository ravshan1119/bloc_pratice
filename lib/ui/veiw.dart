import 'package:bloc_pratice/cubits/cubit.dart';
import 'package:bloc_pratice/cubits/data_state.dart';
import 'package:bloc_pratice/data/api_sevice.dart';
import 'package:bloc_pratice/data/model/data_model.dart';
import 'package:bloc_pratice/data/universal_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  bool isLoading = false;

  ApiService apiService = ApiService();
  List<DataModel> list = [];
  UniversalData? universalData;

  init() async {
    setState(() {
      isLoading = true;

    });
    universalData = await apiService.getData();

    list = universalData!.data;

    debugPrint(list.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
init();
    context.read<DataCubit>().fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: BlocConsumer<DataCubit, DataState>(
        builder: (context, state) {
          return isLoading?Center(child: CircularProgressIndicator(),):SingleChildScrollView(
                child: Column(
                    children: [
                      ...List.generate(
                          list.length, (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(10),

                        ),
                        height: 300,
                        width: double.infinity,
                        child: Column(
                            children: [
                              SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: Image.network(list[index].avatarUrl,fit: BoxFit.cover,)),
                              const SizedBox(height: 10),
                              Text("Name: ${list[index].name}",style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.black
                              ),),
                              Text("Username: ${list[index].username}",style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.black
                              ),),
                              Text("state: ${list[index].state}",style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.black
                              ),),

                            ],
                        ),
                      ),
                          )),
                    ],
                  ),
              );
        },
        listener: (context,state){
          if(state is DataLoadingState){
            const Center(child: CircularProgressIndicator(),);
          }
          if(state is DataErrorState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.toString())));
          }

        },

      ),
    );
  }
}
