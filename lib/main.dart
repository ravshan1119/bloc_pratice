import 'package:bloc_pratice/api/production_api.dart';
import 'package:bloc_pratice/blocs/spacex_bloc/spacex_bloc.dart';
import 'package:bloc_pratice/ui/veiw.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App(jobsApiClient: CountriesApiClient.create()));
}

class App extends StatelessWidget {
  const App({super.key, required this.jobsApiClient});

  final CountriesApiClient jobsApiClient;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SpacexBloc(jobsApiClient: jobsApiClient)..add(SpacexFetchStarted()),
      child: GraphQLProvider(
        client: ValueNotifier(CountriesApiClient.create().graphQLClient),
        child:
            const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewScreen(),
    );
  }
}
