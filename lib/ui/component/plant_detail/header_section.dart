import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      color: Theme.of(  context).primaryColor,
      alignment: Alignment.center,
      child: Text(
        // AppLocalizations.of(context)!.detail,
        "",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}