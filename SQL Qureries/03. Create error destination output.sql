use SSIS_Telecom_DB
go

create table error_destination_output (
    id int,
    imsi varchar(9),
    imei varchar(14),
    cell int,
    lac int,
    event_type varchar(1),
    event_ts datetime,
	tac varchar(8),
	snr varchar(8),
    ErrorCode int,
    ErrorColumn int
)

