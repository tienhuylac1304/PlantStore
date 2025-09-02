import 'package:flutter/material.dart';
import 'package:plant_store/commons/app_theme.dart';
import 'package:plant_store/model/plant.dart';
import 'package:plant_store/supabase_config.dart';
import 'package:plant_store/ui/component/app_bottom_navigation.dart';
import 'package:plant_store/ui/pages/plant_detail_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// Generated localization

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseConfig.url,
    anonKey: SupabaseConfig.anonKey,
  );

  runApp(const PlantStoreApp());
}

class PlantStoreApp extends StatelessWidget {
  const PlantStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Plant Store",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,

      // --- Localization setup ---
      localizationsDelegates: const [
        AppLocalizations.delegate, // Generated delegate
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        // Nếu ngôn ngữ hệ thống được hỗ trợ thì dùng, không thì fallback
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },

      // --- Navigation ---
      initialRoute: '/',
      routes: {
        '/': (context) => const MainNavigation(),
        '/plant': (context) => const PlantDetailPage(),
      },
    );
  }
}
