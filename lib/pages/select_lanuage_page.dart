import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_language/bloc/bloc/app_localizations_bloc.dart';
import 'package:flutter_multi_language/enums/language_enum.dart';
import 'package:flutter_multi_language/l10n/app_localizations.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: BlocBuilder<AppLocalizationsBloc, AppLocalizationsState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)!.chooseLanguage,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  shrinkWrap: true,
                  itemCount: Language.values.length,
                  itemBuilder: (context, index) {
                    bool isSelected =
                        state.selectedLanguage == Language.values[index];
                    return ListTile(
                      onTap: () {
                        context.read<AppLocalizationsBloc>().add(
                              ChangeAppLocalizations(
                                selectedLanguage: Language.values[index],
                              ),
                            );
                        Future.delayed(const Duration(milliseconds: 300)).then(
                          (value) {
                            Navigator.pop(context);
                          },
                        );
                      },
                      leading: ClipOval(
                        child: Language.values[index].image
                            .image(height: 30, width: 30),
                      ),
                      title: Text(Language.values[index].text),
                      trailing: isSelected
                          ? Icon(
                              Icons.check_circle,
                              color: Theme.of(context).primaryColor,
                            )
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: isSelected
                            ? BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.5,
                              )
                            : BorderSide(color: Colors.grey.shade300),
                      ),
                      tileColor: isSelected
                          ? Theme.of(context).primaryColor.withOpacity(.05)
                          : null,
                    );
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
