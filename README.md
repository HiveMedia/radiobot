ShoutIRC RadioBot Cookbook
=================
[![Build Status](https://travis-ci.org/HiveMedia/radiobot.svg?branch=master)](https://travis-ci.org/HiveMedia/radiobot) [![Code Climate](https://codeclimate.com/github/HiveMedia/radiobot/badges/gpa.svg)](https://codeclimate.com/github/HiveMedia/radiobot) [![Test Coverage](https://codeclimate.com/github/HiveMedia/radiobot/badges/coverage.svg)](https://codeclimate.com/github/HiveMedia/radiobot)

The ShoutIRC RadioBot cookbook is designed to allow users a simple and easy to understand way of installing the ShoutIRC radiobot on their servers whiel still having full control over the settings of the radiobot

Currently this cookbook only supports the AutoDJ plugin of RadioBot

Attributes
----------
#### radiobot::default

All attributes are inline with the configuration settings of RadioBot which can be found here
http://wiki.shoutirc.com/index.php/Configuration:Base

All settings are set out as "radiobot->***section_name***->***setting_name***"

e.g.
```json
{
  "default_attributes": {
	"radiobot": {
	  "base": {
		"reg_name": "YourUserNameHere-TP-********************************",
		"reg_key": "****-**********",
        "nick": "MyRadioBotNick"
	  },
	},
  },
}
```

Usage
-----
#### radiobot::default

Just include `radiobot` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[radiobot]"
  ]
}
```

Contributing
------------

Want to join in on the fun and help? You can do so by doing the following,

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Liam Haworth <liam.haworth@hivemedia.net.au>

The license is Apache v2 which can be found in the LICENSE file
