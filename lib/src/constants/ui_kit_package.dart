/// Name of this package, for asset lookups made by its own widgets.
///
/// Flutter resolves a bare `assets/...` key against the *root application*, not
/// against the library that wrote it. A widget in this package that renders an
/// asset shipped here must therefore name the package explicitly, otherwise the
/// lookup lands in whichever app embeds the widget and fails in any host that
/// does not happen to carry its own copy of the file.
///
/// Use this only for assets this package actually ships. Where a consuming app
/// is meant to supply its own artwork — app branding, for instance — the bare
/// path is deliberate and must be left alone.
const kUiKitPackage = 'fa_flutter_ui_kit';
