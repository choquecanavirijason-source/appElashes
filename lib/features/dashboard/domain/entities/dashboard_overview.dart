import '../../data/models/dashboard_dto.dart';

class DashboardOverview {
  const DashboardOverview({
    required this.clientsTotal,
    required this.activeEmployees,
    required this.appointmentsTotal,
    required this.appointmentsPending,
    required this.appointmentsConfirmed,
    required this.appointmentsCompleted,
    required this.paymentsPaidTotal,
    required this.lowStockItems,
  });

  final int clientsTotal;
  final int activeEmployees;
  final int appointmentsTotal;
  final int appointmentsPending;
  final int appointmentsConfirmed;
  final int appointmentsCompleted;
  final double paymentsPaidTotal;
  final int lowStockItems;

  factory DashboardOverview.fromDto(DashboardOverviewDto dto) =>
      DashboardOverview(
        clientsTotal: dto.cards.clientsTotal,
        activeEmployees: dto.cards.activeEmployees,
        appointmentsTotal: dto.cards.appointmentsTotal,
        appointmentsPending: dto.cards.appointmentsPending,
        appointmentsConfirmed: dto.cards.appointmentsConfirmed,
        appointmentsCompleted: dto.cards.appointmentsCompleted,
        paymentsPaidTotal: dto.cards.paymentsPaidTotal,
        lowStockItems: dto.cards.lowStockItems,
      );

  static const empty = DashboardOverview(
    clientsTotal: 0,
    activeEmployees: 0,
    appointmentsTotal: 0,
    appointmentsPending: 0,
    appointmentsConfirmed: 0,
    appointmentsCompleted: 0,
    paymentsPaidTotal: 0,
    lowStockItems: 0,
  );
}
