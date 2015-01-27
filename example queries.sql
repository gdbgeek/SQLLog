select * from sdeadmin.RawLogs
where source = 'Basemap_FGDB_UNC.MapServer'
and message = 'End ExportMapImage'

select CONVERT(VARCHAR(10), time, 103) as Date, count(message) as Redraws
from sdeadmin.RawLogs
where source = 'Basemap_FGDB_UNC.MapServer'
and message = 'End ExportMapImage'
group by CONVERT(VARCHAR(10), time, 103)
order by CONVERT(VARCHAR(10), time, 103) desc

select distinct source
from sdeadmin.RawLogs

select COUNT(*) from sdeadmin.RawLogs

select distinct CONVERT(VARCHAR(10), time, 103) from sdeadmin.RawLogs

select CONVERT(VARCHAR(10), time, 103) as Date,datepart(hh,time) as "Hour", count(user)as "Draws", MIN(elapsed) as MinTime,MAX(elapsed) as MaxTime
from sdeadmin.RawLogs
where source = 'Basemap_FGDB_UNC.MapServer'
and message = 'End ExportMapImage'
group by CONVERT(VARCHAR(10), time, 103),datepart(hh,time)
order by CONVERT(VARCHAR(10), time, 103),datepart(hh,time) desc

select CONVERT(VARCHAR(10), time, 103) as Date,datepart(hh,time) as "Hour", count(user)as "Draws", MIN(elapsed) as MinTime,MAX(elapsed) as MaxTime
from sdeadmin.RawLogs
where source = 'Basemap_SQL.MapServer'
and message = 'End ExportMapImage'
group by CONVERT(VARCHAR(10), time, 103),datepart(hh,time)
order by CONVERT(VARCHAR(10), time, 103),datepart(hh,time) desc
