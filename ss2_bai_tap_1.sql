create database ss2_bai_tap_1;

use ss2_bai_tap_1;

create table phieu_xuat(
so_phieu_xuat int auto_increment,
ngay_xuat date not null,
don_gia_xuat double not null,
so_luong_xuat int not null,
primary key(so_phieu_xuat)
);

create table vat_tu(
ma_vat_tu int auto_increment,
ten_vat_tu varchar(50) not null,
primary key(ma_vat_tu)
);
create table chi_tiet_phieu_xuat(
id_chi_tiet_phieu_xuat int auto_increment,
so_phieu_xuat int not null,
ma_vat_tu int not null,
foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
primary key(id_chi_tiet_phieu_xuat)
);

create table phieu_nhap(
so_phieu_nhap int auto_increment,
ngay_nhap date not null,
don_gia_nhap double not null,
so_luong_nhap int not null,
primary key(so_phieu_nhap)
);

create table chi_tiet_phieu_nhap(
id_chi_tiet_phieu_nhap int auto_increment,
ma_vat_tu int not null,
so_phieu_nhap int not null,
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap),
primary key(id_chi_tiet_phieu_nhap)
);

create table don_dat_hang(
so_don_dat_hang int auto_increment,
ma_nha_cung_cap int not null,
ngay_dat_hang date not null,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap),
primary key(so_don_dat_hang)
);

create table chi_tiet_don_dat_hang(
id_chi_tiet_don_dat_hang int auto_increment,
ma_vat_tu int not null,
so_don_dat_hang int not null,
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_don_dat_hang) references don_dat_hang(so_don_dat_hang),
primary key(id_chi_tiet_don_dat_hang)
);

create table nha_cung_cap(
ma_nha_cung_cap int auto_increment,
ten_nha_cung_cap varchar(50) not null,
di_chi varchar(100),
primary key(ma_nha_cung_cap)
);

create table phone_nha_cung_cap(
ma_nha_cung_cap int not null,
phone int(10),
primary key(ma_nha_cung_cap,phone),
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);


