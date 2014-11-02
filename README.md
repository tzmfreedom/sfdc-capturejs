# Capture Tool for Salesforce
## Description
This is capture tool for [Salesforce.com](http://www.salesforce.com/).
This tool use [PhantomJS](http://phantomjs.org/) and [CasperJS](http://casperjs.org/).

## Installation
```bash
$ git clone git@github.com:tzmfreedom/sfdc-capturejs.git
$ cd sfdc-capturejs
$ npm install
```

## Usage
```bash
$ bin/capture.sh -u "username" -p "password" -o "output filename for record ids." -e "test or prod" -q "soql"
```

Example for Production or Developer Environment.
```bash
$ bin/capture.sh -u test@example.com -p hogefuga -o out.dat -q "SELECT id FROM Profile"
```

Example for Sandbox Environment.
```bash
$ bin/capture.sh -u test@example.com.sandbox -p hogefuga -o out.dat -e test -q "SELECT id FROM Profile"
```

## License
The MIT License See [LICENSE](https://github.com/tzmfreedom/sfdc-capturejs/blob/master/LICENSE) file.