SELECT COUNT(*)
FROM [5-STAGING].[PBIMeasures]
WHERE Value = '92c5013b-10e0-4b15-94e6-3b5132ea9b8e';

SELECT DISTINCT 
L.[Operation]
FROM [5-STAGING].[PBILogs] AS L
INNER JOIN[5-STAGING].[PBIMeasures] AS M
ON L.RecordId = M.RecordId
WHERE Value = '92c5013b-10e0-4b15-94e6-3b5132ea9b8e';

SELECT 
L.[CreationDateTime],
L.[Operation],
L.[RecordId],
M.[Measure],
M.[Value]
FROM [5-STAGING].[PBILogs] AS L
INNER JOIN[5-STAGING].[PBIMeasures] AS M
ON L.RecordId = M.RecordId
WHERE Value = '92c5013b-10e0-4b15-94e6-3b5132ea9b8e'
AND Operation != 'GenerateDataflowSasToken';