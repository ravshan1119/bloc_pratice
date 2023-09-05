import 'package:bloc_pratice/api/model/spacex_model.dart';
import 'package:bloc_pratice/api/queries/spacex_queries.dart' as queries;
import 'package:graphql/client.dart';

class GetJobsRequestFailure implements Exception {}

class CountriesApiClient {
  const CountriesApiClient({required this.graphQLClient});

  factory CountriesApiClient.create() {
    final httpLink = HttpLink('https://spacex-production.up.railway.app');
    final link = Link.from([httpLink]);

    return CountriesApiClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  final GraphQLClient graphQLClient;

  Future<List<SpaceXModel>> getCountries() async {
    final result = await graphQLClient.query(
      QueryOptions(document: gql(queries.getJobs)),
    );

    if (result.hasException) throw GetJobsRequestFailure();

    print(result.data?['ships']);
    return (result.data?['ships'] as List?)
            ?.map(
                (dynamic e) => SpaceXModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
  }

// Future<CountryDetailModel> getCountryById(String code) async {
//   final result = await graphQLClient.query(
//     QueryOptions(
//       document: gql(getSingleCountry),
//       variables: {'code': code},
//     ),
//   );
//   final data = await result.data?['country'] as Map<String, dynamic>;
//   return CountryDetailModel.fromJson(data);
// }
}
