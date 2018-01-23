#
# Date: 5/8/2014
# Dev: thejoestory
# Purpose: Dump all tables from specified SQL Server database to CSV
# Notes: Change the Server, Database and extract file location as needed
#

$server = "SERVERNAME\INSTANCE"
$database = "DATABASE_NAME"
$tablequery = "SELECT name from sys.tables"

#Declare Connection Variables
$connectionTemplate = "Data Source={0};Integrated Security=SSPI;Initial Catalog={1};"
$connectionString = [string]::Format($connectionTemplate, $server, $database)
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = $connectionString

$command = New-Object System.Data.SqlClient.SqlCommand
$command.CommandText = $tablequery
$command.Connection = $connection

#Load up the Tables in a dataset
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $command
$DataSet = New-Object System.Data.DataSet
$SqlAdapter.Fill($DataSet)
$connection.Close()



# Loop through all tables and export a CSV of the Table Data
foreach ($Row in $DataSet.Tables[0].Rows)
{
    $queryData = "SELECT * FROM [$($Row[0])]"
    
    #Specify the output location of your dump file
    $extractFile = "C:\mssql\export\$($Row[0]).csv"
    
    $command.CommandText = $queryData
    $command.Connection = $connection

    $SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
    $SqlAdapter.SelectCommand = $command
    $DataSet = New-Object System.Data.DataSet
    $SqlAdapter.Fill($DataSet)
    $connection.Close()

    $DataSet.Tables[0]  | Export-Csv $extractFile -NoTypeInformation
}
