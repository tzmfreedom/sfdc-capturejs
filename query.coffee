program = require("commander")
program
  .version('0.0.1')
  .option('-u, --username <username>', 'Salesforce Username')
  .option('-p, --password <password>', 'Salesforce Password')
  .option('-e, --env [env_type]', 'Salesforce Environment', 'prod')
  .option('-o, --output [outputfile]', 'OutputFile')
  .option('-q, --query [soql]', 'Query', 'SELECT id FROM Profile')
  .parse(process.argv);

fs = require("fs")
jsforce = require('jsforce')
endpoint = if program.env =='test' then 'https://test.salesforce.com' else 'https://login.salesforce.com'
connectOptions = {
  loginUrl : endpoint
}
conn = new jsforce.Connection(connectOptions)
conn.login program.username, program.password, (err, res) =>
  if err
    return console.error(err)
  conn.query(program.query)
      .stream()
      .pipe(process.stdout)

