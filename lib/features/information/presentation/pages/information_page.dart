import 'package:direcrot_mobile_new/core/theme/theme.dart';
import 'package:direcrot_mobile_new/core/common/widgets/loader.dart';
import 'package:direcrot_mobile_new/features/information/presentation/bloc/news_bloc.dart';
import 'package:direcrot_mobile_new/features/information/presentation/widgets/news_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(GetArticles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (BuildContext context, NewsState state) {
          if (state.isLoading) {
            return const Loader();
          }
          if (state.isFailure) {
            return Center(
              child: Text(state.exception ?? ''),
            );
          }
          if (state.isSuccess) {
            return Column(
              children: [
                Container(
                  height: 35.h,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 21.h,
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 33.w, right: 27.w, top: 20.h, bottom: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'info'.tr(),
                          style: AppTheme.mainMediumTextStyle
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 38.w, top: 24.h, bottom: 24.h, right: 24.w),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'news'.tr(),
                            style: AppTheme.mainAppBarTextStyle,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 62,
                              child: Text(
                                'allNews'.tr(),
                                style: AppTheme.mainAppBarSmallTextStyle,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 9.h,
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      itemCount: state.newsArticles.length,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          title: state.newsArticles[index].title ?? '',
                          content: state.newsArticles[index].text ?? '',
                          date:
                              '${state.newsArticles[index].date?.day}.${state.newsArticles[index].date?.month.toString().padLeft(2, '0')}.${state.newsArticles[index].date?.year}',
                          image: state.newsArticles[index].filename ?? '',
                          id: state.newsArticles[index].id ?? '',
                        );
                      }),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
