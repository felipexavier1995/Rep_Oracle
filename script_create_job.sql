--- Script for create a job

BEGIN
   DBMS_SCHEDULER.CREATE_JOB (
      job_name           => 'JOB_INSERIR_DADOS',
      job_type           => 'PLSQL_BLOCK',
      job_action         => 'BEGIN
                               INSERT INTO PESSOA (ID_PESSOA, Nome, CPF)
                               VALUES (10, ''Felipe'');
                            END;',
      start_date         => SYSTIMESTAMP,
      repeat_interval    => 'FREQ=MINUTELY; INTERVAL=1', -- Configura o job para executar a cada 5 minutos
      end_date           => NULL,
      enabled            => TRUE,
      comments           => 'Job para inserir dados na tabela PESSOA a cada 5 minutos.');
END;
/
--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
-- Fouding a job.
  
select 
	   INSTANCE_ID,
	   job_name,
	   START_DATE,
	   PROGRAM_OWNER
from user_scheduler_jobs 
where job_name like '%JOB_INSERIR_DADOS%';  --- Here we can 
--------------------------------------------------------------------------------------------------------------------------------------
