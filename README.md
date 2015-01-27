=====================================================================
SQLLog
=====================================================================

Copyright (C) 2015 Trevor Hart

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses

=====================================================================

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

-incremental = Runs in incremental mode set to "Y" to use
 
