import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:http/http.dart' as http;

import '../../domain/usecases/get_random_image.dart';
import '../../data/datasources/remote_image_datasource.dart';
import '../../data/repositories/image_repository_impl.dart';
import 'image_event.dart';
import 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  late final http.Client _client;
  late final GetRandomImage _usecase;

  ImageBloc() : super(ImageInitial()) {
    _client = http.Client();
    final remote = RemoteImageDataSource(_client);
    final repo = ImageRepositoryImpl(remote);
    _usecase = GetRandomImage(repo);

    on<FetchImage>(_onFetchImage);
  }

  Future<void> _onFetchImage(FetchImage event, Emitter<ImageState> emit) async {
    emit(ImageLoadInProgress());
    try {
      final img = await _usecase.call();
      Color? dominant;
      try {
        final provider = CachedNetworkImageProvider(img.url);
        final palette = await PaletteGenerator.fromImageProvider(provider, size: const Size(200, 200));
        dominant = palette.dominantColor?.color;
      } catch (_) {
        dominant = null;
      }
      emit(ImageLoadSuccess(url: img.url, dominantColor: dominant));
    } catch (e) {
      emit(ImageLoadFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _client.close();
    return super.close();
  }
}
