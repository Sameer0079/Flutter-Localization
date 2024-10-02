import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_language/bloc/bloc/app_localizations_bloc.dart';
import 'package:flutter_multi_language/gen/assets.gen.dart';
import 'package:flutter_multi_language/l10n/app_localizations.dart';
import 'package:flutter_multi_language/pages/components/on_boarding_title.dart';
import 'package:flutter_multi_language/pages/select_lanuage_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Assets.intro.image(),
            ),
            OnBoardingTitle(
              title: AppLocalizations.of(context)!.onboardingTitle,
              subTitle: AppLocalizations.of(context)!.onboardingSubTitle,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50)),
              child: const Text('Start Now'),
            ),
            Text(
              AppLocalizations.of(context)!.haveAccount,
              style: const TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.changeLanguage,
                  style: const TextStyle(fontSize: 18),
                ),
                SizedBox(
                  width: 100,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: OutlinedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => const SelectLanguage(),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(8.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Row(
                          children: [
                            BlocBuilder<AppLocalizationsBloc,
                                AppLocalizationsState>(
                              buildWhen: (previous, current) =>
                                  previous != current,
                              builder: (context, state) {
                                return ClipOval(
                                  child: state.selectedLanguage.image.image(),
                                );
                              },
                            ),
                            const Icon(Icons.arrow_drop_down)
                          ],
                        )),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
