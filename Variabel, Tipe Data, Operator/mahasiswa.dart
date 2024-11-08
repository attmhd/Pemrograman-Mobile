import 'dart:io';

class Mahasiswa {
  List<Map<String, dynamic>> data = [];

  void addMahasiswa(String nama, String nim, double ipk) {
    data.add({'nama': nama, 'nim': nim, 'ipk': ipk});
  }

  void updateMahasiswa(int index, String nama, String nim, double ipk) {
    if (index >= 0 && index < data.length) {
      data[index] = {'nama': nama, 'nim': nim, 'ipk': ipk};
    }
  }

  void deleteMahasiswa(int index) {
    if (index >= 0 && index < data.length) {
      data.removeAt(index);
    }
  }

  void displayMahasiswa() {
    print("\nID\t|\tNAMA\t|\tNIM\t|\tIPK");
    print("==========================================================");
    for (int i = 0; i < data.length; i++) {
      print("${i + 1}\t|\t${data[i]['nama']}\t|\t${data[i]['nim']}\t|\t${data[i]['ipk']}");
    }
  }
}

double calculateIPK(double tugas, double kehadiran, double uts, double uas) {
  double totalNilai = 0.2 * tugas + 0.1 * kehadiran + 0.3 * uts + 0.4 * uas;
  if (totalNilai >= 90) return 4.0;
  if (totalNilai >= 85) return 3.75;
  if (totalNilai >= 80) return 3.5;
  if (totalNilai >= 75) return 3.25;
  if (totalNilai >= 70) return 3.0;
  if (totalNilai >= 65) return 2.75;
  if (totalNilai >= 55) return 2.5;
  if (totalNilai >= 40) return 2.0;
  if (totalNilai >= 30) return 1.0;
  return 0.0;
}

int getChoice() {
  print("\n SiMahasiswa ");
  print("==========================================================");
  print("1. Entri Data Mahasiswa");
  print("2. Tampilkan Data Mahasiswa");
  print("3. Update Data Mahasiswa");
  print("4. Hapus Data Mahasiswa");
  print("0. Selesai");
  stdout.write("Masukkan pilihan anda 0 - 4 : ");
  return int.tryParse(stdin.readLineSync()!) ?? -1;
}

void main() {
  var mhs = Mahasiswa();
  int choice;

  do {
    choice = getChoice();
    switch (choice) {
      case 1:
        stdout.write("Masukkan jumlah data yang akan diinput : ");
        int n = int.tryParse(stdin.readLineSync()!) ?? 0;
        for (int i = 0; i < n; i++) {
          stdout.write("Masukkan Nama Mahasiswa ke- ${i + 1} : ");
          String nama = stdin.readLineSync()!;
          stdout.write("Masukkan NIM Mahasiswa : ");
          String nim = stdin.readLineSync()!;
          stdout.write("Masukkan Nilai Tugas : ");
          double tugas = double.tryParse(stdin.readLineSync()!) ?? 0;
          stdout.write("Masukkan Nilai Kehadiran : ");
          double kehadiran = double.tryParse(stdin.readLineSync()!) ?? 0;
          stdout.write("Masukkan Nilai UTS : ");
          double uts = double.tryParse(stdin.readLineSync()!) ?? 0;
          stdout.write("Masukkan Nilai UAS : ");
          double uas = double.tryParse(stdin.readLineSync()!) ?? 0;
          double ipk = calculateIPK(tugas, kehadiran, uts, uas);
          mhs.addMahasiswa(nama, nim, ipk);
          print("Input data selesai .....\n");
        }
        break;
      case 2:
        mhs.displayMahasiswa();
        break;
      case 3:
        stdout.write("Masukkan id yang akan di update : ");
        int id = int.tryParse(stdin.readLineSync()!) ?? -1;
        if (id > 0 && id <= mhs.data.length) {
          int index = id - 1;
          stdout.write("Masukkan Nama Mahasiswa : ");
          String nama = stdin.readLineSync()!;
          stdout.write("Masukkan NIM Mahasiswa : ");
          String nim = stdin.readLineSync()!;
          stdout.write("Masukkan Nilai Tugas : ");
          double tugas = double.tryParse(stdin.readLineSync()!) ?? 0;
          stdout.write("Masukkan Nilai Kehadiran : ");
          double kehadiran = double.tryParse(stdin.readLineSync()!) ?? 0;
          stdout.write("Masukkan Nilai UTS : ");
          double uts = double.tryParse(stdin.readLineSync()!) ?? 0;
          stdout.write("Masukkan Nilai UAS : ");
          double uas = double.tryParse(stdin.readLineSync()!) ?? 0;
          double ipk = calculateIPK(tugas, kehadiran, uts, uas);
          mhs.updateMahasiswa(index, nama, nim, ipk);
          print("Data berhasil diupdate...\n");
        } else {
          print("ID yang anda masukkan tidak valid\n");
        }
        break;
      case 4:
        stdout.write("Masukkan id yang akan di hapus : ");
        int id = int.tryParse(stdin.readLineSync()!) ?? -1;
        if (id > 0 && id <= mhs.data.length) {
          mhs.deleteMahasiswa(id - 1);
          print("ID ke- $id berhasil dihapus...\n");
        } else {
          print("ID yang anda masukkan tidak valid\n");
        }
        break;
      case 0:
        print("Program selesai.");
        break;
      default:
        print("Pilihan tidak valid. Silakan coba lagi.");
        break;
    }
  } while (choice != 0);
}
