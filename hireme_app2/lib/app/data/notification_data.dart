class NotificationCustom {
  final String title; // Judul notifikasi
  final String description; // Isi notifikasi
  final String date; // Tanggal notifikasi
  final String day; // Hari notifikasi
  bool isRead; // Status apakah sudah dibaca

  NotificationCustom({
    required this.title,
    required this.description,
    required this.date,
    required this.day,
    this.isRead = false, // Default belum dibaca
  });
}

List<NotificationCustom> notificationList = [
  NotificationCustom(
    title: 'Job Application Update',
    description: 'Your application for Software Engineer has been accepted!',
    date: 'October 10, 2024',
    day: 'Thursday',
    isRead: false, // Belum dibaca
  ),
  NotificationCustom(
    title: 'Job Interview Invitation',
    description: 'You have been invited for an interview at Creative Studio.',
    date: 'October 8, 2024',
    day: 'Tuesday',
    isRead: true, // Sudah dibaca
  ),
  NotificationCustom(
    title: 'New Job Alert',
    description: 'New job listings in your area: UI/UX Designer in Jakarta.',
    date: 'October 5, 2024',
    day: 'Saturday',
    isRead: false, // Belum dibaca
  ),
];
