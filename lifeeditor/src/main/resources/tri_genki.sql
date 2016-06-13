use LE01
go
drop trigger genki
drop trigger degenki
go
create trigger genki on genkiBar_list
after insert
as
begin
declare @targetID int
declare @userID int
declare @genkiBarTol int
set @targetID = (select targetID from inserted)
set @userID = (select userID from target_list where targetID=@targetID)
set @genkiBarTol = (select genkiBarTol from user_spec where userID = @userID)
update target set genkiBar +=1 where targetID=@targetID
update user_spec set genkiBarTol += 1 where userID = @userID
if @genkiBarTol = 100
begin
update user_spec set level +=1 where userID = @userID
update user_spec set genkiBarTol = 0 where userID =@userID
END
end
go
create trigger degenki on genkiBar_list
after delete
as
begin
declare @targetID int
declare @userID int
declare @genkiBarTol int
set @targetID = (select targetID from deleted)
set @userID = (select userID from target_list where targetID=@targetID)
set @genkiBarTol = (select genkiBarTol from user_spec where userID = @userID)
update target set genkiBar -=1 where targetID=@targetID
update user_spec set genkiBarTol -= 1 where userID = @userID
if @genkiBarTol < 0
begin
update user_spec set level -=1 where userID = @userID
update user_spec set genkiBarTol = 99 where userID =@userID
END
end
go
