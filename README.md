SQLLog
======

This is a command line tool used to "redirect" ArcGIS for Server logging to SQL Server for permanent storage and further analysis. The "redirect" is actually a parsing of the new ArcGIS for Server logs API for 10.1/10.2.

The tool will query the logs using the REST API and push rows to a SQL Server 2008 (or newer) database. From the database you can then analyse the log data and generate reports on things like map statistics. The create table script is included in the zip file.

The idea is to set the tool up using the Windows Task Scheduler and have it run every 24 hours. This will then build up a picture of whats happening on your server.

As per the documentation/sample supplied by Esri, the "FINE" log level is a good place to start in terms of what is logged and still useful.

If the "FINE" log level is used map service extent requests will be converted into SQL Server native geometries. The logs do not contain the spatial reference of the map service so one must be supplied. The table can then be added as a query layer to see in which areas maps are being requested.

The logs are normally cleared out after each call but this can be disabled while you are testing.

The tool takes several input which are listed below;

-logsurl = URL to the REST logs API eg http://localhost:6080/arcgis/admin/logs

-filter = Query filter eg "{'server' : '*','services' : '*','machines' : '*'}" (must be quote encased, if you require inner quotes use single quotes) 

-user = User name of a user that can query the logs eg agsadmin 

-password = Password of user that can query the logs eg spat1al 

-tokenurl = URL of REST toen service eg http://localhost:6080/arcgis/tokens 

-cleanlogs = Set to "Y" to clear out logs eg Y 

-debug = Set debug mode on or off eg N 

-dbpassword = Database password eg adm1n (if using Windows Authentication leave this parameter off)

-dbuser = Database user name eg sdeadmin (if using Windows Authentication leave this parameter off)

-dbname = Database name eg Performance 

-dbserver = Database server name eg mercator

-dbschema = Database schema (schema/owner for the SQL table, usually the same as your login or it may be "dbo" if using Windows Authentication)

-srid = Spatial Reference ID for features eg 2193
 
