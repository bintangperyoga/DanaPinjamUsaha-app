{
    $Id: gplprog.pt,v 1.2 2002/09/07 15:40:47 peter Exp 2016/11/21 15:14:16 peter Exp $
    This file is part of 1
    Copyright (c) 2016 by bp



    See the file COPYING.FPC, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 **********************************************************************}
program percobaan1;

uses crt;

type
	Profil = record
	Nama	: string;
	JU	: string;
	BPinjam	: real;
	Username: string;
	end;
        tabNasabah = array [1..100] of Profil;

 type
	waktuPinjam = record
	Tanggal		: integer;
	Bulan		: integer;
	Tahun		: integer;
	end;
        tabWaktu = array [1..100] of waktuPinjam;

{VAR GLOBAL}
var
        Nasabah         : tabNasabah;
        Waktu           : tabWaktu;
        i,k             : integer;
        login           : integer;
        pilihan         : char;
        z,nama          : string;
        setor           : LongInt;
        Tenggat_Waktu   : real;
        selesai         : boolean;


procedure tampilan3;
  {I.S: procedure menampilkan menu yang dapat dipilih oleh Nasabah
   F.S: Nasabah dapat memilih menu tersebut}
begin
        clrscr;
        writeln('selamat datang bpk/ibu ', Nasabah[i].Nama);
	writeln('1. Ingin Setor');
	writeln('2. Sisa Pinjaman');
	writeln('3. Sisa Waktu');
	writeln('4. Tutup Akun?');
	writeln('5. Logout');
        writeln('------------------');
        writeln('silahkan pilih');
end;


function cekUsername2b : boolean;
 {I.S: function mendapat username dari Nasabah
  F.S: function melakukan pengecekan username yang tersedia}
var
        j : integer;
begin
        j:=1;
        repeat
                if (nama <> Nasabah[j].Username) then
                        begin
                                cekUsername2b:= FALSE;
                                j:=j+1;
                        end
                else
                        begin
                                cekUsername2b := TRUE;
                                i:=j;
                        end;
        until (cekUsername2b = TRUE) or (j = 101);
end;

function cekUsername2a : boolean;
 {I.S: function mendapat username dari Nasabah
  F.S: function melakukan pengecekan username yang tersedia}
var
        j : integer;
begin
        cekUsername2a := FALSE;
        for j:=1 to 100 do
                begin
                        if ( nama = Nasabah[j].Username ) then
                                begin
                                        cekUsername2a := TRUE;
                                end;
                        if ( Nasabah[j].Username = '0' ) then
                                begin
                                        i:=j;
                                end;
                end;
end;


procedure tampilan2b;
 {I.S: procedure menampilkan isian username
  F.S: nasabah menginputkan username}
var
        kembali : integer;
begin
        clrscr;
	write('Username: ');	readln(nama);
	cekUsername2b;		//pengecekan username
        if (cekUsername2b = FALSE) then
                begin
                        writeln('username tidak ditemukan');
                        writeln('silahkan coba lagi');
                        readln;
                        tampilan2b;
                end
        else
                begin
                        tampilan3;
                end;
end;


procedure tampilan2a;
 {I.S: meminta nasabah untuk mengisi data
  F.S: nasabah dapat menginput data untuk registrasi}
begin
	clrscr;
        write('silahkan masukan username: ');			readln(nama);
        cekUsername2a;
        if (cekUsername2a = TRUE) then
                begin
                        writeln('=======================================');
                        writeln(' ');
                        writeln('maaf, username tidak tersedia. silahkan memilih username lain');
                        readln;
                        tampilan2a;
                end
        else
                begin
                        Nasabah[i].Username := nama;
                        writeln('======================================');
                        writeln(' ');
                        writeln('Selamat, username tersedia');
                        writeln(' ');
                        writeln('Untuk melanjutkan, tekan "ENTER"');
                        readln;
                        clrscr;
	                write('masukan nama anda: ');				readln(Nasabah[i].Nama);
	                write('masukan Jenis Perusahaan anda: ');	        readln(Nasabah[i].JU);
	                write('masukan banyaknya pinjaman anda: ');	        readln(Nasabah[i].BPinjam);
	                write('masukan tanggal awal peminjaman: ');	        readln(Waktu[i].Tanggal);
	                write('masukan bulan awal peminjaman: ');	        readln(Waktu[i].Bulan);
                        write('masukan tahun awal peminjaman: ');	        readln(Waktu[i].Tahun);
                        tampilan3;
                end;

end;


procedure tampilan1;
 {I.S: Menampilkan pilihan kepada nasabah dengan cara apa nasabah login
  F.S: Nasabah dapat login dengan salah satu dari 2 cara}
begin
        clrscr;
	writeln('Selamat datang di Aplikasi Dana Pinjam Usaha');
	writeln('--------------------------------------------');
	writeln('                                            ');
	writeln('Silahkan Sign-in dari salah satu cara dibawah ini: ');
	writeln('1. Registrasi');
	writeln('2. Login');
        writeln('3. Keluar Program');
        writeln(' ');
        write('Pilihan: ');
end;


procedure tabSetor;
 {I.S: procedure menerima berapa banyak setoran dari Nasabah
  F.S: procedure memproses setoran}
var
	kembali : integer;
        jawab   : char;
begin
        clrscr;
	write('silahkan masukan jumlah nominal yang ingin disetorkan: ');	readln(setor);
        writeln(' ');
        writeln('anda memasukkan setoran senilai: Rp.',setor);
        writeln('lanjutkan? Y/N');
        readln(jawab);
        if (jawab = 'N') then
                begin
                 repeat
                        write('silahkan masukkan jumlah setoran: ');      readln(setor);
                        writeln('anda memasukkan setoran senilai: Rp.',setor);
                        writeln('Lanjutkan? Y/N');
                        readln(jawab);
                 until ( jawab = 'Y');
                end;
        clrscr;
        Nasabah[i].BPinjam:=Nasabah[i].BPinjam - setor;
        writeln('Terima kasih. setoran anda telah diterima');
        writeln(' ');
	writeln('kembali, ketik "9" ');
	readln(kembali);
	while (kembali <> 9) do
		begin
                        writeln('===================================');
			writeln('nomor yang anda masukan salah');
                        readln(kembali);
		end;
	tampilan3;
end;

procedure tabSisa;
 {I.S: procedure mendapat input angka 2 dari Nasabah
  F.S: procedure menampilkan Sisa Saldo Nasabah}
var
        kembali : integer;
begin
        clrscr;
        writeln('Saldo yang harus Anda bayar saat ini adalah : Rp.',Nasabah[i].BPinjam:0:0);
        writeln(' ');
        writeln(' ');
        writeln(' ');

        writeln('kembali, ketik "9" ');
	readln(kembali);
	while (kembali <> 9) do
		begin
                        writeln('===================================');
			writeln('nomor yang anda masukan salah');
                        readln(kembali);
		end;
	tampilan3;
end;

procedure tabJadwal;
 {I.S: procedure menerima input nomer '3' dari user
  F.S: procedure menampilkan sisa tenggat waktu peminjaman}
var
        kembali , tanggal2 , bulan2 , tahun2      : integer;
        Denda   : Real;

begin
        clrscr;

        write('Masukkan tanggal hari ini: ');         readln(tanggal2);
        write('Masukkan bulan hari ini: ');           readln(bulan2);
        write('Masukkan tahun hari ini: ');           readln(tahun2);

        Tenggat_Waktu:= ((tanggal2 + (bulan2*30) + (tahun2*365)) - (Waktu[i].Tanggal + (Waktu[i].Bulan*30) + (Waktu[i].Tahun*365)));
        if (Tenggat_Waktu > 364) then
                Denda:= 0.25 * Nasabah[i].BPinjam
        else
                Denda:= 0;

        Nasabah[i].BPinjam := Nasabah[i].BPinjam + Denda;
        Waktu[i].Tanggal := tanggal2;
        Waktu[i].Bulan := bulan2;
        Waktu[i].Tahun := tahun2;

        writeln('=======================================');
        writeln(' ');
        write('Sisa Waktu untuk Pelunasan tersisa: ',Tenggat_Waktu:0:0);
        writeln(' ');
        writeln(' ');
        writeln(' ');
        writeln('====================================================');
	writeln('ingin kembali? ketik "9" ');
	readln(kembali);
	while (kembali <> 9) do
		begin
			writeln('nomor yang anda masukan salah');
                        write('Silahkan input nomor: ');        readln(kembali);
		end;
	tampilan3;
end;

procedure tabDelete;
 {I.S: procedure mendapat input angka 4 dari Nasabah
  F.S: procedure mengosongkan Akun Nasabah}
begin
        clrscr;
        writeln('akun anda: ',Nasabah[i].Nama,' dengan perusahaan: ',Nasabah[i].JU,' berhasil ditutup. ');
        writeln(' Tekan "Enter" Untuk Melanjutkan');
        Nasabah[i].Nama := '';
        Nasabah[i].Username := '0';
        Nasabah[i].JU := '';
        Nasabah[i].BPinjam := 0;
        Waktu[i].Tanggal := 0;
        Waktu[i].Bulan := 0;
        Waktu[i].Tahun := 0;
        readln;
end;


procedure tabLogout;
 {I.S: procedure mendapatkan nomor 5 dari Nasabah
  F.S: procedure akan mengeluarkan akun Nasabah / Logout}
begin
        clrscr;
        writeln('Anda telah keluar dari akun anda');
        writeln('==================================');
        writeln(' ');
        writeln('Tekan "ENTER" untuk melanjutkan');
        readln;
	tampilan1;
end;

procedure PilihanMenuUtama;
 {I.S: procedure menerima panggilan dari program
  F.S: procedure menampilan procedure yang dipilih user}
begin
        readln(pilihan);
	case pilihan of
	 '1' : tabSetor;
	 '2' : tabSisa;
	 '3' : tabJadwal;
	 '4' : tabDelete;
	 '5' : tabLogout;
         end;
end;


procedure resetAll;
 {I.S: tak terdefinisi
  F.S: procedure me-reset semua array Username menjadi 0}
var
        j:integer;
begin
        for j:=1 to 100 do
                begin
                        Nasabah[j].Username := '0';
                end;
end;

{Program Utama}
BEGIN
        clrscr;
        i:=1;
        resetAll;
        repeat
                selesai := FALSE;
                repeat
                        tampilan1;
                        readln(login);
                until (login = 1) or (login = 2) or (login = 3);
                if (login = 1) then
                        begin
                                tampilan2a;
                                repeat
                                        PilihanMenuUtama;
                                until (pilihan = '4') or (pilihan = '5');
                        end
                else if (login = 2) then
                        begin
                                tampilan2b;
                                repeat
                                        PilihanMenuUtama;
                                until (pilihan = '4') or (pilihan = '5');
                        end
                else if (login = 3) then
                        begin
                                selesai:=TRUE;
                        end;
        until selesai = TRUE;

END.
