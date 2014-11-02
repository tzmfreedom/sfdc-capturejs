# Capture Tool for Salesforce
## Description
This is capture tool for [Salesforce.com](http://www.salesforce.com/).
This tool use [PhantomJS](http://phantomjs.org/) and [CasperJS](http://casperjs.org/).

## Installation
```bash
git clone git@github.com:tzmfreedom/sfdc-capturejs.git
npm install
```

## Usage
for Production or Developer Environment.
```bash
bin/capture.sh -u test@example.com -p hogefuga -o out.dat -q "SELECT id FROM Profile"
```

for Sandbox Environment.
```bash
bin/capture.sh -u test@example.com.sandbox -p hogefuga -o out.dat -q "SELECT id FROM Profile"
```