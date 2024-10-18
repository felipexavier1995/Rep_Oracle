--- Script of check status of Listener and instances.
--- The commands are execute in your Operecional System.

-----------------------------------------------------------------
/*

--- command for check your instances.

ps -ef | grep pmon

*/

-----------------------------------------------------------------
/*
--- command for check LISTENER.

lsnrctl status LISTENER
*/
-----------------------------------------------------------------
/*
--- command for stop to service listener.

lsnrctl stop LISTENE
*/
-----------------------------------------------------------------
/*
--- comman for start to service listener.

lsnrctl start LISTENE
*/
