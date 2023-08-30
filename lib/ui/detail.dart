import 'package:bloc_pratice/data/model/users_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Firstname: ${userModel.firstname}",
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              "Lastname: ${userModel.lastname}",
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(height: 20),

            Text(
              "Job: ${userModel.jobTitle}",
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
            const SizedBox(height: 20),

            Text(
              "Age: ${userModel.age}",
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
