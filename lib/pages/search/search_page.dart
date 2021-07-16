import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:restaurants_app/common/widgets/no_connection_screen.dart';
import 'package:restaurants_app/provider/restaurants_provider.dart';
import 'package:restaurants_app/pages/search/widgets/loading_screen.dart';
import 'package:restaurants_app/pages/search/widgets/not_found_screen.dart';
import 'package:restaurants_app/pages/search/widgets/search_page_builder.dart';
import 'package:restaurants_app/pages/search/widgets/search_result_list.dart';

class SearchPage extends StatelessWidget {
  static String routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RestaurantProvider.search(),
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SafeArea(
            child: Consumer<RestaurantProvider>(
              builder: (context, provider, child) {
                if (provider.state == ResultState.noData) {
                  return SearchPageBuilder(
                    content: NotFoundScreen(query: provider.query),
                  );
                } else if (provider.state == ResultState.noConnection) {
                  return SearchPageBuilder(
                    content: NoConnectionScreen(query: provider.query, provider: provider),
                  );
                } else if (provider.state == ResultState.error) {
                  return SearchPageBuilder(
                    content: Center(child: Text(provider.message)),
                  );
                } else if (provider.state == ResultState.hasData) {
                  return SearchPageBuilder(content: SearchResultList());

                } else if (provider.state == ResultState.loading) {
                  return SearchPageBuilder(content: LoadingScreen());
                }
                return SearchPageBuilder();
              },
            ),
          ),
        ),
      ),
    );
  }
}

