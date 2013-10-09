SQLLog
======

Please read this blog post for additional information;
http://gdbgeek.wordpress.com/2013/01/23/exploring-arcgis-server-10-1-logs-part-2/

This is a command line tool used to "redirect" ArcGIS for Server logging to SQL Server for permanent storage and further analysis. The "redirect" is actually a parsing of the new ArcGIS for Server logs API for 10.1.

The tool will query the logs using the REST API and push rows to a SQL Server 2008 (or newer) database. From the database you can then analyse the log data and generate reports on things like map statistics. The create table script is included in the zip file.

The idea is to set the tool up using the Windows Task Scheduler and have it run every 24 hours. This will then build up a picture of whats happening on your server.

As per the documentation/sample supplied by Esri, the "FINE" log level is a good place to start in terms of what is logged and still useful.

If the "FINE" log level is used map service extent requests will be converted into SQL Server native geometries. The logs do not contain the spatial reference of the map service so one must be supplied. The table can then be added as a query layer to see in which areas maps are being requested.

The logs are normally cleared out after each call but this can be disabled while you are testing.
