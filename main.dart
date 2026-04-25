import 'package:flutter/material.dart';

void main() {
  runApp(const LahanKuApp());
}

class LahanKuApp extends StatelessWidget {
  const LahanKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedGreen = Color(0xFF2F6B3C);

    return MaterialApp(
      title: 'LahanKu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedGreen,
          primary: seedGreen,
          secondary: const Color(0xFFE8A317),
          surface: const Color(0xFFF7F7F2),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7F1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xFF183A1D),
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Color(0xFFD7DBCE)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Color(0xFFD7DBCE)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: seedGreen, width: 1.5),
          ),
        ),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _BrandBanner(),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2F6B3C), Color(0xFF4D8C4A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Text(
                        'Platform Penyewaan Lahan Pertanian',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'LahanKu membantu petani menemukan lahan, melakukan penyewaan, pembayaran, dan review dalam satu aplikasi.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Fitur Utama',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const _FeatureTile(
                icon: Icons.person_add_alt_1_rounded,
                title: 'Autentikasi & Manajemen Pengguna',
                subtitle:
                    'Registrasi, login, dan pembagian peran antara pelanggan serta pemilik lahan/admin.',
              ),
              const SizedBox(height: 12),
              const _FeatureTile(
                icon: Icons.agriculture_rounded,
                title: 'Manajemen & Informasi Lahan',
                subtitle:
                    'Menampilkan lokasi, luas lahan, jenis tanah, sumber air, harga sewa, dan status ketersediaan.',
              ),
              const SizedBox(height: 12),
              const _FeatureTile(
                icon: Icons.payments_rounded,
                title: 'Penyewaan & Pembayaran',
                subtitle:
                    'Alur transaksi sederhana dari pemilihan lahan, durasi sewa, hingga metode pembayaran.',
              ),
              const SizedBox(height: 12),
              const _FeatureTile(
                icon: Icons.reviews_rounded,
                title: 'Review & Dashboard',
                subtitle:
                    'Ringkasan statistik, ulasan pengguna, dan aktivitas lahan terbaru untuk keputusan yang lebih cepat.',
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  },
                  child: const Text('Masuk ke Aplikasi'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterPage()),
                    );
                  },
                  child: const Text('Daftar Akun Baru'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedRole = 'Pelanggan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Masuk Akun LahanKu')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _BrandBanner(compact: true),
              const SizedBox(height: 20),
              _SectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selamat datang kembali',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Masuk sebagai pelanggan atau admin/pemilik lahan.',
                      style: TextStyle(color: Color(0xFF6B7280), height: 1.5),
                    ),
                    const SizedBox(height: 16),
                    const Text('Email'),
                    const SizedBox(height: 6),
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: 'contoh@email.com'),
                    ),
                    const SizedBox(height: 12),
                    const Text('Password'),
                    const SizedBox(height: 6),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Masukkan password'),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Pilih peran masuk',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: [
                        ChoiceChip(
                          label: const Text('Pelanggan'),
                          selected: selectedRole == 'Pelanggan',
                          onSelected: (_) {
                            setState(() => selectedRole = 'Pelanggan');
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Admin / Pemilik Lahan'),
                          selected: selectedRole == 'Admin',
                          onSelected: (_) {
                            setState(() => selectedRole = 'Admin');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MainShell(role: selectedRole),
                            ),
                          );
                        },
                        child: const Text('Masuk'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegisterPage(),
                            ),
                          );
                        },
                        child: const Text('Belum punya akun? Daftar di sini'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String selectedRole = 'Pelanggan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrasi Pengguna')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _BrandBanner(compact: true),
              const SizedBox(height: 20),
              _SectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Buat akun baru',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Isi data dibawah ini untuk membuat akun baru di LahanKu.',
                      style: TextStyle(color: Color(0xFF6B7280), height: 1.5),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      decoration: InputDecoration(hintText: 'Nama lengkap'),
                    ),
                    const SizedBox(height: 12),
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: 'Email aktif'),
                    ),
                    const SizedBox(height: 12),
                    const TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(hintText: 'Nomor telepon / WhatsApp'),
                    ),
                    const SizedBox(height: 12),
                    const TextField(
                      decoration: InputDecoration(hintText: 'Alamat pengguna'),
                    ),
                    const SizedBox(height: 12),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Password'),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Daftar sebagai',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: [
                        ChoiceChip(
                          label: const Text('Pelanggan'),
                          selected: selectedRole == 'Pelanggan',
                          onSelected: (_) {
                            setState(() => selectedRole = 'Pelanggan');
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Pemilik Lahan / Admin'),
                          selected: selectedRole == 'Admin',
                          onSelected: (_) {
                            setState(() => selectedRole = 'Admin');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MainShell(role: selectedRole),
                            ),
                          );
                        },
                        child: const Text('Daftar dan Masuk'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key, required this.role});

  final String role;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      DashboardPage(role: widget.role),
      const CatalogPage(),
      const TransactionPage(),
      ProfilePage(role: widget.role),
    ];

    final titles = [
      'LahanKu',
      'Katalog Lahan',
      'Penyewaan & Pembayaran',
      'Profil & Ringkasan Sistem',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex]),
        actions: [
          IconButton(
            tooltip: 'Kelola Lahan',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ManagementPage()),
              );
            },
            icon: const Icon(Icons.dashboard_customize_rounded),
          ),
        ],
      ),
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() => currentIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map_rounded),
            label: 'Lahan',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long_rounded),
            label: 'Transaksi',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.role});

  final String role;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 18),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.15,
            children: const [
              _StatsCard(
                title: 'Total Lahan',
                value: '4',
                icon: Icons.landscape_rounded,
                accent: Color(0xFFEAF5E6),
              ),
              _StatsCard(
                title: 'Sewa Aktif',
                value: '3',
                icon: Icons.event_available_rounded,
                accent: Color(0xFFFFF2D9),
              ),
              _StatsCard(
                title: 'Review',
                value: '12',
                icon: Icons.star_rounded,
                accent: Color(0xFFFFEDE8),
              ),
              _StatsCard(
                title: 'Aktor Sistem',
                value: '2',
                icon: Icons.groups_rounded,
                accent: Color(0xFFE9F0FF),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Lahan terbaru',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...demoLands.take(2).map(
            (land) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _RecentLandCard(land: land),
            ),
          ),
          const SizedBox(height: 8),
          _SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Perancangan REST API',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Struktur endpoint yang ditampilkan di bawah menyesuaikan desain sistem pada laporan.',
                  style: TextStyle(color: Color(0xFF6B7280), height: 1.5),
                ),
                const SizedBox(height: 14),
                ...apiEndpoints.map(
                  (endpoint) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _EndpointTile(endpoint: endpoint),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search_rounded),
              hintText: 'Cari lokasi, jenis tanah, atau nama lahan',
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _FilterChip(label: 'Semua Lahan', selected: true),
              _FilterChip(label: 'Tersedia'),
              _FilterChip(label: 'Dekat Kota'),
              _FilterChip(label: 'Harga Terjangkau'),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'Daftar lahan tersedia',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...demoLands.map(
            (land) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _LandCard(
                land: land,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LandDetailPage(land: land),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LandDetailPage extends StatelessWidget {
  const LandDetailPage({super.key, required this.land});

  final Land land;

  @override
  Widget build(BuildContext context) {
    final reviews = demoReviews.where((item) => item.landId == land.id).toList();

    return Scaffold(
      appBar: AppBar(title: Text(land.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF355F39), Color(0xFF6E9F52)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    land.location,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    land.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _HeroBadge(text: land.area),
                      _HeroBadge(text: land.soilType),
                      _HeroBadge(text: land.waterSource),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, color: Color(0xFFFFD66B)),
                      const SizedBox(width: 6),
                      Text(
                        '${land.rating} / 5.0',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        currencyFormat(land.price),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Harga sewa ${land.priceUnit}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi Lahan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    land.description,
                    style: const TextStyle(color: Color(0xFF4B5563), height: 1.55),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children:
                        land.tags.map((tag) => _InfoTag(label: tag)).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Informasi Pemilik',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _DetailRow(label: 'Nama Pemilik', value: land.ownerName),
                  _DetailRow(label: 'Kontak', value: land.ownerPhone),
                  _DetailRow(label: 'Status Lahan', value: land.status),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Review Pelanggan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  ...reviews.map(
                    (review) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _ReviewCard(review: review),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: FilledButton.icon(
          onPressed: land.status == 'Tersedia'
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingPage(land: land),
                    ),
                  );
                }
              : null,
          icon: const Icon(Icons.shopping_bag_rounded),
          label: const Text('Sewa Lahan Ini'),
        ),
      ),
    );
  }
}

class BookingPage extends StatefulWidget {
  const BookingPage({super.key, required this.land});

  final Land land;

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int duration = 7;
  String paymentMethod = 'Transfer Bank';

  int get totalPrice => ((duration / 7) * widget.land.price).round();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Penyewaan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.land.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${widget.land.location} • ${widget.land.area}',
                    style: const TextStyle(color: Color(0xFF6B7280)),
                  ),
                  const SizedBox(height: 14),
                  _DetailRow(
                    label: 'Harga dasar',
                    value: '${currencyFormat(widget.land.price)} / 7 hari',
                  ),
                  const _DetailRow(
                    label: 'Tanggal mulai',
                    value: '14 Februari 2026',
                  ),
                  const _DetailRow(
                    label: 'Tanggal selesai estimasi',
                    value: 'Disesuaikan dengan durasi sewa',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pilih durasi sewa',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [7, 14, 30].map((day) {
                      final selected = duration == day;
                      return ChoiceChip(
                        label: Text('$day hari'),
                        selected: selected,
                        onSelected: (_) => setState(() => duration = day),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Metode pembayaran',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: paymentMethod,
                    items: const [
                      DropdownMenuItem(
                        value: 'Transfer Bank',
                        child: Text('Transfer Bank'),
                      ),
                      DropdownMenuItem(
                        value: 'E-Wallet',
                        child: Text('E-Wallet'),
                      ),
                      DropdownMenuItem(
                        value: 'Virtual Account',
                        child: Text('Virtual Account'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => paymentMethod = value);
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ringkasan pembayaran',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  _DetailRow(label: 'Durasi', value: '$duration hari'),
                  _DetailRow(label: 'Metode', value: paymentMethod),
                  _DetailRow(
                    label: 'Total biaya',
                    value: currencyFormat(totalPrice),
                    highlight: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: FilledButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Penyewaan berhasil dibuat'),
                content: Text(
                  'Pesanan untuk ${widget.land.name} berhasil dicatat dengan total ${currencyFormat(totalPrice)} melalui $paymentMethod.',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text('Tutup'),
                  ),
                ],
              ),
            );
          },
          child: const Text('Konfirmasi Penyewaan'),
        ),
      ),
    );
  }
}

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ringkasan transaksi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 14),
                Row(
                  children: const [
                    Expanded(
                      child: _MiniStats(
                        label: 'Transaksi aktif',
                        value: '3',
                        icon: Icons.task_alt_rounded,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _MiniStats(
                        label: 'Pembayaran lunas',
                        value: '2',
                        icon: Icons.payments_rounded,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Daftar penyewaan',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...demoRentals.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _RentalCard(rental: item),
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Review terbaru setelah sewa',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...demoReviews.take(3).map(
            (review) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _ReviewCard(review: review),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.role});

  final String role;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionCard(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF5E6),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(Icons.person_rounded, size: 30),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pengguna Demo LahanKu',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        role == 'Admin'
                            ? 'Peran aktif: Admin / Pemilik Lahan'
                            : 'Peran aktif: Pelanggan',
                        style: const TextStyle(color: Color(0xFF6B7280)),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Halaman ini merangkum manfaat sistem, tools yang digunakan, dan poin desain utama dari laporan proyek LahanKu.',
                        style: TextStyle(color: Color(0xFF4B5563), height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Tools & Teknologi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _InfoTag(label: 'Flutter'),
              _InfoTag(label: 'Dart'),
              _InfoTag(label: 'Laravel REST API'),
              _InfoTag(label: 'MySQL'),
              _InfoTag(label: 'Postman'),
              _InfoTag(label: 'Git & GitHub'),
              _InfoTag(label: 'Figma'),
              _InfoTag(label: 'VS Code'),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'Manfaat aplikasi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...benefits.map(
            (benefit) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _BenefitTile(text: benefit),
            ),
          ),
          const SizedBox(height: 18),
          _SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Arsitektur Sistem',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                _ArchitectureStep(
                  title: '1. Client Side',
                  subtitle:
                      'Flutter digunakan untuk aplikasi mobile/web yang menampilkan dashboard, katalog lahan, transaksi, dan review.',
                ),
                SizedBox(height: 10),
                _ArchitectureStep(
                  title: '2. Server Side',
                  subtitle:
                      'Laravel menyediakan logika bisnis dan REST API untuk autentikasi, lahan, penyewaan, pembayaran, dan review.',
                ),
                SizedBox(height: 10),
                _ArchitectureStep(
                  title: '3. Database Layer',
                  subtitle:
                      'MySQL menjadi penyimpanan terpusat untuk admin, pelanggan, lahan, penyewaan, pembayaran, dan review.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ManagementPage extends StatefulWidget {
  const ManagementPage({super.key});

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  late final List<Land> managedLands = List<Land>.from(demoLands);

  @override
  Widget build(BuildContext context) {
    final available = managedLands.where((land) => land.status == 'Tersedia').length;

    return Scaffold(
      appBar: AppBar(title: const Text('Panel Kelola Lahan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Modul manajemen data lahan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Halaman ini menyesuaikan kebutuhan fungsional admin/pemilik lahan untuk menambah, mengubah, dan menghapus data lahan.',
                    style: TextStyle(color: Color(0xFF6B7280), height: 1.5),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _MiniStats(
                          label: 'Total lahan',
                          value: managedLands.length.toString(),
                          icon: Icons.grass_rounded,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _MiniStats(
                          label: 'Tersedia',
                          value: available.toString(),
                          icon: Icons.check_circle_rounded,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Form tambah lahan dapat dihubungkan ke API POST /api/lahan.'),
                    ),
                  );
                },
                icon: const Icon(Icons.add_rounded),
                label: const Text('Tambah Lahan Baru'),
              ),
            ),
            const SizedBox(height: 16),
            ...managedLands.map(
              (land) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: _ManagementLandCard(
                  land: land,
                  onEdit: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Edit ${land.name} dapat diarahkan ke PUT /api/lahan/${land.id}.'),
                      ),
                    );
                  },
                  onDelete: () {
                    setState(() {
                      managedLands.remove(land);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${land.name} dihapus dari daftar lokal.'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandBanner extends StatelessWidget {
  const _BrandBanner({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: compact ? 48 : 56,
          height: compact ? 48 : 56,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF5E6),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Center(
            child: Text('🌱', style: TextStyle(fontSize: 28)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'LahanKu',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: compact ? 20 : 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Sewa lahan pertanian lebih mudah',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Color(0xFF6B7280)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MetricChip extends StatelessWidget {
  const _MetricChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF5E6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFF2F6B3C)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(color: Color(0xFF6B7280), height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActorTile extends StatelessWidget {
  const _ActorTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFFB7791F)),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Color(0xFF6B7280), height: 1.45),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: Color(0xFFE6E8DF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: child,
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFDCE8D3)),
      ),
      child: Text('$label • $value'),
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.accent,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: Color(0xFFE6E8DF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon),
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(color: Color(0xFF6B7280))),
          ],
        ),
      ),
    );
  }
}

class _InfoTag extends StatelessWidget {
  const _InfoTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF5E6),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF24532F),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _RecentLandCard extends StatelessWidget {
  const _RecentLandCard({required this.land});

  final Land land;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF5E6),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.agriculture_rounded),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      land.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${land.location} • ${land.area}',
                      style: const TextStyle(color: Color(0xFF6B7280)),
                    ),
                  ],
                ),
              ),
              _AvailabilityBadge(status: land.status),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            land.description,
            style: const TextStyle(color: Color(0xFF4B5563), height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _EndpointTile extends StatelessWidget {
  const _EndpointTile({required this.endpoint});

  final ApiEndpoint endpoint;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAF7),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE1E5DA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF5E6),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  endpoint.method,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  endpoint.path,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            endpoint.description,
            style: const TextStyle(color: Color(0xFF6B7280), height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF2F6B3C) : Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: selected ? const Color(0xFF2F6B3C) : const Color(0xFFD7DBCE),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : const Color(0xFF374151),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _LandCard extends StatelessWidget {
  const _LandCard({required this.land, required this.onPressed});

  final Land land;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF5E6),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(Icons.landscape_rounded),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      land.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      land.location,
                      style: const TextStyle(color: Color(0xFF6B7280)),
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _TinyInfo(text: land.area),
                        _TinyInfo(text: land.soilType),
                        _TinyInfo(text: land.waterSource),
                      ],
                    ),
                  ],
                ),
              ),
              _AvailabilityBadge(status: land.status),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            land.description,
            style: const TextStyle(color: Color(0xFF4B5563), height: 1.5),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currencyFormat(land.price),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'Sewa ${land.priceUnit}',
                      style: const TextStyle(color: Color(0xFF6B7280)),
                    ),
                  ],
                ),
              ),
              FilledButton.tonal(
                onPressed: onPressed,
                child: const Text('Lihat Detail'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroBadge extends StatelessWidget {
  const _HeroBadge({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.16),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    this.highlight = false,
  });

  final String label;
  final String value;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Color(0xFF6B7280)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: highlight ? const Color(0xFF24532F) : const Color(0xFF111827),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review});

  final ReviewItem review;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAF7),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE1E5DA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.account_circle_rounded, size: 32),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '${review.landName} • ${review.date}',
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: List.generate(
                  review.rating,
                  (_) => const Icon(
                    Icons.star_rounded,
                    size: 16,
                    color: Color(0xFFFFC947),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            review.comment,
            style: const TextStyle(color: Color(0xFF4B5563), height: 1.5),
          ),
        ],
      ),
    );
  }
}

class _MiniStats extends StatelessWidget {
  const _MiniStats({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAF7),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE1E5DA)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Color(0xFF6B7280))),
        ],
      ),
    );
  }
}

class _RentalCard extends StatelessWidget {
  const _RentalCard({required this.rental});

  final RentalItem rental;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rental.landName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Kode: ${rental.bookingCode}',
                      style: const TextStyle(color: Color(0xFF6B7280)),
                    ),
                  ],
                ),
              ),
              _AvailabilityBadge(status: rental.status),
            ],
          ),
          const SizedBox(height: 12),
          _DetailRow(label: 'Penyewa', value: rental.customerName),
          _DetailRow(label: 'Periode', value: rental.period),
          _DetailRow(label: 'Metode bayar', value: rental.paymentMethod),
          _DetailRow(label: 'Status bayar', value: rental.paymentStatus),
          _DetailRow(
            label: 'Total biaya',
            value: currencyFormat(rental.totalPrice),
            highlight: true,
          ),
        ],
      ),
    );
  }
}

class _BenefitTile extends StatelessWidget {
  const _BenefitTile({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF5E6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.check_rounded, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Color(0xFF4B5563), height: 1.55),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArchitectureStep extends StatelessWidget {
  const _ArchitectureStep({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
            color: Color(0xFF2F6B3C),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: Color(0xFF6B7280), height: 1.45),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ManagementLandCard extends StatelessWidget {
  const _ManagementLandCard({
    required this.land,
    required this.onEdit,
    required this.onDelete,
  });

  final Land land;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  land.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _AvailabilityBadge(status: land.status),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${land.location} • ${land.area} • ${currencyFormat(land.price)}',
            style: const TextStyle(color: Color(0xFF6B7280)),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit_rounded),
                  label: const Text('Edit'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.tonalIcon(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outline_rounded),
                  label: const Text('Hapus'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AvailabilityBadge extends StatelessWidget {
  const _AvailabilityBadge({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final available = status.toLowerCase().contains('tersedia') ||
        status.toLowerCase().contains('aktif') ||
        status.toLowerCase().contains('lunas');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: available ? const Color(0xFFEAF5E6) : const Color(0xFFFFF1E2),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: available ? const Color(0xFF24532F) : const Color(0xFF9A5B13),
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _TinyInfo extends StatelessWidget {
  const _TinyInfo({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F5EE),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}

class Land {
  const Land({
    required this.id,
    required this.name,
    required this.location,
    required this.area,
    required this.soilType,
    required this.waterSource,
    required this.price,
    required this.priceUnit,
    required this.description,
    required this.status,
    required this.ownerName,
    required this.ownerPhone,
    required this.rating,
    required this.tags,
  });

  final String id;
  final String name;
  final String location;
  final String area;
  final String soilType;
  final String waterSource;
  final int price;
  final String priceUnit;
  final String description;
  final String status;
  final String ownerName;
  final String ownerPhone;
  final double rating;
  final List<String> tags;
}

class ReviewItem {
  const ReviewItem({
    required this.landId,
    required this.landName,
    required this.userName,
    required this.comment,
    required this.rating,
    required this.date,
  });

  final String landId;
  final String landName;
  final String userName;
  final String comment;
  final int rating;
  final String date;
}

class RentalItem {
  const RentalItem({
    required this.bookingCode,
    required this.landName,
    required this.customerName,
    required this.period,
    required this.totalPrice,
    required this.status,
    required this.paymentMethod,
    required this.paymentStatus,
  });

  final String bookingCode;
  final String landName;
  final String customerName;
  final String period;
  final int totalPrice;
  final String status;
  final String paymentMethod;
  final String paymentStatus;
}

class ApiEndpoint {
  const ApiEndpoint({
    required this.method,
    required this.path,
    required this.description,
  });

  final String method;
  final String path;
  final String description;
}

const mvpFeatures = [
  'Registrasi Pengguna',
  'Login Pengguna',
  'Melihat Data Lahan',
  'Detail Lahan',
  'Penyewaan Lahan',
  'Pembayaran Sewa',
  'Pengelolaan Lahan',
  'Review Lahan',
];

const benefits = [
  'Mempermudah pemilik lahan dan masyarakat untuk mempertemukan kebutuhan penyewaan lahan pertanian melalui platform digital.',
  'Membantu pemilik lahan memanfaatkan lahan yang belum digunakan secara optimal sehingga dapat menghasilkan pendapatan tambahan.',
  'Memberikan kesempatan bagi masyarakat yang ingin bertani namun tidak memiliki lahan untuk menemukan lahan sesuai kebutuhan.',
  'Meningkatkan efisiensi pencarian, pemilihan, dan penyewaan lahan melalui informasi yang lengkap dan mudah diakses.',
];

const apiEndpoints = [
  ApiEndpoint(
    method: 'POST',
    path: '/api/register',
    description: 'Pendaftaran akun pengguna baru.',
  ),
  ApiEndpoint(
    method: 'GET',
    path: '/api/lahan',
    description: 'Menampilkan seluruh data lahan yang tersedia.',
  ),
  ApiEndpoint(
    method: 'POST',
    path: '/api/penyewaan',
    description: 'Membuat transaksi penyewaan lahan baru.',
  ),
  ApiEndpoint(
    method: 'POST',
    path: '/api/pembayaran',
    description: 'Mencatat data pembayaran penyewaan lahan.',
  ),
  ApiEndpoint(
    method: 'POST',
    path: '/api/review',
    description: 'Menyimpan review dan penilaian pelanggan.',
  ),
];

const demoLands = [
  Land(
    id: 'LH001',
    name: 'Lahan Pertanian Surabaya',
    location: 'Surabaya',
    area: '500 m²',
    soilType: 'Lempung',
    waterSource: 'Sumur',
    price: 500000,
    priceUnit: 'per 7 hari',
    description:
        'Lahan cocok untuk pertanian hortikultura dengan akses jalan yang mudah dan area tanam yang siap digunakan.',
    status: 'Tersedia',
    ownerName: 'Subarjo',
    ownerPhone: '081234567890',
    rating: 4.8,
    tags: ['Hortikultura', 'Akses Jalan Mudah', 'Dekat Pasar'],
  ),
  Land(
    id: 'LH002',
    name: 'Kebun Organik Sidoarjo',
    location: 'Sidoarjo',
    area: '750 m²',
    soilType: 'Humus',
    waterSource: 'Irigasi',
    price: 650000,
    priceUnit: 'per 7 hari',
    description:
        'Lahan organik dengan sistem irigasi aktif, cocok untuk sayuran hijau dan tanaman musiman berumur pendek.',
    status: 'Tersedia',
    ownerName: 'Bu Ratna',
    ownerPhone: '081287654321',
    rating: 4.9,
    tags: ['Organik', 'Irigasi Aktif', 'Tanah Subur'],
  ),
  Land(
    id: 'LH003',
    name: 'Sawah Produktif Gresik',
    location: 'Gresik',
    area: '1000 m²',
    soilType: 'Aluvial',
    waterSource: 'Saluran Tersier',
    price: 800000,
    priceUnit: 'per 7 hari',
    description:
        'Area sawah luas dengan akses air stabil dan cocok untuk padi maupun tanaman pangan lainnya.',
    status: 'Disewa',
    ownerName: 'Pak Hadi',
    ownerPhone: '082233445566',
    rating: 4.7,
    tags: ['Sawah', 'Akses Air Stabil', 'Lahan Luas'],
  ),
  Land(
    id: 'LH004',
    name: 'Lahan Jagung Lamongan',
    location: 'Lamongan',
    area: '900 m²',
    soilType: 'Regosol',
    waterSource: 'Pompa Air',
    price: 720000,
    priceUnit: 'per 7 hari',
    description:
        'Lahan dengan karakter tanah yang baik untuk jagung, cabai, dan tanaman palawija.',
    status: 'Tersedia',
    ownerName: 'Pak Mahmud',
    ownerPhone: '085711112222',
    rating: 4.6,
    tags: ['Palawija', 'Dekat Jalan Raya', 'Pompa Air'],
  ),
];

const demoReviews = [
  ReviewItem(
    landId: 'LH001',
    landName: 'Lahan Pertanian Surabaya',
    userName: 'Andi',
    comment: 'Lahan sangat baik dan cocok untuk bercocok tanam. Proses penyewaan juga cepat.',
    rating: 5,
    date: '12 Feb 2026',
  ),
  ReviewItem(
    landId: 'LH001',
    landName: 'Lahan Pertanian Surabaya',
    userName: 'Nina',
    comment: 'Lokasi strategis dan pemilik lahan responsif saat dihubungi.',
    rating: 4,
    date: '18 Feb 2026',
  ),
  ReviewItem(
    landId: 'LH002',
    landName: 'Kebun Organik Sidoarjo',
    userName: 'Bima',
    comment: 'Irigasinya bagus, cocok untuk kebutuhan tanam sayuran organik.',
    rating: 5,
    date: '20 Feb 2026',
  ),
  ReviewItem(
    landId: 'LH004',
    landName: 'Lahan Jagung Lamongan',
    userName: 'Salsa',
    comment: 'Harga terjangkau dan kondisi lahan sesuai deskripsi di aplikasi.',
    rating: 4,
    date: '24 Feb 2026',
  ),
];

const demoRentals = [
  RentalItem(
    bookingCode: 'SEWA001',
    landName: 'Lahan Pertanian Surabaya',
    customerName: 'Andi',
    period: '14 Feb 2026 - 21 Feb 2026',
    totalPrice: 500000,
    status: 'Aktif',
    paymentMethod: 'Transfer Bank',
    paymentStatus: 'Lunas',
  ),
  RentalItem(
    bookingCode: 'SEWA002',
    landName: 'Kebun Organik Sidoarjo',
    customerName: 'Bima',
    period: '17 Feb 2026 - 24 Feb 2026',
    totalPrice: 650000,
    status: 'Aktif',
    paymentMethod: 'E-Wallet',
    paymentStatus: 'Lunas',
  ),
  RentalItem(
    bookingCode: 'SEWA003',
    landName: 'Sawah Produktif Gresik',
    customerName: 'Fajar',
    period: '20 Feb 2026 - 27 Feb 2026',
    totalPrice: 800000,
    status: 'Menunggu',
    paymentMethod: 'Virtual Account',
    paymentStatus: 'Belum Bayar',
  ),
];

String currencyFormat(int value) {
  final text = value.toString();
  final buffer = StringBuffer();

  for (int index = 0; index < text.length; index++) {
    final positionFromEnd = text.length - index;
    buffer.write(text[index]);
    if (positionFromEnd > 1 && positionFromEnd % 3 == 1) {
      buffer.write('.');
    }
  }

  return 'Rp $buffer';
}