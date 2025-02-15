import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/api_service.dart';
import '../models/news_model.dart';

final newsProvider =
    FutureProvider.family<List<Article>, String>((ref, category) async {
  return ApiService().fetchNews(category: category);
});
