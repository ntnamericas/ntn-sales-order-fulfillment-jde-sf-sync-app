%dw 2.0
output text/plain
---
readUrl("classpath://queryScript/sqlScript-salesOrder-$(p('mule.env')).dwl","text/plain")