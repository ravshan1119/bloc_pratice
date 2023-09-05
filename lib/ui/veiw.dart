import 'package:bloc_pratice/blocs/spacex_bloc/spacex_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spacex Productions')),
      body: BlocBuilder<SpacexBloc, SpacexState>(
        builder: (context, state) {
          if (state is SpacexLoadingState) {
            return const CircularProgressIndicator();
          }
          if (state is SpacexSuccessState) {
            return ListView.builder(
              itemCount: state.productions.length,
              itemBuilder: (context, index) {
                final production = state.productions[index];
                print(production);
                return ListTile(
                  onTap: () {
                    //context.read<SingleCountryBloc>().add(SingleCountryFetch(code: country.code));
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return CountryDetailScreen(
                    //         countryCode: country.code,
                    //       );
                    //     },
                    //   ),
                    // );
                  },
                  leading: Image.network(production.image),
                  title: Text(production.model),
                  trailing: Text(production.year_built.toString()),
                  subtitle: Text(production.id),
                );
              },
            );
          }
          return const Text('Oops something went wrong!');
        },
      ),
    );
  }
}