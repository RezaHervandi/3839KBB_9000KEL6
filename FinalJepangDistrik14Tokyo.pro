domains
kelompok = string*
number, random, limit = integer
pil = integer
pintu = string

facts
%nondeterm suitchina(integer, string)
nondeterm tangan(integer, string)
%nondeterm turn(integer)

predicates
%nondeterm nilai_pemain(integer)
%nondeterm nilai_ai(integer)
nondeterm suit(string)
nondeterm cek(integer,integer,integer,integer,integer)
nondeterm mulai
determ anggota(kelompok)
nondeterm syarat_ulang(integer,integer,integer)
nondeterm main(integer,integer,integer)
nondeterm rand(number,limit)
%nondeterm score(integer)
%nondeterm tangan_ai(integer)
%nondeterm proses(integer)

clauses
anggota([]).
anggota([D|B]):-
	write(D),nl,
	anggota(B).

rand(Result,Max):-
	random(Real),%write(Real),
	Result=Real*Max+1,nl.%write(Result).
	
mulai :-
	write("\t\t\t\t\t<==========[ JAN - KEN - PON ]==========>"),nl,
	write("\t\t\t\t\t\tHOMPIMPAH ALA JEPANG"),nl,
	write("\t\t\t\t\t\t-------------------------------------------"),nl,
	
	write("================\\\n1.Mulai\t\t|\n2.Cara Bermain\t|\n3.Credit\t\t|\n4. Exit\t\t|\n"),
	write("================/\n===> Pilih : "),
	readln(Pil),
	suit(Pil).

syarat_ulang(P,Score,Score1):-
	P<6,
	P<>0,P>0,nl,
	main(P,Score,Score1),nl.
	
main(Z,Score,Score1):-
	write("1.Batu\n2.Gunting\n3.Kertas\n\nmasukan pilihan : "),
	readint(Player),
	rand(Rdm,3),
	cek(Player,Rdm,Z,Score,Score1),nl.%write(Z).

cek(P,M,_,_,_):-
	tangan(P,Pemain),
	write("Anda memilih : ",Pemain),nl,
	tangan(M,Musuh),
	write("Musuh memilih : ",Musuh),nl,
	nl,fail.

cek(P,M,Ulang,Score,Score1):-
			
	P=1,M=1,
	write("Hasil Seri"),nl,nl,
	Ulangs=Ulang-1,
	write("Score Pemain = ",Score,"\nScore Musuh  = ",Score1),nl,
	syarat_ulang(Ulangs,Score,Score1);
	
	P=1,M=2,
	write("Anda Menang"),nl,nl,
	Ulangs=Ulang-1,
	NewScore=Score+1,
	write("Score Pemain = ",NewScore,"\nScore Musuh  = ",Score1),nl,
	syarat_ulang(Ulangs,NewScore,Score1);
	
	P=1,M=3,
	write("Anda kalah"),nl,nl,
	Ulangs=Ulang-1,
	NewScore1=Score1+1,
	write("Score Pemain = ",Score,"\nScore Musuh  = ",NewScore1),nl,
	syarat_ulang(Ulangs,Score,NewScore1);
	
	P=2,M=1,
	write("Anda kalah"),nl,nl,
	Ulangs=Ulang-1,
	NewScore1=Score1+1,
	write("Score Pemain = ",Score,"\nScore Musuh  = ",NewScore1),nl,
	syarat_ulang(Ulangs,Score,NewScore1);
	
	P=2,M=2,
	write("Hasil seri"),nl,nl,
	Ulangs=Ulang-1,
	write("Score Pemain = ",Score,"\nScore Musuh  = ",Score1),nl,
	syarat_ulang(Ulangs,Score,Score1);
	
	P=2,M=3,
	write("Anda Menang"),nl,nl,
	Ulangs=Ulang-1,
	NewScore=Score+1,
	write("Score Pemain = ",NewScore,"\nScore Musuh  = ",Score1),nl,
	syarat_ulang(Ulangs,NewScore,Score1);
	
	P=3,M=1,
	write("Anda menang"),nl,nl,
	Ulangs=Ulang-1,
	NewScore=Score+1,
	write("Score Pemain = ",NewScore,"\nScore Musuh  = ",Score1),nl,
	syarat_ulang(Ulangs,NewScore,Score1);
	
	P=3,M=2,
	write("Anda Kalah"),nl,nl,
	Ulangs=Ulang-1,
	NewScore1=Score1+0,
	write("Score Pemain = ",Score,"\nScore Musuh  = ",NewScore1),nl,
	syarat_ulang(Ulangs,Score,NewScore1);
	
	P=3,M=3,
	write("Hasil Seri"),nl,nl,
	Ulangs=Ulang-1,
	write("Score Pemain = ",Score,"\nScore Musuh  = ",Score1),nl,
	syarat_ulang(Ulangs,Score,Score1);
	
	P<>1,P<>2,P<>3,
	write("Pilihan Tidak Sesuai Dengan Data System\nMemilih Game"),nl,nl,
	main(P,Score,Score1),Ulang=1,write("Kembali Ke Menu Awal [Y(Iya) / T(Sembarang Tombol)]? "),readchar(Lagi),Lagi='y',nl,nl,mulai;
	
	Ulang=1,write("Kembali Ke Menu Awal [Y(Iya) / T(Sembarang Tombol Untuk Mengakhiri Game)]? "),readchar(Lagi),Lagi='y',nl,nl,mulai.

suit(X):-
	X="1",
	write("Main Berapa Kali Brayy ? "),
	readint(P),
	Score=0,
	Score1=0,
	syarat_ulang(P,Score,Score1);

	X="2",
	write("Permaian Batu Gunting Kertas Merupakan Suit Jepun"),nl,
	write("Petunjuk Permainan :\n\n\t\t[ BATU ]"),nl,nl,
	write("1. Batu Vs Batu\t\t: Draw Atau Seri\n2. Batu Vs Gunting\t\t: Batu Menang\n3. Batu Vs Kertas\t\t: Batu Kalah\n\n\t\t[ GUNTING ]\n"),nl,
	write("1. Gunting Vs Gunting\t: Draw Atau Seri\n2. Gunting Vs Batu\t\t: Gunting Kalah\n3. Gunting Vs Kertas\t: Gunting Menang\n\n\t\t[ KERTAS ]\n"),nl,
	write("1. Kertas Vs Kertas\t\t: Draw Atau Seri\n2. Kertas Vs Gunting\t: Kertas Kalah\n3. Kertas Vs Batu\t\t: Kertas Menang"),nl,
	write("\nKembali Ke Menu Awal [Y(Iya) / T(Sembarang Tombol Untuk Berhenti]? "),
	readchar(Lagi),
	Lagi='y',nl,nl,
	mulai;
	
	X="3",
	nl,
	anggota(["Dony Ramadhan\t\t [ 1515015066 ]","Mahathir Muhammad\t [ 1515015070 ]","Reza Hervandi\t\t [ 1515015076 ]","Ardan\t\t\t [ 1515015124 ]"]),nl,nl,
	write("Kembali Ke Menu Awal [Y (Iya) / T(Sembarang Tombol)]? "),
	readchar(Lagi),
	Lagi='y',nl,nl,
	mulai;
	
	X="4",
	write("Sayonara Nee - Chan T,T"),nl,nl;
	
	X<>"1",X<>"2",X<>"3",X<>"4",
	write("Tidak Ada Di Pilihan Senpai"),nl,
	write("Kembali Ke Menu Awal [Y (Iya) / T(Sembarang Tombol Untuk Berhenti)]? "),
	readchar(Lagi),
	Lagi='y',nl,nl,
	mulai.	
goal
consult("suitchina.chi"),
mulai.