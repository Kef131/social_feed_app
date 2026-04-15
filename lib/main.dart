import 'package:flutter/material.dart';
import 'services/service_locator.dart';
import 'styles/styles.dart';
import 'features/features.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // emsire fñutter engine is initialized before any other setup
  setupServiceLocator();
  runApp(const SocialFeedApp());
}

class SocialFeedApp extends StatelessWidget {
  const SocialFeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SocialFeed",
      debugShowCheckedModeBanner: false,

      // M3 Expressive lifht/dark themes
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,

      home: const _ThemePreview(),
    );
  }
}

// Temp screen to verify theme before routing
class _ThemePreview extends StatelessWidget {
  const _ThemePreview();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final lg = theme.extension<LiquidGlassTheme>()!;
    final colors = theme.colorScheme;


    return Scaffold(
      appBar: AppBar(title: const Text("Theme Preview")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // color chips
            Text('Color Scheme', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            _ColorRow(label: 'primary', color: colors.primary),
            _ColorRow(label: 'primaryContainer', color: colors.primaryContainer),
            _ColorRow(label: 'surface', color: colors.surface),
            _ColorRow(label: 'error', color: colors.error),
            const SizedBox(height: 24),

            // Typography
            Text('Typography', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            Text('headlineLarge', style: theme.textTheme.headlineLarge),
            Text('headlineMedium', style: theme.textTheme.headlineMedium),
            Text('titleLarge', style: theme.textTheme.titleLarge),
            Text('bodyLarge', style: theme.textTheme.bodyLarge),
            Text('bodyMedium', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 24),

            // Buttons
            Text('Components', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            FilledButton(onPressed: () {}, child: const Text('FilledButton')),
            const SizedBox(height: 8),
            TextButton(onPressed: () {}, child: const Text('TextButton')),
            const SizedBox(height: 24),
 
            // Input
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
            ),
            const SizedBox(height: 24),

            // Liquid Glass card
            Text('Liquid Glass Surface', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: lg.borderRadius,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: lg.glassColor,
                  borderRadius: lg.borderRadius,
                  border: Border.all(
                    color: lg.glassBorderColor,
                    width: lg.borderWidth,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Liquid Glass Surface\nblurSigma: ${lg.blurSigma}',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ),

            // FeedConfig InheritedWidget demo
            const SizedBox(height: 24),
            Text('InheritedWidget', style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            FeedConfig(
              pageSize: 15,
              child: Builder(
                builder: (innerContext) {
                  final config = FeedConfig.of(innerContext);
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'FeedConfig.of(context).pageSize = ${config.pageSize}',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorRow extends StatelessWidget {
  final String label;
  final Color color;

  const _ColorRow({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black12),
            ),
          ),
          const SizedBox(width: 12),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}