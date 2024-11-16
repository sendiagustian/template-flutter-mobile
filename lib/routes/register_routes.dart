import '../middlewares/middleware.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/wrapper/wrapper_screen.dart';
import 'items/route_item.dart';

final List<RouteItem> registerRoutes = [
  // Middleware Route
  const RouteItem(path: Middleware.path, name: Middleware.name, page: Middleware()),
  // Login Route
  const RouteItem(path: LoginScreen.path, name: LoginScreen.name, page: LoginScreen()),
  // Register Route
  const RouteItem(path: RegisterScreen.path, name: RegisterScreen.name, page: RegisterScreen()),
  // Wrapper Route
  const RouteItem(path: WrapperScreen.path, name: WrapperScreen.name, page: WrapperScreen()),
];
