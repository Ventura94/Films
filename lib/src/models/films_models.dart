class Films {
  late int _page;
  late List<Results> _results;
  //Dates? _dates;
  late int _totalPages;
  late int _totalResults;

  Films.fromJson(dynamic json) {
    _page = json['page'];
    _results = [];
    json['results'].forEach((result) {
      _results.add(Results.fromJson(result));
    });
    //_dates = Dates.fromJson(json['dates']);
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }

  int get page => _page;

  List<Results> get results => _results;

 // Dates? get dates => _dates;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;
}

class Dates {
  late String _maximum;
  late String _minimum;

  Dates.fromJson(dynamic json) {
    _maximum = json['maximum'];
    _minimum = json['minimum'];
  }

  String get maximum => _maximum;

  String get minimum => _minimum;
}

class Results {
  late String _posterPath;
  late bool _adult;
  late String _overview;
  late String _releaseDate;
  late List<dynamic> _genreIds;
  late int _id;
  late String _originalTitle;
  late String _originalLanguage;
  late String _title;
  late String _backdropPath;
  late num _popularity;
  late int _voteCount;
  late bool _video;
  late num _voteAverage;

  Results.fromJson(dynamic json) {
    _posterPath = json['poster_path'];
    _adult = json['adult'];
    _overview = json['overview'];
    _releaseDate = json['release_date'];
    _genreIds = json['genre_ids'];
    _id = json['id'];
    _originalTitle = json['original_title'];
    _originalLanguage = json['original_language'];
    _title = json['title'];
    _backdropPath = json['backdrop_path'];
    _popularity = json['popularity'];
    _voteCount = json['vote_count'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
  }

  String get posterPath => _posterPath;

  bool get adult => _adult;

  String get overview => _overview;

  String get releaseDate => _releaseDate;

  List<dynamic> get genreIds => _genreIds;

  int get id => _id;

  String get originalTitle => _originalTitle;

  String get originalLanguage => _originalLanguage;

  String get title => _title;

  String get backdropPath => _backdropPath;

  num get popularity => _popularity;

  int get voteCount => _voteCount;

  bool get video => _video;

  num get voteAverage => _voteAverage;

  String getPosterImage() {
    return "https://image.tmdb.org/t/p/w500$posterPath";
  }
}
