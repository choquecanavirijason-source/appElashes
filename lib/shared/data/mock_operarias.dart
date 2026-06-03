import '../../features/operarias/domain/entities/operaria.dart';

const List<Operaria> kMockOperarias = [
  Operaria(
    id: 1,
    nombre: 'Andrea',
    apellido: 'López',
    especialidad: 'Pestañas clásicas',
    calificacion: 4.9,
    activa: true,
    diasDisponibles: ['Lun', 'Mar', 'Mié', 'Jue', 'Vie'],
  ),
  Operaria(
    id: 2,
    nombre: 'Carla',
    apellido: 'Mamani',
    especialidad: 'Pestañas volumen',
    calificacion: 4.8,
    activa: true,
    diasDisponibles: ['Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
  ),
  Operaria(
    id: 3,
    nombre: 'Paula',
    apellido: 'Ríos',
    especialidad: 'Cejas y lifting',
    calificacion: 5.0,
    activa: true,
    diasDisponibles: ['Lun', 'Mié', 'Vie', 'Sáb'],
  ),
  Operaria(
    id: 4,
    nombre: 'Lorena',
    apellido: 'Soto',
    especialidad: 'Microblading',
    calificacion: 4.7,
    activa: true,
    diasDisponibles: ['Jue', 'Vie', 'Sáb'],
  ),
  Operaria(
    id: 5,
    nombre: 'Rocío',
    apellido: 'Aguilar',
    especialidad: 'Pestañas híbridas',
    calificacion: 4.6,
    activa: false,
    diasDisponibles: ['Sáb'],
  ),
];
