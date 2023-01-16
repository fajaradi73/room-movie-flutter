class ApiUri {
  static const apiKey = "84f84d665c4e67dbd2a7ca5693f9ca51";
  static const baseUrl = 'https://api.themoviedb.org/3/';

  static String movie(String path) => "movie/$path?api_key=$apiKey";

  static String movieNoPath() => "movie?api_key=$apiKey";

  static String serialTv(String path) => "tv/$path?api_key=$apiKey";

  static String serialTvNoPath() => "tv?api_key=$apiKey";

  static String artist(String path) => "person/$path?api_key=$apiKey";

  static String artistNoPath() => "person?api_key=$apiKey";
  static String multiNoPath() => "multi?api_key=$apiKey";

  static String popularMovie(int page) => "${movie("popular")}&page=$page";

  static String nowPLayingMovie(int page) =>
      "${movie("now_playing")}&page=$page";

  static String topRatedMovie(int page) => "${movie("top_rated")}&page=$page";

  static String upComingMovie(int page) => "${movie("upcoming")}&page=$page";

  static String trendingMovie(int page) =>
      "trending/${movie("day")}&page=$page";

  static String searchMovie(int page, String query) =>
      "search/${movieNoPath()}&page=$page&query=$query";

  static String detailMovie(int id, String append) =>
      "${movie("$id")}&append_to_response=$append";

  static String popularSerialTv(int page) =>
      "${serialTv("popular")}&page=$page";

  static String detailSerialTv(int id, String append) =>
      "${serialTv("$id")}&append_to_response=$append";

  static String topRateSerialTv(int page) =>
      "${serialTv("top_rated")}&page=$page";

  static String airingTodaySerialTv(int page) =>
      "${serialTv("airing_today")}&page=$page";

  static String onTheAirSerialTv(int page) =>
      "${serialTv("on_the_air")}&page=$page";

  static String searchSerialTv(int page, String query) =>
      "search/${serialTvNoPath()}&page=$page&query=$query";

  static String popularArtist(int page) => "${artist("popular")}&page=$page";

  static String searchArtist(int page, String query) =>
      "search/${artistNoPath()}&page=$page&query=$query";

  static String detailArtist(int id, String append) =>
      "${artist("$id")}&append_to_response=$append";

  static String searchMulti(int page, String query) =>
      "search/${multiNoPath()}&page=$page&query=$query";
}
