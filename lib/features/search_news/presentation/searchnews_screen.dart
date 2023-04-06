import 'package:flutter/material.dart';
import 'package:news_app/features/search_news/presentation/views/widget/search_widget.dart';
import '../../../common/asyncvalue_widget.dart';
import '../../../common/normal_navigation/normal_navigation.dart';
import '../../../const/app_const.dart';
import '../../../utils/export.dart';
import '../../home/presentation/newsdetail_screen.dart';
import '../../home/presentation/views/widgets/news_card.dart';
import 'controller/search_newcontroller.dart';
import 'controller/search_query_controller.dart';

class SearchNewsScreen extends ConsumerStatefulWidget {
  const SearchNewsScreen({super.key});

  @override
  ConsumerState<SearchNewsScreen> createState() => _SearchNewsScreenState();
}

class _SearchNewsScreenState extends ConsumerState<SearchNewsScreen> {
  late TextEditingController searchEditingController;

  @override
  void initState() {
    searchEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    searchEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String result = ref.watch(queryProvider);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const CircleAvatar(
              backgroundColor: CupertinoColors.systemGrey5,
              child: Icon(CupertinoIcons.back),
            )),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            SearchWidget(
              onPressed: () {
                searchEditingController.clear();
                ref.read(queryProvider.notifier).update(
                      (state) => "",
                    );
              },
              searchEditingController: searchEditingController,
              onChanged: (value) {
                ref.watch(searchNewsControllerProvider(value));
                ref.read(queryProvider.notifier).update(
                      (state) => value.trim(),
                    );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.78,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    AsyncValueWidget(
                        listCount: 6,
                        isList: true,
                        value: ref.watch(searchNewsControllerProvider(result)),
                        data: (data) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: data.isNotEmpty
                                  ? Column(
                                      children: [
                                        ...data.map(
                                          (e) => InkWell(
                                            onTap: () => normalPush(
                                                context: context,
                                                widget: NewsDetailScreen(e: e)),
                                            child: NewsCard(e: e),
                                          ),
                                        )
                                      ],
                                    )
                                  : const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Text(AppConst.kNonewsAvailable),
                                    ),
                            ),
                        providerBase: (searchNewsControllerProvider(result)))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
