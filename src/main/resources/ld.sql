# SYSTEM TABLES
create table USER(
	ID int unsigned not null auto_increment,
	primary key (ID),
    USERNAME varchar(64) not null unique,
    PASSWD varchar(64) not null,
    NAME varchar(64) not null,
    NUM varchar(64) null,
    DEPART varchar(64) null,
    ROLE int unsigned not null,
    AUTH int unsigned not null,
    CTIME datetime null,
    LTIME datetime null,
    STATE int unsigned not null,
    index idx_user (USERNAME(64))
);

create table MESSAGE(
    ID int unsigned not null auto_increment,
    primary key (ID),
    CTIME datetime not null,
    NTIME datetime not null,
    TYPE int not null,
    USERID int unsigned not null,
    CONTENT varchar(256) null,
    STATE int null
);

# ROOM TABLES
create table ROOM(
	ID int unsigned not null auto_increment,
	primary key (ID),
    ROOM_NUMBER varchar(64) not null unique,
    TYPE varchar(64) null,
    AREA double null,
    RENT int null,
    STATE int null,
    COMM varchar(256) null,
    index idx_room (ROOM_NUMBER(64))
);

create table ROOM_STATE(
	ID int unsigned not null auto_increment,
	primary key (ID),
    ROOM_NUMBER varchar(64) not null unique,
    ROOM_ID int null,
    CUS_ID int null,
    CUS_NAME varchar(64) null,
    STATE int null,
    index idx_room (ROOM_NUMBER(64))
);

create table ROOM_ITEM(
	ID int unsigned not null auto_increment,
	primary key (ID),
    ROOM_ID int null,
    ITEM_ID int null,
    TYPE varchar(64) null,
    TAG varchar(64) null,
    COMM varchar(64) null,
    STATE int null,
    index idx_room_item (ROOM_ID),
    index idx_room_item2 (ITEM_ID)
);

create table ROOM_PIC(
	ID int unsigned not null auto_increment,
	primary key (ID),
    ROOM_ID int null,
    TYPE int unsigned null,
    CTIME datetime null, 
    NAME varchar(64) null,
    TAG varchar(64) null,
    PATH varchar(256) null,
    index idx_room_pic (ROOM_ID)
);

create table ROOM_METER(
	ID int unsigned not null auto_increment,
	primary key (ID),
    ROOM_ID int null,
    TYPE int unsigned null,
    METER_NUMBER varchar(64) null unique,
    YEAR_INIT_VAL double null,
    LAST_MONTH_VAL double null,
    CUR_VAL double null,
    CUR_TIME datetime null,
    index idx_room_meter (ROOM_ID),
    index idx_number_meter (METER_NUMBER)
);

## GUEST TABLES
create table GUEST(
	ID int unsigned not null auto_increment,
	primary key (ID),
	GUEST_NAME varchar(64) null,
	ROOM_NUMBER varchar(64) null,
	ROOM_TYPE varchar(64) null,
	CONTRACT_NUMBER varchar(64) null,
	TEL varchar(64) null,
	COMPANY varchar(64) null,
	TITLE varchar(64) null,
	PERSONS int null,
	COMING int null,
	PARKING varchar(64) null,
	CAR varchar(64) null,
	COMMENT varchar(256) null,
	CHARGE double null,
	TIMEIN datetime null,
	TIMEOUT datetime null,
	SYS_STATE int null,
	index idx_guest_name (GUEST_NAME(64)),
	index idx_guest_room (ROOM_NUMBER(64)),
    index idx_guest_contract (CONTRACT_NUMBER(64))
);

create table HOST(
	ID int unsigned not null auto_increment,
	primary key (ID),
	GUEST_ID int unsigned null,
	HOST_NAME varchar(64) null,
	RENT_CHARGE double null,
	SERVICE_CHARGE double null,
	RETURN_MONEY double null,
	OTHER_CHARGE double null,
	SYS_STATE int null,
	index idx_host_guest (GUEST_ID)
);

create table INTERN(
	ID int unsigned not null auto_increment,
	primary key (ID),
	GUEST_ID int unsigned null,
	LE_1 double null,
	LE_2 double null,
	LE_3 double null,
	LE_SERVICE double null,
	IN_1 double null,
	IN_2 double null,
	IN_3 double null,
	IN_SERVICE double null,
	SYS_STATE int null,
	index idx_intern_guest (GUEST_ID)
);

create table GUEST_BALANCE(
	ID int unsigned not null auto_increment,
	primary key (ID),
	GUEST_ID int unsigned null,
	ROOM_NUMBER varchar(64) null,
	CHARGE_DAY int null,
	CHARGE_TURN int null,
	CHARGE_WAY varchar(64) null,
	RETURN_DAY int null,
	RETURN_TURN int null,
	INVOICE_DAY int null,
	INVOICE_TURN int null,
	INVOICE_AHEAD int null,
	SYS_STATE int null,
	index idx_guest_balance_id (GUEST_ID),
	index idx_guest_balance_room (ROOM_NUMBER(64))
);

create table GUEST_SERVICE(
	ID int unsigned not null auto_increment,
	primary key (ID),
	GUEST_ID int unsigned null,
	ROOM_NUMBER varchar(64) null,
	NAME varchar(64) null,
	LECHARGE double null,
	LECOUNT int null,
	SPCHARGE double null,
	SPCOUNT int null,
	TURN int null,
	COMMENT varchar(256),
	FREE int null,
	SYS_STATE int null,
	index idx_guest_service_id (GUEST_ID),
	index idx_guest_service_room (ROOM_NUMBER(64))
);

## FACILITIES TABLES
create table FAC_STA(
	ID int unsigned not null auto_increment,
	primary key (ID),
    FAC_NUMBER varchar(64) null unique,
    COMMENT varchar(64) null,
    NAME varchar(64) null,
    COMPANY varchar(64) null,
    TYPE varchar(64) null,
    CAT varchar(64) null,
    TOTAL int null,
    BAD int null,
    FREE int null,
    WORKING int null,
    index idx_fac_sta (FAC_NUMBER(64))
);

create table GROCERY_ITEM(
	ID int unsigned not null auto_increment,
	primary key (ID),
    NAME varchar(64) null unique,
    TYPE varchar(64) null,
    CAT varchar(64) null,
    TOTAL int null,
    TOTAL_LOSS int null,
    TOTAL_SOLD int null,
    TOTAL_BENIFIT double null,
    AVALIABLE int null,
    BUY_MONEY double null,
    SELL_MONEY double null,
    index idx_grocery_item (NAME(64))
);

## PLAN TABLES
create table PLAN(
	ID int unsigned not null auto_increment,
	primary key (ID),
    NAME varchar(64) null unique,
    CTIME datetime null,
    MONEY double null,
    STAFF varchar(64) null,
    COMMENT varchar(64) null,
    index idx_plan_name (NAME(64))
);

create table PLAN_DETAIL(
	ID int unsigned not null auto_increment,
	primary key (ID),
    PLAN_ID int null,
    FAC_ID int null,
    TOTAL int null,
    ALREADY int null,
    ALL_MONEY double null,
    COMMENT varchar(64) null,
    index idx_plan_detail (PLAN_ID)
);

create table INVOICE(
	ID int unsigned not null auto_increment,
	primary key (ID),
    NUM varchar(64) null,
    PLAN_ID int null,
    MONEY double null,
    CTIME datetime null,
    TERM int null,
    OTHERS varchar(64) null,
    index idx_invoice (PLAN_ID)
);

create table INVOICE_DETAIL(
	ID int unsigned not null auto_increment,
	primary key (ID),
    INV_ID int null,
    ITEM varchar(64) null,
    TOTAL int null,
    ALL_MONEY double,
    index idx_invoice_detail (INV_ID)
);

## BALANCE TABLES
create table PLAN_PROGRESS(
	ID int unsigned not null auto_increment,
	primary key (ID),
    TIME datetime null,
    PLAN_ID int null,
    FAC_ID int null,
    TERM int null,
    TOTAL int null,
    STAFF varchar(64) null,
    ALL_MONEY double null,
    COMMENT varchar(64) null,
    index idx_plan_progress (PLAN_ID)
);

create table DAILY_SERVICE(
	ID int unsigned not null auto_increment,
	primary key (ID),
	TYPE int null,
	ROOM_NUMBER varchar(64) not null,
	GUEST_NAME varchar(64) not null,
	ITEM varchar(64) null,
	COUNT int null,
	MONEY double null,
	COMMENT varchar(128),
    RTIME datetime null,
    index idx_daily_service (ROOM_NUMBER(64))
);

create table SOURCES(
	ID int unsigned not null auto_increment,
	primary key (ID),
    ROOM_NUMBER varchar(64) null,
    GUEST_NAME varchar(64) null,
    TIME datetime null,
    TYPE int null,
    METER varchar(64) null,
    LAST_DATA double null,
    CURRENT_DATA double null,
    COUNT double null,
    MONEY double null,
    index idx_source (ROOM_NUMBER(64))
);

create table CONTRACT_INCOME(
	ID int unsigned not null auto_increment,
	primary key (ID),
	ROOM_NUMBER varchar(64) null,
    GUEST_NAME varchar(64) null,
    TIME datetime null,
    RECEIVE double null, 
    PAY double null,
    BENIFIT double null,
    index idx_contract_income (ROOM_NUMBER(64))
);

create table GROCERY_RUNNING(
	ID int unsigned not null auto_increment,
	primary key (ID),
    CTIME datetime null,
    ITEM_ID int null,
    TOTAL int null,
    PER_MONEY double null,
    ALL_MONEY double null,
    TYPE int null,
    index idx_grocery_running (ITEM_ID)
);

create table MAINTAIN(
	ID int unsigned not null auto_increment,
	primary key (ID),
	ROOM_NUMBER varchar(64) null,
    STIME datetime null,
    FTIME datetime null,
    ETIME datetime null,
    LEVEL int null,
    PROBLEM varchar(256) null,
    PRO_TYPE int null,
    PRO_CAUSE int null,
    COMMENT varchar(64) null,
    PIC varchar(256) null,
    CHARGE double null,
    TIMES int null,
    DEPART varchar(64) null,
    FOLLOW varchar(256) null,
    STATE int null,
    PAY bool null,
    index idx_maintain (ROOM_NUMBER(64))
);

create table MAINTAIN_FOLLOW(
	ID int unsigned not null auto_increment,
	primary key (ID),
	ROOM_NUMBER varchar(64) null,
	MAIN_ID int null,
	DETAIL varchar(256),
	COMMENT varchar(256),
	DOING varchar(256),
	index idx_maintain_follow (ROOM_NUMBER(64)),
	index idx_maintain_follow_mid (MAIN_ID)
)