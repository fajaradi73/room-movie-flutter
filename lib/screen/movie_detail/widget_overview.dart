// ignore_for_file: file_names
/*
 * 
 *     widget_overview
 *     Created by Fajar Adi Prasetyo on 22/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/models/movie/Results.dart';

class MovieDetailWidgetOverview extends StatelessWidget {
  const MovieDetailWidgetOverview({Key? key, required this.data})
      : super(key: key);
  final Results data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Action, Fantasy, Horror",
              style: TextStyle(fontSize: 18),
            ),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.all(3),
                child: Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.amber,
                ),
              ),
              Text(
                "10 \u2022 20/08/2020 \u2022 1h 32m",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Tagline",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Kilasan Singkat",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum.",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
