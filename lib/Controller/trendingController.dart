import 'package:cheiwe_player/Model/trendingData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

import '../Domain/domain.dart';
import '../Model/genreData.dart';

class TrendingController extends GetxController {
  var isLoading = true.obs;

  RxList seriesData = [].obs;
  List genreList = [].obs;
  var trendingData = TrendingData().obs;
  var genreData = GenreFIlter().obs;
  RxList moviesData = [].obs;
  ////  Circular progress indicatot //////  loading
  ///
  ///
  var moviesLoading = true.obs;
  var initiaLoading = true.obs;
  var seriesLoading = true.obs;
  /////

  ScrollController seriesController = ScrollController();

  ScrollController moviesController = ScrollController();
  @override
  void onInit() {
    fetchTrending();
    paginateSeries();
    paginateMovies();
    super.onInit();
  }

  genreFilter(id) async {
    seriesLoading(true);
    moviesLoading(true);
    try {
      var trending = await RemoteServices.genreFilter(id);
      if (trending != null) {
        genreData.value = trending;

        // if (trending.seriesFilter![0].series!.isNotEmpty &
        //     trending.moviesFilter![0].movies!.isNotEmpty) {
        seriesData.clear();
        moviesData.clear();
        for (int i = 0; i < trending.seriesFilter![0].series!.length; i++) {
          seriesData.add(trending.seriesFilter![0].series![i]);
        }
        for (int i = 0; i < trending.moviesFilter![0].movies!.length; i++) {
          moviesData.add(trending.moviesFilter![0].movies![i]);
          // }
        }

        print(trendingData.value);
      }
    } finally {
      seriesLoading(true);
      moviesLoading(true);
    }
  }

  paginateMovies() async {
    moviesController.addListener(() {
      if (moviesController.position.pixels ==
          moviesController.position.maxScrollExtent) {
        initiaLoading = false.obs;
        moviesController.keepScrollOffset;

        paginateMoviesByTen();
      }
    });
  }

  paginateSeries() async {
    seriesController.addListener(() {
      if (seriesController.position.pixels ==
          seriesController.position.maxScrollExtent) {
        initiaLoading = false.obs;
        seriesController.keepScrollOffset;

        paginateSeriesByTen();
      }
    });
  }

  paginateMoviesByTen() async {
    try {
      moviesLoading(true);
      var trending = await RemoteServices.paginatedData();
      if (trending != null) {
        for (int i = 0; i < trending.moviesFilter![0].data!.length; i++) {
          moviesData.add(trending.moviesFilter![0].data![i]);
        }
      }
    } finally {
      moviesLoading(false);
    }
  }

  paginateSeriesByTen() async {
    try {
      seriesLoading(true);
      var trending = await RemoteServices.paginatedData();
      if (trending != null) {
        for (int i = 0; i < trending.seriesFilter![0].data!.length; i++) {
          seriesData.add(trending.seriesFilter![0].data![i]);
        }
      }
    } finally {
      seriesLoading(false);
    }
  }

  filterALL() async {
    try {
      seriesLoading(false);
      moviesLoading(false);
      var trending = await RemoteServices.fetchData();
      if (trending != null) {
        trendingData.value = trending;
        for (int i = 0; i < trending.seriesFilter![0].data!.length; i++) {
          seriesData.add(trending.seriesFilter![0].data![i]);
        }

        for (int i = 0; i < trending.moviesFilter![0].data!.length; i++) {
          moviesData.add(trending.moviesFilter![0].data![i]);
        }

        // genreList.insert(0, x);
        print(trendingData.value);
      }
    } finally {
      seriesLoading(true);
      moviesLoading(true);
    }
  }

  fetchTrending() async {
    try {
      isLoading(true);
      var trending = await RemoteServices.fetchData();
      if (trending != null) {
        trendingData.value = trending;
        for (int i = 0; i < trending.seriesFilter![0].data!.length; i++) {
          seriesData.add(trending.seriesFilter![0].data![i]);
        }

        for (int i = 0; i < trending.moviesFilter![0].data!.length; i++) {
          moviesData.add(trending.moviesFilter![0].data![i]);
        }

        genreList = [...trending.genreFiler![0].data!.reversed];

        // genreList.insert(0, x);
        print(trendingData.value);
      }
    } finally {
      isLoading(false);
    }
  }
}
