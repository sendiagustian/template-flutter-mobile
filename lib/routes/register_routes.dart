import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import 'items/route_item.dart';

final List<RouteItem> registerRoutes = [
  // Login Route
  const RouteItem(
    path: LoginScreen.path,
    name: LoginScreen.name,
    page: LoginScreen(),
  ),
  // Register Route
  const RouteItem(
    path: RegisterScreen.path,
    name: LoginScreen.name,
    page: RegisterScreen(),
  ),
];
