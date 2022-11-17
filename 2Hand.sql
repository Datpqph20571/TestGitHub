create database DUAN1

go

use DUAN1

go



create table TRANGTHAISANPHAM 
(
	Idtt nvarchar(100) primary key,
	TenTrangThai nvarchar(100) not null,

);
create table THELOAI
(
	IdTheLoai varchar(10) primary key,
	TenTheLoai nvarchar(100) not null
);
create table NHANHIEU
(
	IdNhanHieu varchar(10) primary key,
	TenNhanHieu nvarchar(100) not null,
);
create table SANPHAM
(
	IdSp varchar(10) primary key,
	TenSp nvarchar(100) not null,
	NgayNhap date,
	Idtt nvarchar(100) not null,
	IdNhanHieu varchar(10) not null,
	GiaNhap float not null,
	GiaBan float not null,
	NgaySanXuat datetime
	foreign key (Idtt) references TRANGTHAISANPHAM(Idtt),
	foreign key ( IdNhanHieu ) references NHANHIEU ( IdNhanHieu)
);



create table CHITIETSANPHAM
(
	IdChiTietSanPham varchar(10) primary key,
	IdSp varchar(10) not null,
	IdTheLoai varchar(10) not null,
	TenSp nvarchar(100) not null,
	SoLuong int not null,
	GiaNhap float not null,
	GiaBan float not null,
	MauSac nvarchar(100),
	KichCo nvarchar(100),
	constraint fk_sp foreign key ( IdSp ) references SANPHAM ( IdSp ),
	constraint fk_tl foreign key ( IdTheLoai ) references THELOAI ( IdTheLoai ),
);


create table TRANGTHAI
(
	IdTrangThai varchar(10) primary key,
	TenTrangThai nvarchar(100) not null,
	-- constraint fk_tt foreign key (IdTrangThai) references NHANVIEN( IdTrangThai)
);
create table NHANVIEN 
(
	IdNhanVien varchar(10) primary key,
	MaNV varchar(10) not null unique,
	TenNV nvarchar(100),
	NgaySinh datetime,
	Email varchar(100) not null,
	SDT varchar(100) not null,
	DiaChi nvarchar(100),
	IdTrangThai varchar(10) not null ,
	ChucVu nvarchar(100),
	GioiTinh nvarchar(10),
	TK varchar(100) not null,
	MK varchar(100) not null,
	constraint fk_tt foreign key (IdTrangThai) references TRANGTHAI( IdTrangThai)
);

create table NGUOIDUNG
(
	IdNguoiDung varchar(10) primary key,
	TenND nvarchar(100),
	NgaySinh datetime,
	Email varchar(100) not null,
	SDT varchar(100) not null,
	DiaChi nvarchar(100),
	GioiTinh nvarchar(10),
	TK varchar(100),
	MK varchar(100)
);
create table HOADON 
(
	IDHD varchar(10) primary key,
	IdSp varchar(10) not null,
	TenSp nvarchar(100),
	IdNhanVien varchar(10),
	IdNguoiDung varchar(10),
	NgayTao datetime,
	DiaChi nvarchar(100),
	ThanhToan nvarchar(100),
	constraint fk_nv foreign key ( IdNhanVien ) references NHANVIEN ( IdNhanVien),
	constraint fk_nd foreign key (IdNguoiDung ) references NGUOIDUNG ( IdNguoiDung),
	constraint fk_hdsp foreign key ( IdSp ) references SANPHAM ( IdSp )
);

create table CHITIETHOADON 
(
	IDHDCT varchar(10) primary key,
	IDHD varchar(10),
	TenSP nvarchar(100),
	DonGia float,
	SoLuong int,
	constraint fk_hd foreign key ( IDHD ) references HOADON ( IDHD )
);
 insert into TRANGTHAISANPHAM(Idtt,TenTrangThai) values ('1','Tốt'),('2','Bình thường')
 insert into NGUOIDUNG(IdNguoiDung,Email,SDT) values ('ND1','nd1@gmail.com','023456781'),('ND2','nd1@gmail.com','023456781'),('ND3','nd1@gmail.com','023456781')
 insert into NHANHIEU(IdNhanHieu,TenNhanHieu) values('NH1','Adidas'),('NH2','Dior')
 insert into TRANGTHAI(IdTrangThai,TenTrangThai) values ('1',N'Tốt'),('2',N'Bình thường')
 insert into SANPHAM(IdSp,TenSp,NgayNhap,Idtt,IdNhanHieu,GiaNhap,GiaBan,NgaySanXuat) values
					('1',N'Áo thun','2022-10-20','1','NH1','1000','10000','2022-09-10')
					insert into NHANVIEN(IdNhanVien,MaNV,TenNV,NgaySinh,Email,SDT,DiaChi,IdTrangThai,ChucVu,GioiTinh,TK,MK) values 
					('NV1','011',N'Phạm Quốc Đạt','2003-08-10','datpq@gmail.com','0982023282','Thanh Hoa','1',N'Nhân Viên',N'Nam','dat123','dat123')
insert into HOADON(IDHD,IdSp,TenSp,IdNhanVien,IdNguoiDung,NgayTao,DiaChi,ThanhToan) values
					('HD04','SP1',N'Áo thun','NV1','ND1','2022-11-12',N'Hà Nội',N'Đã thanh toán')