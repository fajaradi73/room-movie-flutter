/*
 * room_movie
 *     ApiService.dart
 *     Created by Fajar Adi Prasetyo on 30/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:room_movie/util/Constant.dart';


class ApiService {
    static Future getMoviePopular(int page){
        return http.get(Uri.parse("${Constant.baseUrl}movie/popular?api_key=${Constant.apiKey}&page=$page"));
    }

    static Future getTVPopular(int page){
        return http.get(Uri.parse("${Constant.baseUrl}tv/popular?api_key=${Constant.apiKey}&page=$page"));
    }
}
