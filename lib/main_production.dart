import 'package:flutter_fly/app/app.dart';
import 'package:flutter_fly/bootstrap.dart';

/// This entry point should be used for production only
void main() {
  ///You can override your environment variable in bootstrap method here for providers
  bootstrap(() => const App());
}
