class Job {
  final String position; // Posisi yang ditawarkan
  final String companyName; // Nama perusahaan
  final String location; // Lokasi perusahaan
  final String companyLogoPath; // Path gambar logo perusahaan
  final String jobType; // Lama kerja, misalnya full-time, part-time
  final List<String> categories; // Kategori, misalnya Marketing, Design
  final JobDetails jobDetails; // Detail pekerjaan dan perusahaan
  bool isApplied; // Apakah pekerjaan sudah dilamar
  String applyStatus; // Status aplikasi (accepted, inProcess, cancelled)
  bool isRecommended; // Apakah pekerjaan ini direkomendasikan
  bool isSaved; // Apakah pekerjaan ini sudah disimpan

  Job({
    required this.position,
    required this.companyName,
    required this.location,
    required this.companyLogoPath,
    required this.jobType,
    required this.categories,
    required this.jobDetails,
    this.isApplied = false, // Default: pekerjaan belum dilamar
    this.applyStatus = 'inProcess', // Default: aplikasi dalam proses
    this.isRecommended = false, // Default: tidak direkomendasikan
    this.isSaved = false, // Default: pekerjaan belum disimpan
  });
}

class JobDetails {
  final String jobDescription; // Deskripsi pekerjaan
  final List<String> requirements; // Persyaratan pekerjaan
  final String location; // Lokasi
  final List<String> facilities; // Fasilitas yang ditawarkan
  final CompanyDetails companyDetails; // Detail perusahaan

  JobDetails({
    required this.jobDescription,
    required this.requirements,
    required this.location,
    required this.facilities,
    required this.companyDetails,
  });
}

class CompanyDetails {
  final String aboutCompany; // Tentang perusahaan
  final String website; // Website perusahaan
  final String industry; // Industri tempat perusahaan berada
  final List<String> companyGalleryPaths; // Path gambar galeri perusahaan

  CompanyDetails({
    required this.aboutCompany,
    required this.website,
    required this.industry,
    required this.companyGalleryPaths,
  });
}

List<Job> jobList = [
  // 1. Kategori: Design
  Job(
    position: 'UI/UX Designer',
    companyName: 'Creative Studio',
    location: 'Jakarta, Indonesia',
    companyLogoPath: 'assets/images/logo_creative_studio.png',
    jobType: 'Full-time',
    categories: ['Design'],
    jobDetails: JobDetails(
      jobDescription: 'We are looking for a talented UI/UX Designer...',
      requirements: [
        'Bachelor’s degree in Design or related field',
        '2+ years of experience in UI/UX Design',
        'Proficiency in design tools like Figma, Sketch',
      ],
      location: 'Jakarta, Indonesia',
      facilities: ['Health Insurance', 'Remote Work', 'Paid Time Off'],
      companyDetails: CompanyDetails(
        aboutCompany: 'Creative Studio is a leading design agency...',
        website: 'https://creativestudio.com',
        industry: 'Creative Industry',
        companyGalleryPaths: [
          'assets/images/gallery1.jpg',
          'assets/images/gallery2.jpg',
        ],
      ),
    ),
    isApplied: true,
    applyStatus: 'inProcess',
    isRecommended: true,
    isSaved: true, // Marked as saved
  ),

  // 2. Kategori: Sales
  Job(
    position: 'Sales Executive',
    companyName: 'Sales Corp',
    location: 'Jakarta, Indonesia',
    companyLogoPath: 'assets/images/logo_sales_corp.png',
    jobType: 'Full-time',
    categories: ['Sales'],
    jobDetails: JobDetails(
      jobDescription: 'We are looking for a Sales Executive to join our team...',
      requirements: [
        'Bachelor’s degree in Sales or Business',
        'Excellent communication and negotiation skills',
      ],
      location: 'Jakarta, Indonesia',
      facilities: ['Commission', 'Health Insurance', 'Car Allowance'],
      companyDetails: CompanyDetails(
        aboutCompany: 'Sales Corp is a top sales company...',
        website: 'https://salescorp.com',
        industry: 'Sales Industry',
        companyGalleryPaths: [
          'assets/images/gallery1.jpg',
          'assets/images/gallery2.jpg',
        ],
      ),
    ),
    isApplied: false,
    applyStatus: 'inProcess',
    isRecommended: true,
    isSaved: false, // Not saved yet
  ),

  // 3. Kategori: Marketing
  Job(
    position: 'Digital Marketing Specialist',
    companyName: 'Marketing Pro',
    location: 'Surabaya, Indonesia',
    companyLogoPath: 'assets/images/logo_marketing_pro.jpg',
    jobType: 'Part-time',
    categories: ['Marketing'],
    jobDetails: JobDetails(
      jobDescription: 'We are looking for a passionate Digital Marketing Specialist...',
      requirements: [
        'Experience with Google Ads, Facebook Ads',
        'Analytical mindset for measuring campaign performance',
        'Excellent communication skills',
      ],
      location: 'Surabaya, Indonesia',
      facilities: ['Flexible Working Hours', 'Performance Bonus'],
      companyDetails: CompanyDetails(
        aboutCompany: 'Marketing Pro is a leading digital marketing agency...',
        website: 'https://marketingpro.com',
        industry: 'Marketing Industry',
        companyGalleryPaths: [
          'assets/images/gallery1.jpg',
          'assets/images/gallery2.jpg',
        ],
      ),
    ),
    isApplied: true,
    applyStatus: 'accepted',
    isRecommended: true,
    isSaved: true, // Saved
  ),

  // 4. Kategori: Finance, Business
  Job(
    position: 'Finance Manager',
    companyName: 'FinanceTech',
    location: 'Bandung, Indonesia',
    companyLogoPath: 'assets/images/logo_finance_tech.png',
    jobType: 'Full-time',
    categories: ['Finance', 'Business'],
    jobDetails: JobDetails(
      jobDescription: 'We are looking for an experienced Finance Manager...',
      requirements: [
        'Bachelor’s degree in Finance or Accounting',
        '5+ years of experience in financial management',
        'Strong analytical and decision-making skills',
      ],
      location: 'Bandung, Indonesia',
      facilities: ['Health Insurance', 'Retirement Plan', 'Paid Time Off'],
      companyDetails: CompanyDetails(
        aboutCompany: 'FinanceTech is a leading fintech company...',
        website: 'https://financetech.com',
        industry: 'Financial Services',
        companyGalleryPaths: [
          'assets/images/gallery1.jpg',
          'assets/images/gallery2.jpg',
        ],
      ),
    ),
    isApplied: true,
    applyStatus: 'cancelled', // Application canceled
    isSaved: false, // Not saved
  ),

  // 5. Kategori: Technology, Engineering
  Job(
    position: 'Software Engineer',
    companyName: 'Tech Solutions',
    location: 'Jakarta, Indonesia',
    companyLogoPath: 'assets/images/logo_tech_solutions.png',
    jobType: 'Full-time',
    categories: ['Technology', 'Engineering'],
    jobDetails: JobDetails(
      jobDescription: 'Looking for an experienced Software Engineer to develop scalable software...',
      requirements: [
        'Bachelor’s degree in Computer Science or related field',
        'Proficiency in Java, Python, or C++',
        'Experience with cloud services like AWS or Azure',
      ],
      location: 'Jakarta, Indonesia',
      facilities: ['Health Insurance', 'Stock Options', 'Remote Work'],
      companyDetails: CompanyDetails(
        aboutCompany: 'Tech Solutions is a global leader in technology solutions...',
        website: 'https://techsolutions.com',
        industry: 'Technology',
        companyGalleryPaths: [
          'assets/images/gallery1.jpg',
          'assets/images/gallery2.jpg',
        ],
      ),
    ),
    isApplied: false,
    applyStatus: 'inProcess',
    isSaved: true, // Saved
  ),

  // 6. Kategori: Business, Sales
  Job(
    position: 'Business Development Manager',
    companyName: 'BizGrowth',
    location: 'Jakarta, Indonesia',
    companyLogoPath: 'assets/images/logo_bizgrowth.jpg',
    jobType: 'Full-time',
    categories: ['Business', 'Sales'],
    jobDetails: JobDetails(
      jobDescription: 'We are looking for a Business Development Manager to help us grow...',
      requirements: [
        'Bachelor’s degree in Business Administration or related field',
        'Experience in business strategy and sales',
        'Excellent leadership and communication skills',
      ],
      location: 'Jakarta, Indonesia',
      facilities: ['Health Insurance', 'Travel Allowance', 'Commission'],
      companyDetails: CompanyDetails(
        aboutCompany: 'BizGrowth is a consulting firm specializing in business growth strategies...',
        website: 'https://bizgrowth.com',
        industry: 'Consulting',
        companyGalleryPaths: [
          'assets/images/gallery1.jpg',
          'assets/images/gallery2.jpg',
        ],
      ),
    ),
    isApplied: true,
    applyStatus: 'accepted', // Application accepted
    isSaved: false, // Not saved
  ),

  // 7. Kategori: Human Resources, Business
  Job(
    position: 'HR Manager',
    companyName: 'HumanTech',
    location: 'Surabaya, Indonesia',
    companyLogoPath: 'assets/images/logo_humantech.jpg',
    jobType: 'Full-time',
    categories: ['Human Resources', 'Business'],
    jobDetails: JobDetails(
      jobDescription: 'We are looking for an experienced HR Manager to lead our human resources department...',
      requirements: [
        'Bachelor’s degree in Human Resources or Business',
        'Experience with HR software systems',
        'Excellent interpersonal and organizational skills',
      ],
      location: 'Surabaya, Indonesia',
      facilities: ['Health Insurance', 'Paid Time Off', 'Retirement Plan'],
      companyDetails: CompanyDetails(
        aboutCompany: 'HumanTech is a leading HR technology company...',
        website: 'https://humantech.com',
        industry: 'Human Resources',
        companyGalleryPaths: [
          'assets/images/gallery1.jpg',
          'assets/images/gallery2.jpg',
        ],
      ),
    ),
    isApplied: true,
    applyStatus: 'inProcess',
    isSaved: true, // Saved
  ),
];
