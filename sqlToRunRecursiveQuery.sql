--Run this, and see that 3 people report to Scott Murray in the Hierarchy Column, and one of them has their own report
--and Wilder Keaton has one report
 WITH OrgChartData AS(  
 SELECT pdisBoss.sName, 0 as Elevel, cast(pdisBoss.sName as varchar(max)) Hierarchy, 
        cast('' as varchar(106)) as ReportsTo, Boss.iAdminAssignmentId, Boss.sPersonId, Boss.sReportsToPersonId  
 FROM tAdminAssignment Boss inner join tAdminPersonnel pdisBoss on Boss.sPersonId = pdisBoss.sPersonId 
 WHERE len(Boss.sReportsToPersonId) = 0 
 UNION ALL 
 SELECT pdisEmp.sName, EL.Elevel + 1,  Hierarchy + '~~' + pdisEmp.sName as Hierarchy,
        pdisBoss2.sName as ReportsTo, Emp.iAdminAssignmentId, Emp.sPersonId, Emp.sReportsToPersonId  
 FROM tAdminAssignment Emp inner join tAdminPersonnel pdisEmp on Emp.sPersonId = pdisEmp.sPersonId 
                             inner join tAdminPersonnel pdisBoss2 on Emp.sReportsToPersonId = pdisBoss2.sPersonId 
 inner JOIN OrgChartData as EL ON Emp.sReportsToPersonId = EL.sPersonId 
 and len(Emp.sReportsToPersonId) != 0  
 ) 
 SELECT * FROM OrgChartData order by Hierarchy 
  option(maxrecursion 0)

/*
Hierarchy Column
Anna Chapman
Joe Less
Scott Murray
Scott Murray...Henry Jones
Scott Murray...Henry Jones...Bill Friday
Scott Murray...Joe Henry
Scott Murray...Lanny Turnip
Wilder Keaton
Wilder Keaton...Turner Buck
*/

/*
STEP 3:
   Run this to make Scott Murray report to Anna Chapman:
      update tAdminAssignment set sReportsToPersonId = 'AC07R07' where sPersonId = 'SM07R07'
   
   Rerun Step 2, and see that the recursive query attaches Scott Murray's reporting tree to Anna Chapman
   the Hierarchy results changes to:
Anna Chapman
Anna Chapman~~Scott Murray
Anna Chapman~~Scott Murray~~Henry Jones
Anna Chapman~~Scott Murray~~Henry Jones~~Bill Friday
Anna Chapman~~Scott Murray~~Joe Henry
Anna Chapman~~Scott Murray~~Lanny Turnip
Joe Less
Wilder Keaton
Wilder Keaton~~Turner Buck
   
  This is very powerful; it offloads the hierarchy calculation to SQL Server. 
  We have to query SQL anyway to get the Assignment List; we might as well let it calculate the hierarchy
 
  This solution is fast and dynamic.
  
  */
