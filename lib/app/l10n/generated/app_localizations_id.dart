// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Oryon';

  @override
  String get made_by => 'Saya';

  @override
  String get onboardingTitle1 => 'Tetap terhubung';

  @override
  String get onboardingBody1 =>
      'Jangkau orang yang Anda kerjakan, di mana pun mereka berada.';

  @override
  String get onboardingTitle2 => 'Atur hari Anda';

  @override
  String get onboardingBody2 =>
      'Tugas, catatan, dan pembaruan dalam satu tempat, bukan lima.';

  @override
  String get onboardingTitle3 => 'Lanjut dari mana saja';

  @override
  String get onboardingBody3 =>
      'Setiap perubahan tersinkron secara instan di semua perangkat Anda.';

  @override
  String get onboardingNext => 'Lanjut';

  @override
  String get onboardingGetStarted => 'Mulai';

  @override
  String get navHome => 'Beranda';

  @override
  String get navFeatureA => 'Fitur A';

  @override
  String get navFeatureB => 'Fitur B';

  @override
  String get navAccount => 'Akun';

  @override
  String get authSignIn => 'Masuk';

  @override
  String get authCreateAccount => 'Buat akun';

  @override
  String get authIdentifier => 'Email atau nama pengguna';

  @override
  String get authName => 'Nama lengkap';

  @override
  String get authEmail => 'Email';

  @override
  String get authPhone => 'Nomor telepon';

  @override
  String get authPassword => 'Kata sandi';

  @override
  String get authForgotPassword => 'Lupa kata sandi?';

  @override
  String get authForgotPasswordTitle => 'Atur ulang kata sandi';

  @override
  String get authSendResetCode => 'Kirim kode';

  @override
  String get authResetSent =>
      'Jika akun tersebut ada, kami sudah mengirim kode atur ulang.';

  @override
  String get authVerifyTitle => 'Verifikasi akun';

  @override
  String authVerifySubtitle(String identifier) {
    return 'Masukkan kode yang kami kirim ke $identifier';
  }

  @override
  String get authCode => 'Kode 6 digit';

  @override
  String get authVerify => 'Verifikasi';

  @override
  String get authNoAccount => 'Belum punya akun?';

  @override
  String get authHaveAccount => 'Sudah punya akun?';

  @override
  String get authRequired => 'Wajib diisi';

  @override
  String get authErrorInvalidEmail => 'Format email tidak valid';

  @override
  String get authErrorInvalidPhone => 'Gunakan format +62xxxxxxxxxx';

  @override
  String get authErrorPasswordTooShort => 'Kata sandi minimal 8 karakter';

  @override
  String get authErrorGeneric => 'Terjadi kesalahan. Silakan coba lagi.';

  @override
  String get authErrorInvalidCredentials => 'Email atau kata sandi salah.';

  @override
  String get authErrorTooManyAttempts =>
      'Terlalu banyak percobaan. Coba lagi nanti.';

  @override
  String get authErrorNetwork =>
      'Tidak ada koneksi. Periksa jaringan lalu coba lagi.';

  @override
  String get authMfaUnsupported => 'Login multi-faktor belum didukung.';

  @override
  String get fieldShowPassword => 'Tampilkan kata sandi';

  @override
  String get fieldHidePassword => 'Sembunyikan kata sandi';

  @override
  String get routeErrorTitle => 'Terjadi kesalahan';

  @override
  String get routeErrorMessage =>
      'Halaman ini tidak tersedia. Kembali ke beranda lalu coba lagi.';
}
