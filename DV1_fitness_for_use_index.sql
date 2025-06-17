SELECT * FROM [5-STAGING].[PBILogs] L
LEFT JOIN [5-STAGING].[PBIMeasures] M
ON L.RecordId = M.RecordId
WHERE Value = '92c5013b-10e0-4b15-94e6-3b5132ea9b8e'
ORDER BY CreationDate;