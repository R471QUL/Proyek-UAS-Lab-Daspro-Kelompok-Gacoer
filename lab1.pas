program AnggaranBelanjaMahasiswa;
uses crt;

const
  BATAS_HARIAN = 50000;
  MAX_ITEM = 10;

type
  TBelanja = record // untuk menyimpan data satu item belanja
    namaItem: string;
    harga: longint;
  end;

var
  daftarBelanja: array[1..MAX_ITEM] of TBelanja; // untuk penyimpanan semua item
  jumlahItem, i: integer;
  totalBelanja, sisa: longint;
  pilihan, ulang: char;

procedure InputBelanja; // untuk menginput satu item belanja baru
begin
  inc(jumlahItem);
  write('Nama barang: ');
  readln(daftarBelanja[jumlahItem].namaItem);
  write('Harga (Rp): ');
  readln(daftarBelanja[jumlahItem].harga);
end;

function HitungTotal: longint; // untuk menghitung total semua belanja
var
  total: longint;
  idx: integer;
begin
  total := 0;
  for idx := 1 to jumlahItem do
    total := total + daftarBelanja[idx].harga;
  HitungTotal := total;
end;

procedure TampilHasil; // untuk menampilkan hasil rekap belanja
begin
  writeln;
  writeln('=== DAFTAR BELANJA ===');
  for i := 1 to jumlahItem do
    writeln(i, '. ', daftarBelanja[i].namaItem, ' - Rp', daftarBelanja[i].harga);
  
  totalBelanja := HitungTotal;
  writeln('----------------------');
  writeln('Total: Rp', totalBelanja);
  writeln;
  
  if totalBelanja > BATAS_HARIAN then
    writeln('PERINGATAN: Belanja melebihi batas Rp50.000!')
  else
  begin
    sisa := BATAS_HARIAN - totalBelanja;
    writeln('Wah duit sisanya Rp', sisa, ' simpan ke tabungan aja ya!');
  end;
end;

{ Program utama }
begin
  repeat
    clrscr;
    jumlahItem := 0; { Reset jumlah item }
    
    writeln('=== SISTEM ANGGARAN BELANJA MAHASISWA ===');
    writeln('Batas harian: Rp50.000');
    writeln;
    
    repeat
      InputBelanja;
      write('Tambah lagi? (y/t): ');
      readln(pilihan);
    until (pilihan = 't') or (jumlahItem >= MAX_ITEM);
    
    TampilHasil;
    
    writeln;
    write('Mau catat belanja baru? (y/t): ');
    readln(ulang);
    
  until ulang = 't'; { Keluar jika user ketik 'n' }
  
  writeln;
  writeln('Terima kasih! Hemat pangkal kaya ya!');
  readln;
end.