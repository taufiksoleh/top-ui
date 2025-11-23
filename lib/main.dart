import 'package:flutter/material.dart';
import 'package:top_ui/top_ui.dart';

void main() {
  runApp(const TopUIExampleApp());
}

class TopUIExampleApp extends StatelessWidget {
  const TopUIExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top UI Component Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: TopColor.brand600),
        useMaterial3: true,
      ),
      home: const ComponentShowcase(),
    );
  }
}

class ComponentShowcase extends StatefulWidget {
  const ComponentShowcase({super.key});

  @override
  State<ComponentShowcase> createState() => _ComponentShowcaseState();
}

class _ComponentShowcaseState extends State<ComponentShowcase> {
  int _currentPage = 0;
  bool _switchValue = false;
  bool _checkboxValue = false;
  String _radioValue = 'option1';

  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      _buildButtonsPage(),
      _buildInputsPage(),
      _buildMoleculesPage(),
      const RegisterPage(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMV(
        title: 'Top UI Components',
        centerTitle: true,
        actions: [
          IconButton(
            icon: const IconAV(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavMV(
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        items: const [
          BottomNavItem(
            icon: Icons.widgets_outlined,
            activeIcon: Icons.widgets,
            label: 'Atoms',
          ),
          BottomNavItem(
            icon: Icons.input_outlined,
            activeIcon: Icons.input,
            label: 'Inputs',
          ),
          BottomNavItem(
            icon: Icons.view_module_outlined,
            activeIcon: Icons.view_module,
            label: 'Molecules',
          ),
          BottomNavItem(
            icon: Icons.app_registration_outlined,
            activeIcon: Icons.app_registration,
            label: 'Register',
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsPage() {
    return ListView(
      padding: const EdgeInsets.all(TopSpacing.screenPadding),
      children: [
        const TextAV(
          'Buttons',
          variant: TextVariant.headlineSmall,
        ),
        const SizedBox(height: TopSpacing.md),

        // Button variants
        const TextAV('Button Variants', variant: TextVariant.titleMedium),
        const SizedBox(height: TopSpacing.sm),
        const ButtonAV(text: 'Primary Button', variant: ButtonVariant.primary),
        const SizedBox(height: TopSpacing.sm),
        const ButtonAV(text: 'Secondary Button', variant: ButtonVariant.secondary),
        const SizedBox(height: TopSpacing.sm),
        const ButtonAV(text: 'Outline Button', variant: ButtonVariant.outline),
        const SizedBox(height: TopSpacing.sm),
        const ButtonAV(text: 'Ghost Button', variant: ButtonVariant.ghost),
        const SizedBox(height: TopSpacing.sm),
        const ButtonAV(text: 'Danger Button', variant: ButtonVariant.danger),

        const SizedBox(height: TopSpacing.lg),

        // Button sizes
        const TextAV('Button Sizes', variant: TextVariant.titleMedium),
        const SizedBox(height: TopSpacing.sm),
        const ButtonAV(text: 'Small', size: ButtonSize.small),
        const SizedBox(height: TopSpacing.sm),
        const ButtonAV(text: 'Medium', size: ButtonSize.medium),
        const SizedBox(height: TopSpacing.sm),
        const ButtonAV(text: 'Large', size: ButtonSize.large),

        const SizedBox(height: TopSpacing.lg),

        // Badges
        const TextAV('Badges', variant: TextVariant.titleMedium),
        const SizedBox(height: TopSpacing.sm),
        const Wrap(
          spacing: TopSpacing.sm,
          runSpacing: TopSpacing.sm,
          children: [
            BadgeAV(text: 'Primary', variant: BadgeVariant.primary),
            BadgeAV(text: 'Success', variant: BadgeVariant.success),
            BadgeAV(text: 'Warning', variant: BadgeVariant.warning),
            BadgeAV(text: 'Error', variant: BadgeVariant.error),
            BadgeAV(text: 'Neutral', variant: BadgeVariant.neutral),
          ],
        ),

        const SizedBox(height: TopSpacing.lg),

        // Avatars
        const TextAV('Avatars', variant: TextVariant.titleMedium),
        const SizedBox(height: TopSpacing.sm),
        const Row(
          children: [
            AvatarAV(initials: 'JD', size: AvatarSize.small),
            SizedBox(width: TopSpacing.sm),
            AvatarAV(initials: 'AB', size: AvatarSize.medium),
            SizedBox(width: TopSpacing.sm),
            AvatarAV(initials: 'CD', size: AvatarSize.large),
            SizedBox(width: TopSpacing.sm),
            AvatarAV(initials: 'EF', size: AvatarSize.extraLarge),
          ],
        ),

        const SizedBox(height: TopSpacing.lg),

        // Spinner
        const TextAV('Loading Spinners', variant: TextVariant.titleMedium),
        const SizedBox(height: TopSpacing.sm),
        const Row(
          children: [
            SpinnerAV(size: SpinnerSize.small),
            SizedBox(width: TopSpacing.md),
            SpinnerAV(size: SpinnerSize.medium),
            SizedBox(width: TopSpacing.md),
            SpinnerAV(size: SpinnerSize.large),
          ],
        ),
      ],
    );
  }

  Widget _buildInputsPage() {
    return ListView(
      padding: const EdgeInsets.all(TopSpacing.screenPadding),
      children: [
        const TextAV(
          'Form Inputs',
          variant: TextVariant.headlineSmall,
        ),
        const SizedBox(height: TopSpacing.md),

        // Text inputs
        const InputAV(
          label: 'Email',
          placeholder: 'Enter your email',
          helperText: 'We\'ll never share your email',
        ),
        const SizedBox(height: TopSpacing.md),

        const InputAV(
          label: 'Password',
          placeholder: 'Enter your password',
          obscureText: true,
        ),
        const SizedBox(height: TopSpacing.md),

        const InputAV(
          label: 'Error State',
          placeholder: 'This field has an error',
          errorText: 'This field is required',
        ),
        const SizedBox(height: TopSpacing.lg),

        // Checkbox
        const TextAV('Checkbox', variant: TextVariant.titleMedium),
        const SizedBox(height: TopSpacing.sm),
        CheckboxAV(
          value: _checkboxValue,
          onChanged: (value) {
            setState(() {
              _checkboxValue = value ?? false;
            });
          },
          label: 'I agree to terms and conditions',
        ),

        const SizedBox(height: TopSpacing.lg),

        // Radio buttons
        const TextAV('Radio Buttons', variant: TextVariant.titleMedium),
        const SizedBox(height: TopSpacing.sm),
        RadioAV<String>(
          value: 'option1',
          groupValue: _radioValue,
          onChanged: (value) {
            setState(() {
              _radioValue = value ?? 'option1';
            });
          },
          label: 'Option 1',
        ),
        RadioAV<String>(
          value: 'option2',
          groupValue: _radioValue,
          onChanged: (value) {
            setState(() {
              _radioValue = value ?? 'option1';
            });
          },
          label: 'Option 2',
        ),

        const SizedBox(height: TopSpacing.lg),

        // Switch
        const TextAV('Switch', variant: TextVariant.titleMedium),
        const SizedBox(height: TopSpacing.sm),
        SwitchAV(
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
          label: 'Enable notifications',
        ),
      ],
    );
  }

  Widget _buildMoleculesPage() {
    return ListView(
      padding: const EdgeInsets.all(TopSpacing.screenPadding),
      children: [
        const TextAV(
          'Molecule Components',
          variant: TextVariant.headlineSmall,
        ),
        const SizedBox(height: TopSpacing.md),

        // Search bar
        const SearchBarMV(
          placeholder: 'Search components...',
        ),
        const SizedBox(height: TopSpacing.lg),

        // Alerts
        const TextAV('Alerts', variant: TextVariant.titleMedium),
        const SizedBox(height: TopSpacing.sm),
        const AlertMV(
          title: 'Info Alert',
          description: 'This is an informational message',
          variant: AlertVariant.info,
        ),
        const SizedBox(height: TopSpacing.sm),
        const AlertMV(
          title: 'Success Alert',
          description: 'Your changes have been saved',
          variant: AlertVariant.success,
        ),
        const SizedBox(height: TopSpacing.sm),
        const AlertMV(
          title: 'Warning Alert',
          description: 'Please review your input',
          variant: AlertVariant.warning,
        ),
        const SizedBox(height: TopSpacing.sm),
        const AlertMV(
          title: 'Error Alert',
          description: 'Something went wrong',
          variant: AlertVariant.error,
        ),

        const SizedBox(height: TopSpacing.lg),

        // Cards
        const TextAV('Cards', variant: TextVariant.titleMedium),
        const SizedBox(height: TopSpacing.sm),
        CardMV(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextAV(
                'Card Title',
                variant: TextVariant.titleMedium,
              ),
              const SizedBox(height: TopSpacing.sm),
              const TextAV(
                'This is a card component with some content inside. Cards are great for grouping related information.',
                variant: TextVariant.bodyMedium,
              ),
              const SizedBox(height: TopSpacing.md),
              ButtonAV(
                text: 'Action',
                size: ButtonSize.small,
                onPressed: () {},
              ),
            ],
          ),
        ),

        const SizedBox(height: TopSpacing.lg),

        // Chips
        const TextAV('Chips', variant: TextVariant.titleMedium),
        const SizedBox(height: TopSpacing.sm),
        Wrap(
          spacing: TopSpacing.sm,
          runSpacing: TopSpacing.sm,
          children: [
            ChipMV(
              label: 'Flutter',
              onTap: () {},
            ),
            ChipMV(
              label: 'Dart',
              selected: true,
              onTap: () {},
            ),
            ChipMV(
              label: 'Mobile',
              variant: ChipVariant.outlined,
              onTap: () {},
            ),
            ChipMV(
              label: 'Removable',
              onDelete: () {},
            ),
          ],
        ),

        const SizedBox(height: TopSpacing.lg),

        // List items
        const TextAV('List Items', variant: TextVariant.titleMedium),
        const SizedBox(height: TopSpacing.sm),
        CardMV(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              ListItemMV(
                title: 'List Item 1',
                subtitle: 'With subtitle',
                leading: const AvatarAV(
                  initials: 'L1',
                  size: AvatarSize.small,
                ),
                trailing: const IconAV(Icons.chevron_right),
                onTap: () {},
              ),
              const DividerAV(),
              ListItemMV(
                title: 'List Item 2',
                subtitle: 'Another item',
                leading: const AvatarAV(
                  initials: 'L2',
                  size: AvatarSize.small,
                ),
                trailing: const IconAV(Icons.chevron_right),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
