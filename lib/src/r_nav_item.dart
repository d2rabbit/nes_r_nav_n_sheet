part of '../r_nav_n_sheet.dart';

/// [BottomNavigationBarItem] (bottom navigation bar items) for [RNavNSheet]
class RNavItem {
  /// Icon when item is not selected
  final IconItem icon;

  /// Icon when item is  selected
  final IconItem activeIcon;

  /// Label of the item
  final String label;

  const RNavItem({
    required this.icon,
    required this.label,
    required this.activeIcon,
  });
}

class _RNavItem extends StatelessWidget {
  final IconItem icon;
  final IconItem activeIcon;
  final String label;
  final EdgeInsets? padding;
  final bool selected;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Gradient? selectedItemGradient;
  final Gradient? unselectedItemGradient;
  final bool hide;
  final VoidCallback? onTap;

  const _RNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.activeIcon,
    this.padding,
    this.selected = false,
    this.onTap,
    this.hide = false,
    this.selectedItemColor,
    this.selectedItemGradient,
    this.unselectedItemColor,
    this.unselectedItemGradient,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var color =
        selected ? selectedItemColor : unselectedItemColor ?? theme.hintColor;
    var gradient = selected
        ? selectedItemGradient ??
            LinearGradient(
              colors: [
                theme.colorScheme.secondary,
                theme.colorScheme.secondary.withOpacity(0.9),
                theme.colorScheme.secondary.withOpacity(0.1),
                theme.iconTheme.color!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
        : unselectedItemGradient ??
            LinearGradient(
              colors: [
                theme.hintColor,
                theme.canvasColor,
                theme.hintColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            );

    var widget = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: selected ? activeIcon : icon,
        ),
        const SizedBox(height: 5),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: (theme.textTheme.bodyMedium ?? const TextStyle()).copyWith(
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            fontSize: selected ? 11 : 10,
          ),
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: color,
            ),
          ),
        ),
      ],
    );
    var shader = ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: widget,
    );
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        alignment: Alignment.center,
        child: SizedBox(
          height: hide ? 0.0 : null,
          child: InkResponse(
            onTap: onTap,
            child: selectedItemColor == null ? shader : widget,
          ),
        ),
      ),
    );
  }
}

class IconItem extends StatelessWidget {
  const IconItem({super.key, this.icon});

  final icon;

  static IconItem iconItem(var icon) {
    return IconItem(icon: icon);
  }

  @override
  Widget build(BuildContext context) {
    var iconItem;
    if (icon is NesIconData) {
      iconItem = NesIcon(iconData: icon);
    } else if (icon is IconData) {
      iconItem = Icon(icon);
    }else {
      iconItem = icon;
    }
    return Center(child: iconItem);
  }
}
