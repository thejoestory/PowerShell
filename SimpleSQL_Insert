$logDate = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$conn = New-Object System.Data.SqlClient.SqlConnection
$conn.ConnectionString = "Data Source=SERVERNAME;Initial Catalog=DBName;Integrated Security=SSPI;"
$conn.open()
$cmd = New-Object System.Data.SqlClient.SqlCommand
$cmd.connection = $conn
$cmd.commandtext = "INSERT INTO TABLE1 (col1) VALUES ('$logDate' )"
$cmd.executenonquery()
$conn.close()
