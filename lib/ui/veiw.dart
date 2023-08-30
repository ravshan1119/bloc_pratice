import 'package:bloc_pratice/blocs/users/users_bloc.dart';
import 'package:bloc_pratice/blocs/users/users_event.dart';
import 'package:bloc_pratice/blocs/users/users_state.dart';
import 'package:bloc_pratice/data/model/form_status.dart';
import 'package:bloc_pratice/data/model/users_model.dart';
import 'package:bloc_pratice/ui/detail.dart';
import 'package:bloc_pratice/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: Stack(
        children: [
          BlocConsumer<UsersBloc, UsersState>(
            builder: (context, state) {
              return state.users.isNotEmpty
                  ? ListView(
                      children: [
                        ...List.generate(state.users.length, (index) {
                          UserModel userModel = state.users[index];
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailScreen(userModel: userModel)));
                            },
                            leading: IconButton(
                              onPressed: () {
                                context
                                    .read<UsersBloc>()
                                    .add(DeleteUser(userId: userModel.userId));
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                SingingCharacter? _characterUpdate =
                                    SingingCharacter.men;

                                TextEditingController firstnameController =
                                    TextEditingController();
                                TextEditingController lastnameController =
                                    TextEditingController();

                                TextEditingController jobController =
                                    TextEditingController();
                                TextEditingController ageController =
                                    TextEditingController();

                                firstnameController.text = userModel.firstname;
                                lastnameController.text = userModel.lastname;
                                jobController.text = userModel.jobTitle;
                                ageController.text = userModel.age.toString();
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible:
                                      false, // user must tap button!
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('User Update'),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextField(
                                                controller: firstnameController,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Firstname',
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextField(
                                                controller: lastnameController,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Lastname',
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextField(
                                                controller: jobController,
                                                textInputAction:
                                                    TextInputAction.next,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Job title',
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: TextField(
                                                // inputFormatters: <TextInputFormatter>[
                                                //   FilteringTextInputFormatter.allow(RegExp("[0-9].")),
                                                // ],
                                                keyboardType:
                                                    TextInputType.phone,
                                                controller: ageController,
                                                textInputAction:
                                                    TextInputAction.done,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText: 'Age',
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              title: const Text('Men'),
                                              leading: Radio<SingingCharacter>(
                                                value: SingingCharacter.men,
                                                groupValue: _characterUpdate,
                                                onChanged:
                                                    (SingingCharacter? value) {
                                                  setState(() {
                                                    _characterUpdate = value;
                                                  });
                                                },
                                              ),
                                            ),
                                            ListTile(
                                              title: const Text('Women'),
                                              leading: Radio<SingingCharacter>(
                                                value: SingingCharacter.women,
                                                groupValue: _characterUpdate,
                                                onChanged:
                                                    (SingingCharacter? value) {
                                                  setState(() {
                                                    _characterUpdate = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Update'),
                                          onPressed: () {
                                            // UserModel userModel = UserModel(
                                            //   userId: DateTime.now().microsecondsSinceEpoch,
                                            //   gender: 0,
                                            //   age: int.parse(ageController.text),
                                            //   firstname: firstnameController.text,
                                            //   jobTitle: jobController.text,
                                            //   lastname: lastnameController.text,
                                            // );
                                            // BlocProvider.of<UsersBloc>(context).add(AddUser(newUser: userModel));
                                            UserModel userModelUpdate = UserModel(
                                              userId: DateTime.now().microsecondsSinceEpoch,
                                              gender: 0,
                                              age: int.parse(ageController.text),
                                              firstname: firstnameController.text,
                                              jobTitle: jobController.text,
                                              lastname: lastnameController.text,
                                            );

                                            context.read<UsersBloc>().add(
                                              UpdateUser(
                                                  updatedUser: userModelUpdate
                                              ),
                                            );
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );


                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                            title: Text(
                              userModel.firstname,
                              style: const TextStyle(color: Colors.black),
                            ),
                            subtitle: Text(userModel.userId.toString()),
                          );
                        })
                      ],
                    )
                  : const Center(child: Text("EMPTY !!!"));
            },
            listener: (context, state) {},
          ),
          Visibility(
            visible:
                context.watch<UsersBloc>().state.status == FormStatus.loading,
            child: const Align(child: CircularProgressIndicator()),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                SingingCharacter? _character = SingingCharacter.men;

                TextEditingController firstnameController =
                    TextEditingController();
                TextEditingController lastnameController =
                    TextEditingController();

                TextEditingController jobController = TextEditingController();
                TextEditingController ageController = TextEditingController();
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('User Add'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: firstnameController,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Firstname',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: lastnameController,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Lastname',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: jobController,
                                textInputAction: TextInputAction.next,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Job title',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                // inputFormatters: <TextInputFormatter>[
                                //   FilteringTextInputFormatter.allow(RegExp("[0-9].")),
                                // ],
                                keyboardType: TextInputType.phone,
                                controller: ageController,
                                textInputAction: TextInputAction.done,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Age',
                                ),
                              ),
                            ),
                            ListTile(
                              title: const Text('Men'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.men,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Women'),
                              leading: Radio<SingingCharacter>(
                                value: SingingCharacter.women,
                                groupValue: _character,
                                onChanged: (SingingCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Add'),
                          onPressed: () {
                            UserModel userModel = UserModel(
                              userId: DateTime.now().microsecondsSinceEpoch,
                              gender: 0,
                              age: int.parse(ageController.text),
                              firstname: firstnameController.text,
                              jobTitle: jobController.text,
                              lastname: lastnameController.text,
                            );
                            BlocProvider.of<UsersBloc>(context)
                                .add(AddUser(newUser: userModel));
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
                // BlocProvider.of<UsersBloc>(context).add(
                //   AddUser(
                //       newUser: UserModel(
                //           userId: DateTime.now().microsecondsSinceEpoch,
                //           age: 25,
                //           firstname: "Kimdur",
                //           lastname: "Kimdurda",
                //           gender: 0,
                //           jobTitle: "Flutter dev")),
                // );
              },
              heroTag: "add",
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<UsersBloc>(context).add(GetUsers());
              },
              heroTag: "get",
              child: const Icon(Icons.get_app),
            ),
          ],
        ),
      ),
    );
  }
}
