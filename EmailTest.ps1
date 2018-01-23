#send email
Send-MailMessage –From dude@cool.com –To email@cooldude.com –Subject "Test Email" –Body "Test E-mail (body)" -SmtpServer emailserver.com

#send to text
Send-MailMessage –From dude@cool.com –To PHONE_NUMBER@vtext.com –Subject "Test Email" –Body "Test E-mail (body)" -SmtpServer emailserver.com
