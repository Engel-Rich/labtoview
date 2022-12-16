import 'package:flutter/material.dart';

const keyforNewqApi = "6ba6b2d954f34edfa94eac3c393c80f8";
const imageIrlstart = "https://image.tmdb.org/t/p/w500";

// urlCompette d'une ial
String imageUrl(path) => "imageIrlstart$path";

// url d'apell;
String url(int idmove) =>
    "https://api.themoviedb.org/3/movie/$idmove?api_key=d9227206e53fe9563a62d93e77650bde&language=fr&append_to_response=images&include_image_language=fr,%20null";
SizedBox spacer(taille) => SizedBox(height: taille);
