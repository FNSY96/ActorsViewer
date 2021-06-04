import 'package:actors_viewer/api_repository/popular_actors_data_api_repository.dart';
import 'package:actors_viewer/api_requests_classes/popular_actor.dart';
import 'package:flutter/material.dart';

enum LoadMoreStatus { LOADING, STABLE }

class PopularActorsDataProvider with ChangeNotifier {
  DataModel _dataFetcher;
  int totalPages = 0;

  List<PopularActor> get popularActorsDetails => _dataFetcher.data;

  int get totalResults => _dataFetcher.totalResults;

  LoadMoreStatus _loadMoreStatus = LoadMoreStatus.STABLE;

  PopularActorsDataProvider() {
    _initStreams();
  }

  void _initStreams() {
    _dataFetcher = DataModel();
  }

  void resetStreams() {
    _initStreams();
  }

  getPopularActors(int page) async {
    if (totalPages == 0 || page <= totalPages) {
      DataModel dataModel =
          await PopularActorsDataApiRepository().getPopularActors(page);
      if (_dataFetcher.data == null) {
        totalPages = dataModel.totalPages;
        _dataFetcher = dataModel;
      } else {
        _dataFetcher.data.addAll(dataModel.data);
        _dataFetcher = _dataFetcher;

        setLoadingState(LoadMoreStatus.STABLE);
      }

      notifyListeners();
    }

    if (page > totalPages) {
      setLoadingState(LoadMoreStatus.STABLE);
      notifyListeners();
    }
  }

  setLoadingState(LoadMoreStatus loadMoreStatus) {
    _loadMoreStatus = loadMoreStatus;
    notifyListeners();
  }
}
