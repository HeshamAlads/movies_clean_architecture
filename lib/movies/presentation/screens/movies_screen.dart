import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/presentation/manager/Movies_bloc/movies_bloc.dart';
import 'package:movies_app/movies/presentation/manager/Movies_bloc/movies_event.dart';
import 'package:movies_app/movies/presentation/widgets/now_playing_movies.dart';
import 'package:movies_app/movies/presentation/widgets/popular_movies.dart';
import 'package:movies_app/movies/presentation/widgets/popular_see_more.dart';
import 'package:movies_app/movies/presentation/widgets/top_rated_movies.dart';
import 'package:movies_app/movies/presentation/widgets/top_rated_see_more.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('build');
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),
      child: const Scaffold(
        body: SingleChildScrollView(
          key: Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NowPlayingWidget(),
              RowPopularAndSeeMore(),
              PopularWidget(),
              RowTopRatedAndSeeMore(),
              TopRatedWidget(),
              SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
    );
  }
}
