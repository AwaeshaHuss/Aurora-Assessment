import 'package:flutter/material.dart';

abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoadInProgress extends ImageState {}

class ImageLoadSuccess extends ImageState {
  final String url;
  final Color? dominantColor;

  ImageLoadSuccess({required this.url, this.dominantColor});
}

class ImageLoadFailure extends ImageState {
  final String message;
  ImageLoadFailure(this.message);
}
