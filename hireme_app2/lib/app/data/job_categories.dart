class JobCategory {
  final String name;
  final String availableJobs;
  final String iconPath;

  JobCategory({
    required this.name,
    required this.availableJobs,
    required this.iconPath,
  });
}

// Data dummy untuk kategori pekerjaan
List<JobCategory> jobCategoriesData = [
  JobCategory(name: 'Design', availableJobs: '235 jobs available', iconPath: 'assets/icons/design_icon.png'),
  JobCategory(name: 'Sales', availableJobs: '756 jobs available', iconPath: 'assets/icons/sales_icon.png'),
  JobCategory(name: 'Marketing', availableJobs: '140 Jobs available', iconPath: 'assets/icons/marketing_icon.png'),
  JobCategory(name: 'Finance', availableJobs: '325 Jobs available', iconPath: 'assets/icons/finance_icon.png'),
  JobCategory(name: 'Technology', availableJobs: '436 Jobs available', iconPath: 'assets/icons/technology_icon.png'),
  JobCategory(name: 'Engineering', availableJobs: '436 Jobs available', iconPath: 'assets/icons/engineering_icon.png'),
  JobCategory(name: 'Business', availableJobs: '436 Jobs available', iconPath: 'assets/icons/business_icon.png'),
  JobCategory(name: 'Human Resources', availableJobs: '436 Jobs available', iconPath: 'assets/icons/hr_icon.png'),
];
