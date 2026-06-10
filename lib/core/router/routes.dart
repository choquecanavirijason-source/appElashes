/// Rutas declaradas como constantes — nunca usar strings sueltos en
/// `context.go(...)` ni en `GoRoute(path: ...)`.
class AppRoutes {
  AppRoutes._();

  // Públicas
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';

  // Privadas (shell)
  static const String shell = '/';
  static const String dashboard = '/dashboard';
  static const String mensajes = '/mensajes';
  static const String servicios = '/servicios';
  static const String ventas = '/ventas';
  static const String chatIa = '/chat/ia';
  static String chatWhatsApp(int clienteId) => '/chat/whatsapp/$clienteId';

  static const String clients = '/clients';
  static const String effects = '/effects';
  static const String eyeTypes = '/eye-types';
  static const String designs = '/designs';
  static const String lashDesigns = '/lash-designs';
  static const String volumen = '/volumen';
  static const String users = '/users';
  static const String settings = '/settings';
  static const String questionnaire = '/questionnaire';
  static const String lashTracking = '/lash-tracking';

  static const String adminProducts = '/admin/products';
  static const String adminSalons = '/admin/salons';
  static const String adminServices = '/admin/services';
  static const String adminServicesQueue = '/admin/services/queue';
  static const String adminTurns = '/admin/turns';
  static const String adminTickets = '/admin/tickets';
  static const String adminTicketsFinalizados = '/admin/tickets/finalizados';
  static const String adminCalendar = '/admin/calendar';
  static const String adminCalendarAgenda = '/admin/calendar/agenda';
  static const String adminPos = '/admin/pos';
  static const String adminPosHistory = '/admin/pos/history';
  static const String adminPosTracking = '/admin/pos-tracking';
}
