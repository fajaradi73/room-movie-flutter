class ApiUri {
  static const apiKey = "84f84d665c4e67dbd2a7ca5693f9ca51";
  static const baseUrl = 'https://api.themoviedb.org/3/';

  static String movie(String path) => "movie/$path?api_key=$apiKey";
  static String serialTv(String path) => "tv/$path?api_key=$apiKey";
  static String artist(String path) => "person/$path?api_key=$apiKey";

  static String popularMovie(int page) => "${movie("popular")}&page=$page";
  static String popularSerialTv(int page) =>
      "${serialTv("popular")}&page=$page";
  static String popularArtist(int page) => "${artist("popular")}&page=$page";
}
