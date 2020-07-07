CREATE ROLE auditor;
SET pgaudit.role TO 'auditor';
ALTER SYSTEM SET pgaudit.role = 'auditor';
SELECT pg_reload_conf();
