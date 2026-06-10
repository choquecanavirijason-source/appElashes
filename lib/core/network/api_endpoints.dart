class ApiEndpoints {
  ApiEndpoints._();

  // Auth
  static const String login = '/auth/login';
  static const String me = '/auth/me';
  static const String logout = '/auth/logout';
  static const String refresh = '/auth/refresh';
  static const String register = '/auth/register';
  static const String session = '/auth/session';

  // Clients
  static const String clients = '/clients/';
  static String clientById(int id) => '/clients/$id';

  // Catálogos
  static const String catalogEyeTypes = '/catalogs/eye-types';
  static const String catalogEffects = '/catalogs/effects';
  static const String catalogVolumes = '/catalogs/volumes';
  static const String catalogLashDesigns = '/catalogs/lash-designs';
  static const String catalogQuestionnaires = '/catalogs/questionnaires';

  // Branches
  static const String branches = '/branches/';
  static String branchById(int id) => '/branches/$id';

  // Servicios
  static const String agendaServices = '/agenda/services';
  static String agendaServiceById(int id) => '/agenda/services/$id';
  static const String agendaServiceUploadImage = '/agenda/services/upload-image';
  static const String serviceCategories = '/services/categories';
  static const String agendaClientsForSelect = '/agenda/clients-for-select';
  static const String agendaProfessionalsForSelect =
      '/agenda/professionals-for-select';

  // Citas / tickets
  static const String agendaAppointments = '/agenda/appointments';
  static String agendaAppointmentById(int id) => '/agenda/appointments/$id';
  static const String agendaMobileAvailable =
      '/agenda/appointments/mobile/available';

  // POS sales
  static const String posSales = '/pos-sales/';
  static String posSaleById(int id) => '/pos-sales/$id';
  static String posSaleCancel(int id) => '/pos-sales/$id/cancel';
  static String posSaleReceipt(int id) => '/pos-sales/$id/receipt.pdf';

  // Payments
  static const String payments = '/payments/';

  // Inventory
  static const String inventoryProducts = '/inventory/products';
  static const String inventoryCategories = '/inventory/categories';
  static const String inventoryBatches = '/inventory/batches';
  static const String inventoryMovements = '/inventory/movements';
  static const String inventoryStockSummary = '/inventory/stock-summary';

  // Dashboard / reports
  static const String dashboardOverview = '/dashboard/overview';
  static const String dashboardRevenueSeries = '/dashboard/revenue-series';
  static const String dashboardServiceDistribution =
      '/dashboard/service-distribution';
  static const String dashboardInventoryDistribution =
      '/dashboard/inventory-distribution';

  // Tracking
  static const String tracking = '/tracking/';
  static const String trackingRegister = '/tracking/register';

  // Admin
  static const String adminUsers = '/admin/users';
  static String adminUserById(int id) => '/admin/users/$id';
  static const String adminRoles = '/admin/roles';
  static const String adminPermissions = '/admin/permissions';
}
