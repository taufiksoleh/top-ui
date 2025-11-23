# Top UI - Flutter Component Library

A comprehensive Flutter UI component library following Atomic Design Pattern. Save hundreds of hours with production-ready, reusable components.

## Features

- **Atomic Design Pattern**: Components organized as Atoms (AV) and Molecules (MV)
- **Comprehensive Components**: 20+ ready-to-use components
- **Consistent Design System**: Built-in color palette, typography, and spacing
- **Fully Customizable**: Every component is highly configurable
- **Production Ready**: Battle-tested patterns and best practices
- **Type Safe**: Full TypeScript-like type safety with Dart

## Installation

### As a local package

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  top_ui:
    path: ../top-ui
```

### From Git (coming soon)

```yaml
dependencies:
  top_ui:
    git:
      url: https://github.com/taufiksoleh/top-ui.git
```

Then run:

```bash
flutter pub get
```

## Quick Start

Import the library:

```dart
import 'package:top_ui/top_ui.dart';
```

Use components in your app:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarMV(
          title: 'My App',
        ),
        body: Padding(
          padding: const EdgeInsets.all(TopSpacing.md),
          child: Column(
            children: [
              TextAV(
                'Welcome!',
                variant: TextVariant.headlineLarge,
              ),
              SizedBox(height: TopSpacing.md),
              ButtonAV(
                text: 'Get Started',
                variant: ButtonVariant.primary,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Component Library

### Foundation

#### Colors (`TopColor`)

Pre-defined color palette with semantic variants:

```dart
TopColor.brand600    // Primary brand color
TopColor.gray700     // Text colors
TopColor.success500  // Success states
TopColor.error600    // Error states
TopColor.warning500  // Warning states
```

#### Typography (`TopTypography`)

Consistent text styles:

```dart
TopTypography.displayLarge    // 57px, bold
TopTypography.headlineMedium  // 28px, bold
TopTypography.bodyMedium      // 14px, regular
TopTypography.labelLarge      // 14px, medium
```

#### Spacing (`TopSpacing`)

Standardized spacing values:

```dart
TopSpacing.xs     // 4px
TopSpacing.sm     // 8px
TopSpacing.md     // 16px
TopSpacing.lg     // 24px
TopSpacing.xl     // 32px
```

### Atom Components (AV)

#### ButtonAV

Versatile button with multiple variants and sizes.

```dart
ButtonAV(
  text: 'Click Me',
  variant: ButtonVariant.primary,  // primary, secondary, outline, ghost, danger
  size: ButtonSize.medium,         // small, medium, large
  onPressed: () {},
  isLoading: false,
  isFullWidth: false,
  leadingIcon: Icon(Icons.add),
)
```

#### TextAV

Consistent text component.

```dart
TextAV(
  'Hello World',
  variant: TextVariant.bodyMedium,
  color: TopColor.gray900,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)
```

#### InputAV

Form input with validation states.

```dart
InputAV(
  label: 'Email',
  placeholder: 'Enter your email',
  helperText: 'We will never share your email',
  errorText: 'Invalid email',
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
)
```

#### AvatarAV

User avatar with image or initials.

```dart
AvatarAV(
  initials: 'JD',
  size: AvatarSize.medium,    // small, medium, large, extraLarge
  imageUrl: 'https://...',
  onTap: () {},
)
```

#### BadgeAV

Status badges and labels.

```dart
BadgeAV(
  text: 'New',
  variant: BadgeVariant.primary,  // primary, success, warning, error, neutral
  size: BadgeSize.medium,
  icon: Icon(Icons.star, size: 12),
)
```

#### IconAV

Consistent icon sizing.

```dart
IconAV(
  Icons.home,
  size: IconSize.medium,  // small, medium, large, extraLarge
  color: TopColor.brand600,
)
```

#### SpinnerAV

Loading indicator.

```dart
SpinnerAV(
  size: SpinnerSize.medium,  // small, medium, large
  color: TopColor.brand600,
)
```

#### CheckboxAV, RadioAV, SwitchAV

Form selection components.

```dart
CheckboxAV(
  value: isChecked,
  onChanged: (value) {},
  label: 'I agree',
)

RadioAV<String>(
  value: 'option1',
  groupValue: selectedValue,
  onChanged: (value) {},
  label: 'Option 1',
)

SwitchAV(
  value: isEnabled,
  onChanged: (value) {},
  label: 'Enable notifications',
)
```

#### DividerAV

Visual separator.

```dart
DividerAV(
  orientation: DividerOrientation.horizontal,  // horizontal, vertical
  color: TopColor.gray200,
)
```

### Molecule Components (MV)

#### CardMV

Container for grouped content.

```dart
CardMV(
  elevation: CardElevation.low,  // none, low, medium, high
  padding: EdgeInsets.all(16),
  onTap: () {},
  child: Column(
    children: [
      TextAV('Card Title', variant: TextVariant.titleMedium),
      TextAV('Card content...'),
    ],
  ),
)
```

#### SearchBarMV

Search input with clear functionality.

```dart
SearchBarMV(
  placeholder: 'Search...',
  onChanged: (value) {},
  onSubmitted: (value) {},
  showClearButton: true,
)
```

#### ChipMV

Interactive chips for tags and filters.

```dart
ChipMV(
  label: 'Flutter',
  variant: ChipVariant.filled,  // filled, outlined
  selected: true,
  onTap: () {},
  onDelete: () {},  // Shows delete icon
  leadingIcon: Icon(Icons.tag, size: 16),
)
```

#### AlertMV

Alert messages with different severities.

```dart
AlertMV(
  title: 'Success',
  description: 'Your changes have been saved',
  variant: AlertVariant.success,  // info, success, warning, error
  onClose: () {},
  actions: [
    TextButton(child: Text('Action'), onPressed: () {}),
  ],
)
```

#### ListItemMV

List item with leading, title, subtitle, and trailing.

```dart
ListItemMV(
  title: 'Item Title',
  subtitle: 'Item description',
  leading: AvatarAV(initials: 'IT'),
  trailing: IconAV(Icons.chevron_right),
  onTap: () {},
)
```

#### AppBarMV

Customizable app bar.

```dart
AppBarMV(
  title: 'My App',
  centerTitle: true,
  leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
  actions: [
    IconButton(icon: Icon(Icons.search), onPressed: () {}),
  ],
)
```

#### BottomNavMV

Bottom navigation bar.

```dart
BottomNavMV(
  currentIndex: currentIndex,
  onTap: (index) {},
  items: [
    BottomNavItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
      label: 'Home',
    ),
    BottomNavItem(
      icon: Icons.search_outlined,
      activeIcon: Icons.search,
      label: 'Search',
    ),
  ],
)
```

#### TabBarMV

Tab navigation.

```dart
TabBarMV(
  controller: tabController,
  items: [
    TabItem(label: 'Tab 1', icon: Icons.home),
    TabItem(label: 'Tab 2', icon: Icons.search),
  ],
  onTap: (index) {},
)
```

## Design Patterns

### Naming Convention

- **Atom View (AV)**: Basic building blocks (e.g., `ButtonAV`, `TextAV`)
- **Molecule View (MV)**: Composed components (e.g., `CardMV`, `SearchBarMV`)

### Atomic Design Structure

```
lib/
├── foundation/           # Design tokens
│   ├── color.dart
│   ├── typography.dart
│   └── spacing.dart
├── atoms/               # Atomic components (AV)
│   ├── button_av.dart
│   ├── text_av.dart
│   └── ...
├── molecules/           # Molecule components (MV)
│   ├── card_mv.dart
│   ├── search_bar_mv.dart
│   └── ...
└── top_ui.dart         # Main export file
```

## Using in Other Projects

### 1. Add as dependency

```yaml
dependencies:
  top_ui:
    path: path/to/top-ui
```

### 2. Import the library

```dart
import 'package:top_ui/top_ui.dart';
```

### 3. Use components

All components, colors, typography, and spacing are available through a single import!

## Example App

Run the example app to see all components:

```bash
cd top-ui
flutter run
```

The example app showcases all available components with interactive demos.

## Benefits

- **Save Development Time**: Pre-built components eliminate repetitive work
- **Consistent Design**: Unified design system across your entire app
- **Easy Maintenance**: Update once, apply everywhere
- **Best Practices**: Components follow Flutter best practices
- **Fully Customizable**: Override any property to match your brand
- **Type Safe**: Compile-time safety with enums and strong typing

## Contributing

Contributions are welcome! Feel free to submit issues and pull requests.

## License

MIT License - feel free to use in your projects!

## Author

Created by Taufik Soleh

## Support

For issues and questions, please visit the [GitHub repository](https://github.com/taufiksoleh/top-ui).
