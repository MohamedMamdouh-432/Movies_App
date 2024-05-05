import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/api_constants.dart';
import 'package:movies_app/movies/presentation/controllers/top_rated_bloc/top_rated_bloc.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedComponent extends StatefulWidget {
  const TopRatedComponent({super.key});
  @override
  State<TopRatedComponent> createState() => _TopRatedComponentState();
}

class _TopRatedComponentState extends State<TopRatedComponent> {
  @override
  void initState() {
    super.initState();
    context.read<TopRatedBloc>().add(GetTopRatedMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedBloc, TopRatedState>(
      buildWhen: (previous, current) =>
          previous.requestStatus != current.requestStatus,
      builder: (context, state) {
        return FadeIn(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            height: 170.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return Container(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      /// todo : NAVIGATE TO  MOVIE DETAILS
                    },
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      child: CachedNetworkImage(
                        width: 120.0,
                        fit: BoxFit.cover,
                        imageUrl: ApiConstants.getImgUrl(movie.backdropPath),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            height: 170.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
