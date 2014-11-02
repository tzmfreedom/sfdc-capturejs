fs = require('fs')
casper = require('casper').create({
  viewportSize:{
    width: 1280
    height: 800
  }
})
username = casper.cli.options.un
password = casper.cli.options.pw
endpoint = if casper.cli.options.env == 'test' then "https://test.salesforce.com" else "https://login.salesforce.com"
infile = if casper.cli.options.infile then casper.cli.options.infile else 'profilelist.dat'

casper.start()
casper.open endpoint, {
  method: "post"
  data :{
    un: username
    pw: password
  }
}

stream = fs.open(infile, 'r')
casper.then ->
  @wait 3000, ->
    domain = /https:\/\/(.+?\.salesforce\.com)/.exec(@getCurrentUrl())
    # @echo domain[1]
    while !stream.atEnd()
      line = stream.readLine();
      if line == '' then continue
      @thenOpen "https://#{domain[1]}/#{line}", do (line)=>
        return =>
          @capture "#{line}.png"
          @echo @getCurrentUrl()

casper.run()