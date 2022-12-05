create database Nhom8
use Nhom8

--Tạo bảng NHANVIEN

Create table NHANVIEN(
	MaNV varchar(10),
	TenNV nvarchar(50),
	SDT varchar(20),
	NgaySinh date,
	ChucVu nvarchar(50),
	primary key(MaNV)
) 
Go

--Bảng NHANVIEN: MaNV, TenNV, SDT, NgaySinh, ChucVu 
insert into NHANVIEN values('NV001', N'Trần Khánh Huyền', '0936454361', '2002-09-15', N'Thu ngân')
insert into NHANVIEN values('NV002', N'Nguyễn Thị Thảo Quyên', '0339947486', '2002-09-18', N'Order')
insert into NHANVIEN values('NV003', N'Nguyễn Tiểu Khuyên', '0935939933', '2002-11-18', N'Thu ngân')
insert into NHANVIEN values('NV004', N'Võ Minh Toàn', '0934990690', '2002-09-16', N'Order')
SELECT * FROM NHANVIEN

--Tạo bảng NHACUNGCAP
Create table NHACUNGCAP 
(
	MaNCC varchar(10),
	TenNCC nvarchar(100),
	SDTNCC varchar(20),
	DiaChi nvarchar(100),
	STK varchar(15)
	Primary key(MaNCC)
)
Go

--Bảng NHACUNGCAP: MaNCC, TenNCC, SDTNCC, DiaChi, STK 
insert into NHACUNGCAP values('NCC001', N'Nguyên liệu há cảo Xuân Thịnh', '02835176969', N'22-24 Hoa Phượng, Phường 2, Quận Ngũ Hành Sơn, TP Đà Nẵng', '213678120987')
insert into NHACUNGCAP values('NCC002', N'Công ty TNHH Vua an toàn', '02862708787', N'08 Đường Lê Tấn Quốc, Phường 13, Quận Tân Bình, TP.HCM', '145267980043')
insert into NHACUNGCAP values('NCC003', N'Nguyên liệu Nguyên An', '0899909018', N'Số 101 Đường số 45, Phường 06, Quận 4, TP.HCM', '514234780012')
insert into NHACUNGCAP values('NCC004', N'Công ty đường Phú Khang - Best Barista', '02866605898', N'971 Trần Xuân Soạn, Phường Tân Hưng, Quận 7, TP.HCM', '198023457167')
select * from NHACUNGCAP

--Tạo bảng MonAn
Create table MonAN
(
	MaMon varchar(10),
	TenMon nvarchar(50),
	DonGia numeric(10,0),
	SoLuong numeric(10,0)
	primary key(MaMon)
) 
Go

--Bảng MonAn: MaMon,TenMon,DonGia,SoLuong
insert into MonAN values('M001', N'Há cảo chiên', '23000', 3)
insert into MonAN values('M002', N'Hoành Thánh', '29000', 4)
insert into MonAN values('M003', N'Thắng dền', '29000', 5)
insert into MonAn values('M004', N'Mỳ Há Cảo', '29000', 7)
select * from MonAN

--Tao bảng NGUYENLIEU
Create table NGUYENLIEU
(
	MaHang varchar(10),
	TenHang nvarchar(100),
	DVT nvarchar(10),
	SoLuong numeric(10,0),
	DonGia numeric(10,0),
	ChietKhau numeric(10,0)
	primary key(MaHang),
) 

--Nguyen Lieu: MaHang, TenHang,DVT,SoLuong,DonGia,chietkhau

insert into NGUYENLIEU values('H001', N'Há cảo', N'Gói', '100', '69000', '0')
insert into NGUYENLIEU values('H002', N'Đào ngâm Kronos 820g', N'Lon', '50', '62000', '0')
insert into NGUYENLIEU values('H003', N'Nhãn ngâm nước đường 560g', N'lon', '20', '49000', '0')
insert into NGUYENLIEU values('H004', N'Vải thiều Thanh Hà 565g', N'Lon', '25', '25000', '0')
select * from NGUYENLIEU

insert into NGUYENLIEU values('H005', N'Há cảo', N'Gói', '100', '69000', '0')
insert into NGUYENLIEU values('H006', N'Dầu Ăn Tường An', N'Chai', '100', '69000', '0')
insert into NGUYENLIEU values('H007', N'Bột kem sữa S-Creamer 1kg', N'Gói', '100', '69000', '0')


--Tạo bảng ORDER1
Create table DAT
(
	MaHD varchar(50),
	MaNV varchar(10),
	NgayVHD date,
	GioVao time,
	SoBan varchar(2),
	TongTien numeric(15,0),
	Primary key(MaHD),
	Foreign key(MaNV) references NHANVIEN
) 
Go

SELECT * FROM NHANVIEN
--BangDat
insert into DAT values('100006', 'NV001', '2022/07/01', '07:45', '07', '46000')
insert into DAT values('100007', 'NV001', '2022/07/02', '13:02', '27', '80000')
insert into DAT values('100008', 'NV002', '2022/09/05', '13:02', '27', '98000')
insert into DAT values('100009', 'NV002', '2022/05/06', '13:02', '27', '150000')
select * from DAT

--Tạo bảng ORDER_CHI TIẾT
Create table DAT_CHI_TIET
(
	MaHD varchar(50),
	MaMon varchar(10),
	SoLuong numeric(10,0),
	ThanhTien numeric(15,0)
	Foreign key(MaMon) references MonAn,
	foreign key (MaHD) references DAT(MaHD)
) 
GO


insert into DAT_CHI_TIET values('100001', 'M001', '1', '23000')
insert into DAT_CHI_TIET values('100001', 'M001', '1', '23000')
insert into DAT_CHI_TIET values('100002', 'M002', '1', '30000')
SELECT * FROM DAT_CHI_TIET

--Tạo bảng NHẬP
Create table NHAP
(
	MaNH varchar(50),
	MaNCC varchar(10),
	NgayNH date,
	TongTH numeric(15,0),
	TongCK numeric(15,0),
	Primary key(MaNH),
	Foreign key(MaNCC) references NHACUNGCAP
) 
GO

insert into NHAP values('DNH0001', 'NCC001', '2022/12/31', '6900000', '0')
insert into NHAP values('DNH0002', 'NCC002', '2022/10/31', '3100000', '0')
select * from NHAP

--Tạo bảng NHAP_CHI_TIET
Create table NHAP_CHI_TIET
(
	MaNH varchar(50),
	MaHang varchar(10),
	SoLuong numeric(10,0),
	ThanhTien numeric(15,0)
	Foreign key(MaHang) references NGUYENLIEU,
	foreign key (MaNH) references NHAP
) 

insert into NHAP_CHI_TIET values('DNH0001', 'H001', '100', '6900000')
insert into NHAP_CHI_TIET values('DNH0002', 'H002', '50', '3100000')
insert into NHAP_CHI_TIET values('DNH0003', 'H033', '50', '7500000')
select * from NHAP_CHI_TIET

Create table MONCHEBIEN
(
	MaCB varchar(10),
	MaMon varchar(10),
	SoLuongMon numeric(10,0),
	Primary key(MaCB),
	Foreign key(MaMon) references MonAn
) 
insert into MONCHEBIEN values ('CB001','M001',2)
insert into MONCHEBIEN values ('CB002','M002',2)
insert into MONCHEBIEN values ('CB003','M001',2)
select * from MonAN

Create table NGUYENLIEUCHEBIEN
(
	MaCB varchar(10),
	MaHang varchar(10),
	SoLuongHang numeric(10,0),
	foreign key(MaCB) references MONCHEBIEN,
	foreign key(MaHang) references NGUYENLIEU
)
INSERT INTO NGUYENLIEUCHEBIEN VALUES ('CB001', 'H001',2)
INSERT INTO NGUYENLIEUCHEBIEN VALUES ('CB002', 'H002',2)
INSERT INTO NGUYENLIEUCHEBIEN VALUES ('CB001', 'H003',2)
SELECT * FROM NGUYENLIEUCHEBIEN





