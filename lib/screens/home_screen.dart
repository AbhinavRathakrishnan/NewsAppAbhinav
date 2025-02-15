import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/news_provider.dart';
import '../widgets/news_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String category = 'general';

  @override
  Widget build(BuildContext context) {
    final newsAsyncValue = ref.watch(newsProvider(category));

    return Scaffold(
      appBar: AppBar(title: Text('News Aggregator')),
      body: Column(
        children: [
          DropdownButton<String>(
            value: category,
            items: ['general', 'business', 'sports', 'technology']
                .map((e) =>
                    DropdownMenuItem(value: e, child: Text(e.toUpperCase())))
                .toList(),
            onChanged: (val) => setState(() => category = val!),
          ),
          Expanded(
            child: newsAsyncValue.when(
              data: (articles) => ListView.builder(
                itemCount: articles.length,
                itemBuilder: (_, index) => NewsCard(article: articles[index]),
              ),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (_, __) => Center(child: Text('Failed to load news')),
            ),
          ),
        ],
      ),
    );
  }
}
