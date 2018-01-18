--STEP 1: Create Personnel and Assignment Tables********************************************

IF OBJECT_ID('tAdminPersonnel', 'U') IS NOT NULL DROP TABLE tAdminPersonnel
create table tAdminPersonnel (
	iAdminPersonnelId int IDENTITY(1,1) NOT NULL,
	sName Varchar(106),
	sPersonId   varchar(30),
	sEmail  varchar(42)
	)
		insert tAdminPersonnel (sName, sPersonId, sEmail) select 'Scott Murray' ,'SM07R07', 'smurray@amandaco.com' 
		insert tAdminPersonnel (sName, sPersonId, sEmail) select 'Joe Henry' ,'JH07R07', 'jh@amandaco.com' 
        insert tAdminPersonnel (sName, sPersonId, sEmail) select 'Bill Friday' ,'BF07R07', 'jh@amandaco.com' 
		insert tAdminPersonnel (sName, sPersonId, sEmail) select 'Henry Jones' ,'HM07R07', 'jh@amandaco.com' 
		insert tAdminPersonnel (sName, sPersonId, sEmail) select 'Joe Less' ,'JL07R07', 'jh@amandaco.com' 
		insert tAdminPersonnel (sName, sPersonId, sEmail) select 'Lanny Turnip' ,'LT07R07', 'jh@amandaco.com' 
		insert tAdminPersonnel (sName, sPersonId, sEmail) select 'Turner Buck' ,'TL07R07', 'jh@amandaco.com' 
		insert tAdminPersonnel (sName, sPersonId, sEmail) select 'Wilder Keaton' ,'WK07R07', 'jh@amandaco.com' 
		insert tAdminPersonnel (sName, sPersonId, sEmail) select 'Anna Chapman' ,'AC07R07', 'jh@amandaco.com' 

IF OBJECT_ID('tAdminAssignment', 'U') IS NOT NULL DROP TABLE tAdminAssignment
CREATE TABLE dbo.tAdminAssignment(
	iAdminAssignmentId int IDENTITY(1,1) NOT NULL,
	sPersonId varchar(10) default '',
	sRole varchar(10) NULL, 
	sActiveYN varchar(1) default 'Y',
	sReportsToPersonId  varchar(10),
	bCanDelete bit default 1
) 
	insert tAdminAssignment (sPersonId, sRole, sActiveYN, sReportsToPersonId) select 'SM07R07', 'Supervisor','Y', '' 
	insert tAdminAssignment (sPersonId, sRole, sActiveYN, sReportsToPersonId) select 'JH07R07', 'Reviewer','Y' , 'SM07R07' 
	insert tAdminAssignment (sPersonId, sRole, sActiveYN, sReportsToPersonId) select 'BF07R07', 'Supervisor','Y' , 'HM07R07' 
	insert tAdminAssignment (sPersonId, sRole, sActiveYN, sReportsToPersonId) select 'HM07R07', 'Reviewer','Y' , 'SM07R07' 
	insert tAdminAssignment (sPersonId, sRole, sActiveYN, sReportsToPersonId) select 'JL07R07', 'Supervisor','Y', ''  
	insert tAdminAssignment (sPersonId, sRole, sActiveYN, sReportsToPersonId) select 'LT07R07', 'Reviewer','Y', 'SM07R07'  
	insert tAdminAssignment (sPersonId, sRole, sActiveYN, sReportsToPersonId) select 'TL07R07', 'Supervisor','Y', 'WK07R07'  
	insert tAdminAssignment (sPersonId, sRole, sActiveYN, sReportsToPersonId) select 'WK07R07', 'Reviewer','Y', ''  
	insert tAdminAssignment (sPersonId, sRole, sActiveYN, sReportsToPersonId) select 'AC07R07', 'Supervisor','Y', ''  
--****************************************************************************************************************
GO
