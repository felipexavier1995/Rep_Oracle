--- Script we'll checking our Diskgroup.

--- OBS: The following script and query are environment ASM.

/*
--- This will checking all diskgroups.
--- showner diskgroup with name, size and free at moment and available in porcent.

select name Diskgroup,
	   round(total_mb/1024,2) "Total_Gb",
	   round(free_mb/1024,2) "Free_GB",
	   round(((free_mb/total_mb)*100),2) "Available%" 
from v$asm_diskgroup;

*/
-------------------------------------------------------------------------------------
/*
--- the create a new diskgroup for a any instance.

create diskgroup oradata external redudancy disk 'ORCL:DATA04'; -- or any 'ORCL:DATA'

> oradata is diskgroup name
> ORCL is instance name
> DATA04 is system disk name that a new on system.

*/
-------------------------------------------------------------------------------------
/*
--- script for add new diskgroup if is ORADATA or ORAFRA. 

alter diskgroup ORADATA (or ORAFRA) add disk 'ORCL:DATA04' rebalance power 11;

*/
-------------------------------------------------------------------------------------
/*
--- script for drop and delete your content.

drop diskgroup ORA_TEST including cotents;

*/
-------------------------------------------------------------------------------------
/*
---script for delete full you diskgroup.

alter diskgroup ORADATA (or ORAFRA) drop disk 'DATA04' -- remove disk 
*/




