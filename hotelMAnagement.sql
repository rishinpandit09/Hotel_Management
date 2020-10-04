create table Emp_Name_Info(
Emp_Name_ID varchar(7) PRIMARY KEY not null,
Emp_First_Name varchar(20),
Emp_Last_Name varchar(20),
constraint fk_id_employee foreign key(Emp_Name_ID) references Employee_Detail(Employee_ID)
);
create table Employee_Detail(
Employee_ID varchar(7) not null,
DOB date,
Desgination varchar(20),
primary key (Employee_ID)
);
create table Service_Info(
Service_ID varchar(7) PRIMARY KEY,
Service_Name varchar(20)
);
create table Service_Detail(
Service_Name varchar(20) PRIMARY KEY not null,
Service_Desc varchar(40),
Service_Amount integer,
constraint amt_chk check(Service_amount > 0)
);

create table Cus_Info(
Customer_ID varchar(7) PRIMARY KEY not null,
Cus_First_Name varchar(20),
Cus_Last_Name varchar(20),
constraint fk_id_customer foreign key(Customer_ID) references Customer_Detail(Customer_ID)
);
create table Customer_Detail(
Customer_ID varchar(7)  PRIMARY KEY not null,
Cus_DOB date
);
create table Room_Info(
Room_ID varchar(7) PRIMARY KEY not null,
Room_Type varchar(10),
Vacancy varchar(3),
constraint vacancy_chk check(Vacancy="Yes" or Vacany="No")
);
create table Room_Detail(
Room_Type varchar(7),
Room_Description varchar(40),
Accomodation integer,
constraint Acc_check check(accomodation > 0),
constraint fk_room_type foreign key(room_type) references room_info(room_type)
);

create table Restaurant(
Restaurant_ID varchar(7) PRIMARY KEY not null,
Meal_Type varchar(10),
Meal_Menu varchar(20)
);
create table Meal(
Amount integer,
Meal_menu varchar(20),
constraint chk_meal_amt check(amount > 0),
constraint fk_meal_menu foreign key (meal_menu) references restaurant(meal_menu)
);

create table Booking(
Booking_ID varchar(7) PRIMARY KEY not null,
Booking_Type varchar(10),
Approval varchar(3),
Check_In datetime,
Check_Out datetime,
constraint Approval check(Approval="Yes" or Approval="No")
);

create table Hotel_Admin(
Admin_ID varchar(7) PRIMARY KEY not null,
Admin_Password varchar(20) not null
);

create table Payment_Info(
Payment_ID varchar(7) PRIMARY KEY not null,
Payment_Date datetime, 
Payment_Type varchar(4),
constraint Payment_Type check(Payment_Type="cash" or Payment_Type="card"),
Payment_Amount integer,
constraint Payment_Amount_chk check(Payment_Amount > 0)
);

create table Payment_Amount_Detail(
Payment_Amount integer,
constraint Payment_Amount_chk2 check(Payment_Amount > 0),
Additional_Discount integer,
Advance_Amount integer,
constraint Additional_Discount_chk check(Additional_Discount >= 0),
constraint Advance_Amount_chk check(Advance_Amount >= 0),
constraint Payment_amt_fk foreign key (payment_amount) references payment_info(payment_amount)
);


